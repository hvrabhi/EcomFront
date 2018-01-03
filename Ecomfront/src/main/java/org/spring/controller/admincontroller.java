package org.spring.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.nio.file.*;


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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class admincontroller {

	@Autowired
	 SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;

	private Path path;

//suppliercontroller
	 @RequestMapping(value="/supplier",method=RequestMethod.GET)
	    public String showSupplier(@ModelAttribute("supplier")Supplier supplier, BindingResult result, Model m, RedirectAttributes redirectAttrs  )
	    {
	       List<Supplier> listSupplier=supplierDAO.retrieveSupplier();    
	        m.addAttribute("supplierList",listSupplier);
	       
	        m.addAttribute("SupplierPageClicked", "true");
	        return "supplier";
	     
	    }
	 
	 @RequestMapping(value="AddSupplier",method=RequestMethod.POST)
	    public String addSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	    {
	        supplierDAO.addSupplier(supplier);
	                  
	        return "redirect:/supplier";
	    }
	 
	 @RequestMapping("editsupplier/{id}")
		public String editSupplier(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
			System.out.println("editCategory");
			attributes.addFlashAttribute("supplier", this.supplierDAO.getSupplierById(id));
			return "redirect:/supplier";
		}

		@RequestMapping(value = "removesupplier/{id}")
		public String removeSupplier(@PathVariable("id") int id,RedirectAttributes attributes) throws Exception 
		{supplierDAO.removeSupplierById(id);
			attributes.addFlashAttribute("DeleteMessage", "supplier has been deleted Successfully");
			return "redirect:/supplier";
		}
	 
//categorycontroller
	 @RequestMapping(value="/category",  method=RequestMethod.GET)
	    public String listOfCategory(@ModelAttribute("category") Category category,  BindingResult result, Model model, RedirectAttributes redirectAttrs) {
	       
		 List<Category> listCategory=categoryDAO.retrieveCategory();	    
	         model.addAttribute("categoryList",listCategory);
	         model.addAttribute("CategoryPageClicked", "true");
	        
	       return "category";
	    }
//
	 @RequestMapping(value="AddCategory",method=RequestMethod.POST)
	    public String addCategory(@ModelAttribute("category")Category category,Model m)
	    {
	        categoryDAO.addCategory(category);
	                  
	        return "redirect:/category";
	    }
	 @RequestMapping("editcategory/{id}")
		public String editCategory(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
			System.out.println("editCategory");
			attributes.addFlashAttribute("category", this.categoryDAO.getCategoryById(id));
			return "redirect:/category";
		}
	                                                      
		@RequestMapping(value ="removecategory/{id}")
		public String removeCategory(@PathVariable("id") int id,RedirectAttributes attributes) throws Exception {
			categoryDAO.removeCategoryById(id);
			attributes.addFlashAttribute("DeleteMessage", "Category has been deleted Successfully");
			return "redirect:/category";
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
		public String updateproduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m, RedirectAttributes attributes){
				
			attributes.addFlashAttribute("SuccessMessage", "Product has been added/Updated Successfully");
			productDAO.saveProduct(product);
			product.setInstock(true);
			MultipartFile file = product.getImage();
			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
			path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + product.getId() + ".jpg");
			if (file != null && !file.isEmpty()) {
				try {
					System.out.println("Image Saving Start");
					file.transferTo(new File(path.toString()));
					System.out.println("Image Saved");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error");
					throw new RuntimeException("item image saving failed.", e);
				}
			}
			return "redirect:/product";
		}	
		
		
		
		
		 @RequestMapping(value="editproduct/{id}", method=RequestMethod.GET)
			public String editProduct(@PathVariable("id") int id,RedirectAttributes attributes)
			{
				attributes.addFlashAttribute("product", this.productDAO.getProductById(id));
				return "redirect:/product";
			   }
			
			@RequestMapping(value="removeproduct/{id}",method=RequestMethod.GET)
			public String removeProduct(@PathVariable("id") int id,RedirectAttributes attributes)
			{
				productDAO.removeProductyById(id);
				attributes.addFlashAttribute("DeleteMessage", "Product has been deleted Successfully");
				return "redirect:/product";
			   }

			 @RequestMapping(value="admin",method=RequestMethod.GET)
			public String adminpage(){
				return "admin";
			}
			 @RequestMapping(value="home",method=RequestMethod.GET)
				public String homepage(){
					return "home";
				}
}

