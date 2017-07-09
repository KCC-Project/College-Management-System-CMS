package com.model;

public class FacultyModel {
	private String faculty_name;
	private int faculty_id;
	private int status;

	public FacultyModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacultyModel(String faculty_name, int faculty_id, int status) {
		super();
		this.faculty_name = faculty_name;
		this.faculty_id = faculty_id;
		this.status = status;
	}

	public String getFaculty_name() {
		return faculty_name;
	}

	public void setFaculty_name(String faculty_name) {
		this.faculty_name = faculty_name;
	}

	public int getFaculty_id() {
		return faculty_id;
	}

	public void setFaculty_id(int faculty_id) {
		this.faculty_id = faculty_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "FacultyModel [faculty_name=" + faculty_name + ", faculty_id=" + faculty_id + ", status=" + status + "]";
	}

}
