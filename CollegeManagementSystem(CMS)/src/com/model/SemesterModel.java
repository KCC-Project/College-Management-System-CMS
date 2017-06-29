package com.model;

import java.util.Date;

public class SemesterModel {
	private int semester_id;
	private int semester_no;
	private int program_id;
	private int batch_year;
	private Date start_date;
	private Date end_date;
	private int status;
	
	// Default Constructor
	public SemesterModel() {
		
	}
	
	// Constructor using fields
	public SemesterModel(int semester_id, int semester_no, int program_id, int batch_year, Date start_date, Date end_date, int status) {
		super();
		this.semester_id = semester_id;
		this.semester_no = semester_no;
		this.program_id = program_id;
		this.batch_year = batch_year;
		this.start_date = start_date;
		this.end_date = end_date;
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

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
