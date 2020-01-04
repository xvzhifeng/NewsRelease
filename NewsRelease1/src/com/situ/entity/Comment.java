package com.situ.entity;

public class Comment {

	private int NewsID;
	private String cContent;
	private String cTime;
	private String cName;
	public int getNewsID() {
		return NewsID;
	}
	public void setNewsID(int newsID) {
		NewsID = newsID;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	
	
	
	
}
