package com.seyong.tx.beans;

public class BookStore {

	private Integer accountId;
	private double balance;
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public BookStore() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookStore(Integer accountId, double balance) {
		super();
		this.accountId = accountId;
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "BookStore [accountId=" + accountId + ", balance=" + balance + "]";
	}
	
	
}
