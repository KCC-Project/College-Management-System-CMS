package com.model;

public class ExamModel {
	private String examTypeName;
	private int examId;
	
	private String summary;
	public ExamModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamModel(String examTypeName, int examId,  String summary) {
		super();
		this.examTypeName = examTypeName;
		this.examId = examId;
		
		this.summary = summary;
	}
	public String getExamTypeName() {
		return examTypeName;
	}
	public void setExamTypeName(String examTypeName) {
		this.examTypeName = examTypeName;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	@Override
	public String toString() {
		return "ExamModel [examTypeName=" + examTypeName + ", examId=" + examId + ",  summary="
				+ summary + "]";
	}
	
	
}
