package com.model;

public class StudentSemesterModel {
	private int student_id;
	private int semester_id;
	private int is_completed;
	private int class_id;
	private int status;
	public StudentSemesterModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentSemesterModel(int student_id, int semester_id, int is_completed, int class_id, int status) {
		super();
		this.student_id = student_id;
		this.semester_id = semester_id;
		this.is_completed = is_completed;
		this.class_id = class_id;
		this.status = status;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getSemester_id() {
		return semester_id;
	}
	public void setSemester_id(int semester_id) {
		this.semester_id = semester_id;
	}
	public int getIs_completed() {
		return is_completed;
	}
	public void setIs_completed(int is_completed) {
		this.is_completed = is_completed;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
