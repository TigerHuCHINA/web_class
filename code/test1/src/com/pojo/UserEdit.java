package com.pojo;

import java.io.File;

//用户基本个人信息-季宇恒
public class UserEdit extends User {
	private String usex;
	private File uheadphoto;
	private String ubirthday;
	private String uProvince;
	private String uCity;
	private String uschool;
	private String uprofession;
	private String uintroduce;

	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public File getUheadphoto() {
		return uheadphoto;
	}
	public void setUheadphoto(File uheadphoto) {
		this.uheadphoto = uheadphoto;
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
	public String getUbirthday() {
		return ubirthday;
	}
	public void setUbirthday(String ubirthday) {
		this.ubirthday=ubirthday;
	}
	public String getUprovince() {
		return uProvince;
	}
	public void setUprovince(String uProvince) {
		this.uProvince = uProvince;
	}
	public String getUcity() {
		return uCity;
	}
	public void setUcity(String uCity) {
		this.uCity = uCity;
	}
}
//季宇恒