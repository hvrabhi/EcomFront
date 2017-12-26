package org.spring.controller;

import org.spring.DAO.CategoryDAO;
import org.spring.DAO.SupplierDAO;
import org.spring.model.Category;
import org.spring.model.Supplier;
import org.spring.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class admincontroller {

	@Autowired
	 private SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
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

}

