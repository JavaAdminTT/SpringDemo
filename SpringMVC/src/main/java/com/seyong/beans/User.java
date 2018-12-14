package com.seyong.beans;


public class User {

	private String userName;
	private String password;
	private Integer age;
	private String gender;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public User(String userName, String password, Integer age, String gender) {
		super();
		this.userName = userName;
		this.password = password;
		this.age = age;
		this.gender = gender;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password + ", age=" + age + ", gender=" + gender + "]";
	}

}
