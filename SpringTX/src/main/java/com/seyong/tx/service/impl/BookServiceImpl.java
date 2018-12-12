package com.seyong.tx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seyong.tx.dao.BookDao;
import com.seyong.tx.dao.impl.BookDaoImpl;
import com.seyong.tx.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDao bookDao = new BookDaoImpl();

	@Override
	public void checkOut(Integer accountId, String bookName) {
		// TODO Auto-generated method stub
		int price = bookDao.queryPrice(bookName);
		
		bookDao.updateBookStock(bookName);
		
		bookDao.updateUserBalance(accountId, price);
	}

}
