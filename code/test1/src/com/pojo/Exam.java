package com.pojo;

public class Exam {
	private String examId;
	private String title;
	private String score;
	private String time;
	private String userId;
	
	public String getExamId() {
		return examId;
	}
	public void setExamId(String string) {
		this.examId = string;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
