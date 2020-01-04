package com.situ.entity;
import com.situ.utils.MD5Util;
import java.io.Serializable;

public class User implements Serializable{
	
	private int id;
	private String userName;
	private String userPass="";
	private String userEmail;
	private String userBirthday;
	private String userSex;
	private int userClass;
	private String userTell;
	private String userRegister;
	private String userStatu;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass.length()==0?"":userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public int getUserClass() {
		return userClass;
	}
	public void setUserClass(int userClass) {
		this.userClass = userClass;
	}
	public String getUserTell() {
		return userTell;
	}
	public void setUserTell(String userTell) {
		this.userTell = userTell;
	}
	public String getUserRegister() {
		return userRegister;
	}
	public void setUserRegister(String userRegister) {
		this.userRegister = userRegister;
	}
	public String getUserStatu() {
		return userStatu;
	}
	public void setUserStatu(String userStatu) {
		this.userStatu = userStatu;
	}
	
	
	

}
