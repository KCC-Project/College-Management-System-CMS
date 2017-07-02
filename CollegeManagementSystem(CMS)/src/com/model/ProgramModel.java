package com.model;

public class ProgramModel {
	private int program_id;
	private String program_name;
	private int faculty_id;
	private int status;

	public ProgramModel() {
		super();
	}

	public ProgramModel(int program_id, String program_name, int faculty_id, int status) {
		super();
		this.program_id = program_id;
		this.program_name = program_name;
		this.faculty_id = faculty_id;
		this.status = status;
	}

	public int getProgram_id() {
		return program_id;
	}

	public void setProgram_id(int program_id) {
		this.program_id = program_id;
	}

	public String getProgram_name() {
		return program_name;
	}

	public void setProgram_name(String program_name) {
		this.program_name = program_name;
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
	
	

}
