package com.model;

public class SubjectModel {
	private int subject_id;
	private String subjectName;
	private String subjectCode;
	private int subjectCredit;
	private int status;
	public SubjectModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SubjectModel(int subject_id, String subjectName, String subjectCode, int subjectCredit, int status) {
		super();
		this.subject_id = subject_id;
		this.subjectName = subjectName;
		this.subjectCode = subjectCode;
		this.subjectCredit = subjectCredit;
		this.status = status;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public int getSubjectCredit() {
		return subjectCredit;
	}
	public void setSubjectCredit(int subjectCredit) {
		this.subjectCredit = subjectCredit;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "SubjectModel [subject_id=" + subject_id + ", subjectName=" + subjectName + ", subjectCode="
				+ subjectCode + ", subjectCredit=" + subjectCredit + ", status=" + status + "]";
	}

}
