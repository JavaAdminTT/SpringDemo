package com.seyong.tx.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.seyong.tx.dao.BookDao;

@Repository
public class BookDaoImpl implements BookDao {
	
	@Autowired
	private JdbcTemplate jdbcUtil;

	@Override
	public int queryPrice(String bookName) {
		// TODO Auto-generated method stub
		String sql = "SELECT book_price FROM book WHERE book_name = ?";
		
		return jdbcUtil.queryForObject(sql, Integer.class, bookName);
	}

	@Override
	public void updateBookStock(String bookName) {
		// TODO Auto-generated method stub
		String sql = "UPDATE book SET book_stock = book_stock -1 WHERE book_name = ? ";
		jdbcUtil.update(sql, bookName);
	}

	@Override
	public void updateUserBalance(Integer accoundId,Integer price) {
		// TODO Auto-generated method stub
		String sql = "UPDATE account SET balance = balance - ? WHERE accountid = ?";
		jdbcUtil.update(sql,price, accoundId);
	}

}
