package com.situ.entity;


public class News {

	
	private int id;
	private String newsName;
	private String newsText;
	private String newsTime;
	private int newsCount;
	private String newsReleaseID;
	private String newsStatu;
	private int classifyID;
	private String classifyName;
	
	
	
	public String getClassifyName() {
		return classifyName;
	}
	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}
	public String getNewsStatu() {
		return newsStatu;
	}
	public void setNewsStatu(String newsStatu) {
		this.newsStatu = newsStatu;
	}
	public int getClassifyID() {
		return classifyID;
	}
	public void setClassifyID(int classifyID) {
		this.classifyID = classifyID;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNewsName() {
		return newsName;
	}
	public void setNewsName(String newsName) {
		this.newsName = newsName;
	}
	public String getNewsText() {
		return newsText;
	}
	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}
	
	public String getNewsTime() {
		return newsTime;
	}
	public void setNewsTime(String newsTime) {
		this.newsTime = newsTime;
	}
	public int getNewsCount() {
		return newsCount;
	}
	public void setNewsCount(int newsCount) {
		this.newsCount = newsCount;
	}
	public String getNewsReleaseID() {
		return newsReleaseID;
	}
	public void setNewsReleaseID(String newsReleaseID) {
		this.newsReleaseID = newsReleaseID;
	}
	
	
	
}
