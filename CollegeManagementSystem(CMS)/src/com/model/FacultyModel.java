package com.model;

public class FacultyModel {
	private String faculty_name;
	private int faculty_id;

	public FacultyModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacultyModel(int faculty_id, String faculty_name) {
		super();
		this.faculty_id = faculty_id;
		this.faculty_name = faculty_name;
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


}
