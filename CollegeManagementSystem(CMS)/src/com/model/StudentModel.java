package com.model;

import java.util.Arrays;

public class StudentModel {
	private int studentID;
	private String firstname;
	private String middlename;
	private String lastname;
	private String username;
	private String password;
	private String address;
	private int mobileNo;
	private String gender;
	private String email;
	private byte[] image;
	private String identityCard;
	private int status;
	private String verificationCode;
	public StudentModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentModel(int studentID, String firstname, String middlename, String lastname, String username,
			String password, String address, int mobileNo, String gender, String email, byte[] image,
			String identityCard, int status, String verificationCode) {
		super();
		this.studentID = studentID;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.username = username;
		this.password = password;
		this.address = address;
		this.mobileNo = mobileNo;
		this.gender = gender;
		this.email = email;
		this.image = image;
		this.identityCard = identityCard;
		this.status = status;
		this.verificationCode = verificationCode;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getMiddlename() {
		return middlename;
	}
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(int mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public String getIdentityCard() {
		return identityCard;
	}
	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getVerificationCode() {
		return verificationCode;
	}
	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	@Override
	public String toString() {
		return "StudentModel [studentID=" + studentID + ", firstname=" + firstname + ", middlename=" + middlename
				+ ", lastname=" + lastname + ", username=" + username + ", password=" + password + ", address="
				+ address + ", mobileNo=" + mobileNo + ", gender=" + gender + ", email=" + email + ", image="
				+ Arrays.toString(image) + ", identityCard=" + identityCard + ", status=" + status
				+ ", verificationCode=" + verificationCode + "]";
	}



}
