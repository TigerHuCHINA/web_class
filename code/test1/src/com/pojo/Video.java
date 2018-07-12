package com.pojo;

import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
import java.io.*;
import java.util.Date;
// ”∆µ-∂≈”Ó∫Ω
public class Video {
	private String id;
	private String userId;
	private String title;
	private String introduce;
	private File file;
	private String duration;
	private Date time;
	private InputStream is;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public InputStream getIs() {
		return is;
	}
	public void setIs(InputStream is) {
		this.is = is;
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
	public void setDuration() {
		Encoder encoder = new Encoder();
		try {
			MultimediaInfo m = encoder.getInfo(this.file);
			long ls = m.getDuration()/1000;
			int hour = (int) (ls/3600);
			int minute = (int) (ls%3600)/60;
			int second = (int) (ls-hour*3600-minute*60);
			String d = hour+"'"+minute+"''"+second+"'''";
			this.duration=d;
			} catch (Exception e) {
			e.printStackTrace();
			}
		
	}
	public void setDuration(String duration) {
		this.duration=duration;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
