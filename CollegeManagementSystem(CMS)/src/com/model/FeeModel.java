package com.model;

public class FeeModel {
	private int fee_id;
	private int due_amount;
	private int student_fee_amount_id;
	private int semester_no;
	public FeeModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FeeModel(int fee_id, int due_amount, int student_fee_amount_id, int semester_no) {
		super();
		this.fee_id = fee_id;
		this.due_amount = due_amount;
		this.student_fee_amount_id = student_fee_amount_id;
		this.semester_no = semester_no;
	}
	public int getFee_id() {
		return fee_id;
	}
	public void setFee_id(int fee_id) {
		this.fee_id = fee_id;
	}
	public int getDue_amount() {
		return due_amount;
	}
	public void setDue_amount(int due_amount) {
		this.due_amount = due_amount;
	}
	public int getStudent_fee_amount_id() {
		return student_fee_amount_id;
	}
	public void setStudent_fee_amount_id(int student_fee_amount_id) {
		this.student_fee_amount_id = student_fee_amount_id;
	}
	public int getSemester_no() {
		return semester_no;
	}
	public void setSemester_no(int semester_no) {
		this.semester_no = semester_no;
	}
	@Override
	public String toString() {
		return "FeeModel [fee_id=" + fee_id + ", due_amount=" + due_amount + ", student_fee_amount_id="
				+ student_fee_amount_id + ", semester_no=" + semester_no + "]";
	}
	
	
}
