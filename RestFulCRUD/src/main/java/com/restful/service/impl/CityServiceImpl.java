package com.restful.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.restful.beans.City;
import com.restful.dao.CityDao;
import com.restful.service.CityService;


@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityDao cityDao;

	@Override
	public List<City> queryCitys() {
		return cityDao.queryCitys();
	}

	@Override
	public City queryCity(Integer ID) {
		return cityDao.queryCity(ID);
	}

	@Override
	public void createCity(City city) {
		cityDao.createCity(city);
	}

	@Override
	public void updateCity(City city, Integer ID) {
		cityDao.updateCity(city, ID);
	}

	@Override
	public void deleteCity(Integer ID) {
		cityDao.deleteCity(ID);
	}
}
