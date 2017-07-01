package com.model;

public class StudentExamModel {
	private int studentId;
	private int examId;
	private int examMarks;
	private int isAttended;
	private int passFailStatus;
	public StudentExamModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentExamModel(int studentId, int examId, int examMarks, int isAttended, int passFailStatus) {
		super();
		this.studentId = studentId;
		this.examId = examId;
		this.examMarks = examMarks;
		this.isAttended = isAttended;
		this.passFailStatus = passFailStatus;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getExamMarks() {
		return examMarks;
	}
	public void setExamMarks(int examMarks) {
		this.examMarks = examMarks;
	}
	public int getIsAttended() {
		return isAttended;
	}
	public void setIsAttended(int isAttended) {
		this.isAttended = isAttended;
	}
	public int getPassFailStatus() {
		return passFailStatus;
	}
	public void setPassFailStatus(int passFailStatus) {
		this.passFailStatus = passFailStatus;
	}
	@Override
	public String toString() {
		return "StudentExamModel [studentId=" + studentId + ", examId=" + examId + ", examMarks=" + examMarks
				+ ", isAttended=" + isAttended + ", passFailStatus=" + passFailStatus + "]";
	}

}
