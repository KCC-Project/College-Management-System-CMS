package com.model;

public class SemesterSubjectModel {
	int semester_id;
	int subject_id;
	
	public SemesterSubjectModel() {
		super();
	}

	public SemesterSubjectModel(int semester_id, int subject_id) {
		super();
		this.semester_id = semester_id;
		this.subject_id = subject_id;
	}
	
	
	public int getSemester_id() {
		return semester_id;
	}
	public void setSemester_id(int semester_id) {
		this.semester_id = semester_id;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}


	@Override
	public String toString() {
		return "SemesterSubjectModel [semester_id=" + semester_id + ", subject_id=" + subject_id + "]";
	}
	
	
	
}
