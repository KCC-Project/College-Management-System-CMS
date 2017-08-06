package com.model;

import java.util.Date;

public class FeeUpdateModel {
private int fee_update_id;
private int fee_id;
private int amount_paid;
private String bill_no;
private Date paid_date;
public FeeUpdateModel() {
	super();
	// TODO Auto-generated constructor stub
}
public FeeUpdateModel(int fee_update_id, int fee_id, int amount_paid, String bill_no, Date paid_date) {
	super();
	this.fee_update_id = fee_update_id;
	this.fee_id = fee_id;
	this.amount_paid = amount_paid;
	this.bill_no = bill_no;
	this.paid_date = paid_date;
}
public int getFee_update_id() {
	return fee_update_id;
}
public void setFee_update_id(int fee_update_id) {
	this.fee_update_id = fee_update_id;
}
public int getFee_id() {
	return fee_id;
}
public void setFee_id(int fee_id) {
	this.fee_id = fee_id;
}
public int getAmount_paid() {
	return amount_paid;
}
public void setAmount_paid(int amount_paid) {
	this.amount_paid = amount_paid;
}
public String getBill_no() {
	return bill_no;
}
public void setBill_no(String bill_no) {
	this.bill_no = bill_no;
}
public Date getPaid_date() {
	return paid_date;
}
public void setPaid_date(Date paid_date) {
	this.paid_date = paid_date;
}
@Override
public String toString() {
	return "FeeUpdateModel [fee_update_id=" + fee_update_id + ", fee_id=" + fee_id + ", amount_paid=" + amount_paid
			+ ", bill_no=" + bill_no + ", paid_date=" + paid_date + "]";
}

}
