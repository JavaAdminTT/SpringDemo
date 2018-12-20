package com.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.restful.beans.City;
import com.restful.dao.impl.CityDaoImpl;
import com.restful.service.impl.CityServiceImpl;

public class CrudTest {
	
	ApplicationContext ioc = new ClassPathXmlApplicationContext("springmvc.xml");
	JdbcTemplate jdbcTemplate = ioc.getBean(JdbcTemplate.class);

	@Test
	public void test() {
		


		CityServiceImpl cityServiceImpl = ioc.getBean(CityServiceImpl.class);
		List<City> citys = cityServiceImpl.queryCitys();
		for (City city : citys) {
			System.out.println(city);
		}

	}

}
