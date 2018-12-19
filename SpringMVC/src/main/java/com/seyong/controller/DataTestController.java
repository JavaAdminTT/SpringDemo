package com.seyong.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.seyong.beans.User;

//@SessionAttributes(value="user")
@Controller
public class DataTestController {
	
	@RequestMapping("/map")
	public String test(ModelMap map) {
		
		map.put("user", "Tomcat");
		return "success";
	}
	
	@RequestMapping("/session")
	public String testSession(ModelMap map)  {
		
		System.out.println(map.get("user"));
		return "success";
	}

	
	@RequestMapping("/data")
	public ModelAndView update(User user) {
		
//		modelMap.addAttribute("user1", user1);
		System.out.println("This is updateMethod...");
		
		ModelAndView modelAndView = new ModelAndView("success");
		
		modelAndView.addObject("user", user);
		
		
		return modelAndView;
	}
	
	@RequestMapping("/moattr")
	public String modelTest(@ModelAttribute("user")User user) {
		
		System.out.println(user);
		return "success";
	}
	
	@ModelAttribute
	public void addUser(ModelMap map) {
		System.out.println("ModelAttribute");
		User user = new User("LIST", "1232", 15, "man");
		map.addAttribute("user", user);
	}
}
