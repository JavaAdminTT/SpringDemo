package com.restful.service;

import java.util.List;

import com.restful.beans.City;

public interface CityService {

	public List<City> queryCitys();
	
	public City queryCity(Integer ID);
	
	public void createCity(City city);
	
	public void updateCity(City city,Integer ID);
	
	public void deleteCity(Integer ID);
}
