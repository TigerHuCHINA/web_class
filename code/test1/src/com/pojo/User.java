package com.pojo;

public class User {
	private String uid;
	private String uname;
	private String upwd;
	private String usex;
	private String uheadphoto;
//	private String ubirthday;
	private String uschool;
	private String uprofession;
	private String uintroduce;
	private Integer year;
	private Integer month;
	private Integer day;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUheadphoto() {
		return uheadphoto;
	}
	public void setUheadphoto(String uheadphoto) {
		this.uheadphoto = uheadphoto;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year=year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month=month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day=day;
	}
	public String getUbirthday() {
		return year+"-"+month+"-"+day;
	}
	
	public void setUbirthday(Integer year,Integer month,Integer day) {
		this.year=year;
		this.month=month;
		this.day=day;
	}
	public String getUschool() {
		return uschool;
	}
	public void setUschool(String uschool) {
		this.uschool = uschool;
	}
	public String getUprofession() {
		return uprofession;
	}
	public void setUprofession(String uprofession) {
		this.uprofession = uprofession;
	}
	public String getUintroduce() {
		return uintroduce;
	}
	public void setUintroduce(String uintroduce) {
		this.uintroduce = uintroduce;
	}
}
