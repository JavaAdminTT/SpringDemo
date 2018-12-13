package com.seyong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*该注解的路径支持？占位符，支持*号匹配
 * value = "/springmvc？/?/fsda"
 * value = "/spring？mvc"/**"/dfase*" 双星代表任意多层路径 ，一个星代表任意名字的单层路径
 * value = "/springmvc*"
 * */
@RequestMapping(value = "/springmvc")
@Controller
public class HelloController {

	/*
	 * params= {"abc=6","!a","def!=7"} 用来让请求更精确，就是加上了参数限制条件！！
	 * method=RequestMethod.GET 用来限制请求方式。例如：GET , POST 等 headers=
	 * {"Content-Type=image/svg+xml"} 用来限制访问的请求头
	 */
	@RequestMapping(value = "/hello"
	/*, headers= {"Content-Type=image/svg+xml"},
	 *  method=RequestMethod.GET, 
	 *  params={"abc=6","!a","def!=7"}
	 */)
	public String hello() {

		return "success";
	}
}
