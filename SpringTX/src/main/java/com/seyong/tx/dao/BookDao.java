package com.seyong.tx.dao;

public interface BookDao {
	
	public int queryPrice(String bookName);
	
	public void updateBookStock(String bookName);
	
	public void updateUserBalance(Integer accoundId,Integer price);

}
