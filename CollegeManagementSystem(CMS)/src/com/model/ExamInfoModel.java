package com.model;

import java.util.Date;

public class ExamInfoModel {
	private int examId;
	private String subjectName;
	private int subjectId;
	private int examTypeId;
	private String examTypeName;

	private Date examStartDate;
	private Date examEndDate;

	private String examStartTime;
	private String examEndTime;

	private int fullmarks;
	private int passmarks;
	private int status;
	public ExamInfoModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamInfoModel(int examId, String subjectName, int subjectId, int examTypeId, String examTypeName,
			Date examStartDate, Date examEndDate, String examStartTime, String examEndTime, int fullmarks,
			int passmarks, int status) {
		super();
		this.examId = examId;
		this.subjectName = subjectName;
		this.subjectId = subjectId;
		this.examTypeId = examTypeId;
		this.examTypeName = examTypeName;
		this.examStartDate = examStartDate;
		this.examEndDate = examEndDate;
		this.examStartTime = examStartTime;
		this.examEndTime = examEndTime;
		this.fullmarks = fullmarks;
		this.passmarks = passmarks;
		this.status = status;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getExamTypeId() {
		return examTypeId;
	}
	public void setExamTypeId(int examTypeId) {
		this.examTypeId = examTypeId;
	}
	public String getExamTypeName() {
		return examTypeName;
	}
	public void setExamTypeName(String examTypeName) {
		this.examTypeName = examTypeName;
	}
	public Date getExamStartDate() {
		return examStartDate;
	}
	public void setExamStartDate(Date examStartDate) {
		this.examStartDate = examStartDate;
	}
	public Date getExamEndDate() {
		return examEndDate;
	}
	public void setExamEndDate(Date examEndDate) {
		this.examEndDate = examEndDate;
	}
	public String getExamStartTime() {
		return examStartTime;
	}
	public void setExamStartTime(String examStartTime) {
		this.examStartTime = examStartTime;
	}
	public String getExamEndTime() {
		return examEndTime;
	}
	public void setExamEndTime(String examEndTime) {
		this.examEndTime = examEndTime;
	}
	public int getFullmarks() {
		return fullmarks;
	}
	public void setFullmarks(int fullmarks) {
		this.fullmarks = fullmarks;
	}
	public int getPassmarks() {
		return passmarks;
	}
	public void setPassmarks(int passmarks) {
		this.passmarks = passmarks;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ExamInfoModel [examId=" + examId + ", subjectName=" + subjectName + ", subjectId=" + subjectId
				+ ", examTypeId=" + examTypeId + ", examTypeName=" + examTypeName + ", examStartDate=" + examStartDate
				+ ", examEndDate=" + examEndDate + ", examStartTime=" + examStartTime + ", examEndTime=" + examEndTime
				+ ", fullmarks=" + fullmarks + ", passmarks=" + passmarks + ", status=" + status + "]";
	}
	
	
}
