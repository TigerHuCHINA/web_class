package com.pojo;

public class Comment {
	private String id;
	private String userId;
	private String videoId;
	private String content;
	//private Time time;
	
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
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	/*public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}*/
}
