package com.pojo;

public class Question extends Exam {
	private String qId;
	private String qContent;
	private String empty;
	public String getqId() {
		return qId;
	}
	public void setqId(String string) {
		this.qId = string;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getEmpty() {
		return empty;
	}
	public void setEmpty(String string) {
		this.empty = string;
	}
}
