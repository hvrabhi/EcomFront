package org.spring.controller;

import org.spring.DAO.UserDAO;
import org.spring.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexcontroller {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView landingPage(@ModelAttribute("users") Users users){
		
		
		 ModelAndView model=new  ModelAndView("index");
		 model.addObject("users",users);
		 return model;
	} 
	
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String  toregister(Model  m)
	{
		m.addAttribute("users",new Users()) ;
		 
		 return "registration";
	}
	
	
	
	@RequestMapping(value="saveUser", method=RequestMethod.POST)
	public String createUser(@ModelAttribute("users") Users users){
		users.setEnabled(true);
		users.setRole("ROLE_USER");
		userDAO.saveUser(users);
		return "redirect:/";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String gotologin()
	{
		return "login";
	}
	@RequestMapping(value="/userLogged", method=RequestMethod.POST)
	public String loggedin()
	{
		return "redirect:/home";
	}
	

}
