package com.pojo;

public class Question extends Exam {
	private String qId;

	private String eId;
	private String qContent;
	private String score;
	private String analysis;

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
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	
}
