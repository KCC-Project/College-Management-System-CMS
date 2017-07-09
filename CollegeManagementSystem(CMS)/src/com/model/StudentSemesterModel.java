package com.model;

public class StudentSemesterModel {
	private int studentId;
	private int semesterId;
	private int isCompleted;
	private int classId;
	private int status;
	public StudentSemesterModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentSemesterModel(int studentId, int semesterId, int isCompleted, int classId, int status) {
		super();
		this.studentId = studentId;
		this.semesterId = semesterId;
		this.isCompleted = isCompleted;
		this.classId = classId;
		this.status = status;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getSemesterId() {
		return semesterId;
	}
	public void setSemesterId(int semesterId) {
		this.semesterId = semesterId;
	}
	public int getIsCompleted() {
		return isCompleted;
	}
	public void setIsCompleted(int isCompleted) {
		this.isCompleted = isCompleted;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "StudentSemesterModel [studentId=" + studentId + ", semesterId=" + semesterId + ", isCompleted="
				+ isCompleted + ", classId=" + classId + ", status=" + status + "]";
	}
	
}
