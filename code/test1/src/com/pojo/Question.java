package com.pojo;

public class Question extends Exam {
	private String qId;

	private String eId;
	private String qContent;
	private String qScore;
	private String qAnalysis;
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
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getqScore() {
		return qScore;
	}
	public void setqScore(String score) {
		this.qScore = score;
	}
	public String getqAnalysis() {
		return qAnalysis;
	}
	public void setqAnalysis(String analysis) {
		this.qAnalysis = analysis;
	}
	public String getEmpty() {
		return empty;
	}
	public void setEmpty(String empty) {
		this.empty = empty;
	}
}
