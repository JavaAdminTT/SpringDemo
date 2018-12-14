package com.seyong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RestfulController {

	@RequestMapping(value="/user/{id}",method=RequestMethod.POST)
	public String saveUser(@PathVariable("id")Integer userId,HttpServletRequest request) {
		
		request.setAttribute("userId", "INSERT_USER"+userId);
		
		return "../../rest";
	}
	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)
	public String getUser(@PathVariable("id")Integer userId,HttpServletRequest request) {
		
		request.setAttribute("userId", "SELECT_USER"+userId);
		
		return "../../rest";
	}
	
	
	/**
	 * 该方法存在一些问题，网上资料说是因为&#￥&*# ，加上@ResponseBody后就解决了405问题可是无法跳转页面
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/user/{id}",method=RequestMethod.PUT)
	public String updateUser(@PathVariable("id")Integer userId/*,HttpServletRequest request*/) {
		
		//request.setAttribute("userId", "UPDATE_USER"+userId);
		
		System.out.println("UPDATE_USER"+userId);
		return "../../rest";
	}
	
	@ResponseBody
	@RequestMapping(value="/user/{id}",method=RequestMethod.DELETE)
	public String deleteUser(@PathVariable("id")Integer userId/*,HttpServletRequest request*/) {
		
		//request.setAttribute("userId", "DELETE_USER"+userId);
		System.out.println("DELETE_USER"+userId);
		return "../../rest";
	}
}
