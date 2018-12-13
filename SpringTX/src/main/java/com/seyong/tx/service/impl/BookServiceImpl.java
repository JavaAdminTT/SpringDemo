package com.seyong.tx.service.impl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.seyong.tx.dao.BookDao;
import com.seyong.tx.dao.impl.BookDaoImpl;
import com.seyong.tx.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDao bookDao;

	/*
	 * isolation: 事務的隔離級別
	 * propagation:指定事務的傳播行爲(Propagation.REQUIRED 坐老司機的車[默認]，Propagation.REQUIRES_NEW自己開車)
	 * 
	 * noRollbackFor: 指定那些異常不回滾
	 * rollbackFor: 指定那些異常回滾
	 * readOnly: 設置事務的只讀屬性
	 * timeout: 設置事務的過期時間
	 */
	@Transactional(noRollbackFor= {IOException.class,ClassCastException.class},
			                rollbackFor=Exception.class,
			                readOnly=false,
			                timeout=4)
	@Override
	public void checkOut(Integer accountId, String bookName) {
		// TODO Auto-generated method stub
		int price = bookDao.queryPrice(bookName);
		
		bookDao.updateBookStock(bookName);
		
		bookDao.updateUserBalance(accountId, price);
		int i = 10 / 0 ;
		
		/*如果在所有操作結束以後發生綫程阻塞等情況，spring視爲該事務正常執行*/
		try {
			Thread.sleep(4000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
