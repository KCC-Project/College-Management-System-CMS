package com.model;

public class ExamModel {
	private String examTypeName;
	private int examId;
	public ExamModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamModel(String examTypeName, int examId) {
		super();
		this.examTypeName = examTypeName;
		this.examId = examId;
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
	@Override
	public String toString() {
		return "ExamModel [examTypeName=" + examTypeName + ", examId=" + examId + "]";
	}
	
}
