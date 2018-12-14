package com.seyong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seyong.beans.User;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request) {
		
		System.out.println(user);
		
		request.setAttribute("user", user);
		
		return "success";
	}
}
