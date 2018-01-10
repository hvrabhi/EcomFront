package com.spring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.spring.dao.CategoryDAO;
import com.spring.dao.ProductDAO;
import com.spring.dao.SupplierDAO;
import com.spring.model.Category;
import com.spring.model.Product;
import com.spring.model.Supplier;

@Controller
public class admincontroller {
static Logger logger = LoggerFactory.getLogger(admincontroller.class);
	
	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	SupplierDAO supplierDAO;

	@Autowired
	ProductDAO productDAO;
	
	
	    @RequestMapping(value="/category",  method=RequestMethod.GET)
	    public String listOfCategory(@ModelAttribute("category") Category category,  BindingResult result,  
                Model model, 
                RedirectAttributes redirectAttrs) {
	        logger.info("IN: Cateagory/list-GET");
	 
	        List<Category> categoryList = categoryDAO.list();
	        model.addAttribute("categoryList", categoryList);
	        model.addAttribute("CategoryPageClicked", "true");
	        
	       return "AdminPage";
	    }
	     
	    @RequestMapping(value="saveCategory", method=RequestMethod.POST)
	    public String addingStrategy(@Valid @ModelAttribute("category") Category category, 
	                                 BindingResult result,  
	                                 Model model, 
	                                 RedirectAttributes redirectAttrs) {
	         
	        logger.info("IN: category/add-POST");
	        	categoryDAO.saveCategory(category);
	            String message = "Category " + category.getCid() + " was successfully added";
	            model.addAttribute("message", message);
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
	
//suppliercontroller
    @RequestMapping(value="/supplier",  method=RequestMethod.GET)
    public String listOfSupplier(@ModelAttribute("supplier") Supplier supplier,  BindingResult result,  
            Model model, 
            RedirectAttributes redirectAttrs) {
        logger.info("IN: Supplier/list-GET");
 
        List<Supplier> supplierList = supplierDAO.list();
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("SupplierPageClicked", "true");
        
       return "AdminPage";
    }
    
    
	  @RequestMapping(value="saveSupplier", method=RequestMethod.POST)
	    public String addingStrategy(@Valid @ModelAttribute("supplier") Supplier supplier, 
	                                 BindingResult result,  
	                                 Model model, 
	                                 RedirectAttributes redirectAttrs) {
	         
	        logger.info("IN: supplier/add-POST");
	 
	        supplierDAO.saveSupplier(supplier);
	            String message = "Supplier " + supplier.getSid() + " was successfully added";
	            model.addAttribute("message", message);
	            return "redirect:/supplier";
	        
	    }	
	
	@RequestMapping("editsupplier/{id}")
	public String editSupplier(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
		System.out.println("editCategory");
		attributes.addFlashAttribute("supplier", this.supplierDAO.getSupplierById(id));
		return "redirect:/supplier";
	}
	@RequestMapping(value = "removesupplier/{id}")
	public String removeSupplier(@PathVariable("id") int id,RedirectAttributes attributes) throws Exception {
		supplierDAO.removeSupplierById(id);
		attributes.addFlashAttribute("DeleteMessage", "supplier has been deleted Successfully");
		return "redirect:/supplier";
	}

//productcontroller
	@RequestMapping(value="/product",method=RequestMethod.GET)
	public String getProductPage(@ModelAttribute("product") Product product,Model model)
	
	{
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("ProductPageClicked", "true");
		return "AdminPage";
		
	}
	private Path path;
	@RequestMapping(value="/saveProduct")
	public String updateproduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m, RedirectAttributes attributes){
			
		attributes.addFlashAttribute("SuccessMessage", "Product has been added/Updated Successfully");
		productDAO.saveProduct(product);
		MultipartFile file = product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + product.getPid() + ".jpg");
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

	
	@RequestMapping(value="editproduct/{id}",method=RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id,RedirectAttributes attributes)
	{
		attributes.addFlashAttribute("product", this.productDAO.getProductById(id));
		return "redirect:/product";
	   }
	
	@RequestMapping(value="removeproduct/{id}",method=RequestMethod.GET)
	public String removeProduct(@PathVariable("id") int id,RedirectAttributes attributes)
	{
		productDAO.removeProducyById(id);
		attributes.addFlashAttribute("DeleteMessage", "Product has been deleted Successfully");
		return "redirect:/product";
	   }
	
}
