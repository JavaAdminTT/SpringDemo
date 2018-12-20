package com.restful.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.restful.beans.City;
import com.restful.dao.CityDao;

@Repository
public class CityDaoImpl implements CityDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;



	@Override
	public void createCity(City city) {
		String sql = "insert into citys(Name,CountryCode,District,Population)values(?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {city.getName(),city.getCountryCode(),city.getDistrict(),city.getPopulation()});
	}

	@Override
	public void updateCity(City city, Integer ID) {
		String sql = "update citys c set c.Name = ? ,c.CountryCode = ? , c.District = ? , c.Population = ? where c.ID = ?";
		jdbcTemplate.update(sql, new Object[] {city.getName(),city.getCountryCode(),city.getDistrict(),city.getPopulation(),ID});
	}

	@Override
	public void deleteCity(Integer ID) {
		String sql = "delete from citys where ID = ?";
		jdbcTemplate.update(sql, new Object[] {ID});
	}

	@Override
	public List<City> queryCitys() {
		String sql = "select ID,Name,CountryCode,District,Population from citys";
		
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(City.class));
	}

	@Override
	public City queryCity(Integer ID) {
		String sql = "select * from citys where ID = ?";
		Object args[] = new Object[]{ID};
		return (City)jdbcTemplate.queryForObject(sql,args,new BeanPropertyRowMapper(City.class));
	}
	
	
}
