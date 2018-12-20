package com.restful.dao;

import java.util.List;

import com.restful.beans.City;

public interface CityDao {

	public List<City> queryCitys();
	
	public City queryCity(Integer ID);
	
	public void createCity(City city);
	
	public void updateCity(City city,Integer ID);
	
	public void deleteCity(Integer ID);
}
