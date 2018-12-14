package com.seyong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ParamTestController {

	
	@RequestMapping("/param")           // 规定接收的KEY , 是否必须携带参数 , 默认值    
	public String paramTest(@RequestParam(value="ids",required=false,defaultValue="NaN")String id,
											//获取请求头中的信息
			                              @RequestHeader("User-Agent")String ua,
			                              //获取COOKIE的值
			                              @CookieValue(value="JSESSIONID",required=false,defaultValue="no cooike")String cid) {
		
		System.out.println(id);
		System.out.println("User-Agent :" +ua);
		System.out.println("cookie:"+cid);
		
		return "success";
	}
}
