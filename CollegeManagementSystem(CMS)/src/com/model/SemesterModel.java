package com.model;

public class SemesterModel {
	private int semester_id;
	private int semester_no;
	private int program_id;
	private int batch_year;
	private int status;
	
	// Default Constructor
	public SemesterModel() {
		
	}
	
	// Constructor using fields
	public SemesterModel(int semester_id, int semester_no, int program_id, int batch_year, int status) {
		super();
		this.semester_id = semester_id;
		this.semester_no = semester_no;
		this.program_id = program_id;
		this.batch_year = batch_year;
		this.status = status;
	}

	public int getSemester_id() {
		return semester_id;
	}

	public void setSemester_id(int semester_id) {
		this.semester_id = semester_id;
	}

	public int getSemester_no() {
		return semester_no;
	}

	public void setSemester_no(int semester_no) {
		this.semester_no = semester_no;
	}

	public int getProgram_id() {
		return program_id;
	}

	public void setProgram_id(int program_id) {
		this.program_id = program_id;
	}

	public int getBatch_year() {
		return batch_year;
	}

	public void setBatch_year(int batch_year) {
		this.batch_year = batch_year;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
