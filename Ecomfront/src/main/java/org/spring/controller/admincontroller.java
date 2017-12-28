package org.spring.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.spring.DAO.CategoryDAO;
import org.spring.DAO.ProductDAO;
import org.spring.DAO.SupplierDAO;
import org.spring.model.Category;
import org.spring.model.Product;
import org.spring.model.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class admincontroller {

	@Autowired
	 SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	
	 @RequestMapping(value="/supplier",method=RequestMethod.GET)
	    public String showSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	    {
	       m.addAttribute("supplier",new Supplier());
	         
	        return "supplier";
	     
	    }
	 
	 @RequestMapping(value="AddSupplier",method=RequestMethod.POST)
	    public String addSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	    {
	        supplierDAO.addSupplier(supplier);
	                  
	        return "redirect:/";
	    }
	 @RequestMapping(value="getsupplier",method=RequestMethod.GET)
	    public String showsupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	    { 
	        List<Supplier> listSupplier=supplierDAO.retrieveSupplier();
	    
	        m.addAttribute("supplierList",listSupplier);
	        return "getsupplier";
	    }
	 

	 @RequestMapping(value="/category",method=RequestMethod.GET)
	    public String showCategory(@ModelAttribute("category")Category category,Model m)
	    {
	       m.addAttribute("category",new Category());
	        return "category";
	     
	    }
	 @RequestMapping(value="AddCategory",method=RequestMethod.POST)
	    public String addCategory(@ModelAttribute("category")Category category,Model m)
	    {
	        categoryDAO.addCategory(category);
	                  
	        return "redirect:/";
	    }
	 
	 @RequestMapping(value="getcategory",method=RequestMethod.GET)
	    public String showcategory(@ModelAttribute("category")Category category,Model m)
	    { 
	        List<Category> listCategory=categoryDAO.retrieveCategory();
	    
	        m.addAttribute("categoryList",listCategory);
	        return "getcategory";
	    }
	 
	 @RequestMapping(value="/product",method=RequestMethod.GET)
	public String getProductPage(@ModelAttribute("product") Product product,Model model)
		
		{
		 model.addAttribute("categoryList", categoryDAO.retrieveCategory());
		model.addAttribute("supplierList", supplierDAO.retrieveSupplier());
			model.addAttribute("productList", productDAO.retrieveProduct());
			model.addAttribute("ProductPageClicked", "true");
			return "product";
			
		}

	 @RequestMapping(value="/saveProduct")
		public String updateproduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m,
				@RequestParam("file") MultipartFile file){
			
			String image=uploadFile(file);
			if(!image.isEmpty())
			{
				product.setImage(image);
				
			}
				product.setInstock(true);
				  productDAO.saveProduct(product);
			
			
	        return "redirect:/product";
		}
		
		
		
		
		
		public  String uploadFile(MultipartFile file)
		{
			String name=null;
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();

					String rootPath = System.getProperty("catalina.base");
					File dir = new File(rootPath +"Ecomfront/resources/images");
					if (!dir.exists())
						dir.mkdirs();
					  name=String.valueOf(new Date().getTime()+".jpg");
					 // Create the file on server
					File serverFile = new File(rootPath + File.separator);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					return  name;
				} catch (Exception e) {
					return "You failed to upload " + name + " => " + e.getMessage();
				}
			} else {
				return "You failed to upload " + name+ " because the file was empty.";
			}
		}

		 @RequestMapping(value="getproduct",method=RequestMethod.GET)
		    public String showproduct(@ModelAttribute("product")Product product,Model m)
		    { 
		        List<Product> listProduct=productDAO.retrieveProduct();
		    
		        m.addAttribute("productList",listProduct);
		        return "getproduct";
		    }
}

