package com.restful.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.restful.beans.City;
import com.restful.service.CityService;

@Controller
public class CtiyController {

	@Autowired
	private CityService cityService;
	
	@RequestMapping("/citys")
	public ModelAndView getAll() {
		ModelAndView view = new ModelAndView("citys");
		view.addObject("citys", cityService.queryCitys());
		return view;
	}
	
	@RequestMapping("/gotoAddPage")
	public String gotoAddPage(Map<String, Object> map) {
		map.put("command", new City());
		return "add";
	}
	
	@RequestMapping(value="/city",method=RequestMethod.POST)
	public String addCity(City city) {
		cityService.createCity(city);
		return "redirect:/citys";
	}
	
	@RequestMapping(value="/city/{ID}",method=RequestMethod.PUT)
	public String updateCity(@PathVariable("ID")Integer ID,City city) {
		cityService.updateCity(city, ID);
		return "redirect:/citys";
	}
	
	@RequestMapping(value="/city/{ID}",method=RequestMethod.GET)
	public String updateCity(@PathVariable("ID")Integer ID,Map map) {
		City city = cityService.queryCity(ID);
		map.put("command", city);
		return "update";
	}
	
	@RequestMapping(value="/city/{ID}",method=RequestMethod.DELETE)
	public String deleteCity(@PathVariable("ID")Integer ID) {
		cityService.deleteCity(ID);
		return "redirect:/citys";
	}
}
