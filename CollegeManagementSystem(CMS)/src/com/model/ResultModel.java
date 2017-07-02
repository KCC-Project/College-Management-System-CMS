package com.model;

public class ResultModel {
	private int studentId;
	private int examId;
	private int studentExamMarks;
	private int isAttended;
	private int passFailStatus;
	public ResultModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResultModel(int studentId, int examId, int studentExamMarks, int isAttended, int passFailStatus) {
		super();
		this.studentId = studentId;
		this.examId = examId;
		this.studentExamMarks = studentExamMarks;
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
	@Override
	public String toString() {
		return "ResultModel [studentId=" + studentId + ", examId=" + examId + ", studentExamMarks=" + studentExamMarks
				+ ", isAttended=" + isAttended + ", passFailStatus=" + passFailStatus + "]";
	}
	public int getStudentExamMarks() {
		return studentExamMarks;
	}
	public void setStudentExamMarks(int studentExamMarks) {
		this.studentExamMarks = studentExamMarks;
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

}
