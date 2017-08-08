package com.model;

public class Student_Fee_AmountModel {
	private int Student_Fee_Amount_id;
	private int student_id;
	private int fee_amount;
	public Student_Fee_AmountModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student_Fee_AmountModel(int student_Fee_Amount_id, int student_id, int fee_amount) {
		super();
		Student_Fee_Amount_id = student_Fee_Amount_id;
		this.student_id = student_id;
		this.fee_amount = fee_amount;
	}
	public int getStudent_Fee_Amount_id() {
		return Student_Fee_Amount_id;
	}
	public void setStudent_Fee_Amount_id(int student_Fee_Amount_id) {
		Student_Fee_Amount_id = student_Fee_Amount_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getFee_amount() {
		return fee_amount;
	}
	public void setFee_amount(int fee_amount) {
		this.fee_amount = fee_amount;
	}
	@Override
	public String toString() {
		return "Student_Fee_AmountModel [Student_Fee_Amount_id=" + Student_Fee_Amount_id + ", student_id=" + student_id
				+ ", fee_amount=" + fee_amount + "]";
	}
	
}
