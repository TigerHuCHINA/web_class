package com.pojo;

import java.sql.Date;

// ”∆µ-∂≈”Ó∫Ω
public class Video {
	private String id;
	private String userId;
	private String title;
	private String introduce;
	//private Date time;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	/*public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}*/
}
