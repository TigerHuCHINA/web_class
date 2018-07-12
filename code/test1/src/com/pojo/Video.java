package com.pojo;

import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
import java.io.*;
// ”∆µ-∂≈”Ó∫Ω
public class Video {
	private String id;
	private String userId;
	private String title;
	private String introduce;
	private File file;
	private String duration;
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
	public void setFile(File file) {
		this.file = file;
	}
	public File getFile() {
		return file;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(File f) {
		Encoder encoder = new Encoder();
		try {
			MultimediaInfo m = encoder.getInfo(f);
			long ls = m.getDuration()/1000;
			int hour = (int) (ls/3600);
			int minute = (int) (ls%3600)/60;
			int second = (int) (ls-hour*3600-minute*60);
			duration = hour+"'"+minute+"''"+second+"'''";
			} catch (Exception e) {
			e.printStackTrace();
			}
	}
	/*public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}*/
}
