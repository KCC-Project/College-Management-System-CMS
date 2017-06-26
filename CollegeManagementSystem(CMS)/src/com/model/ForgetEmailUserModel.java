package com.model;

public class ForgetEmailUserModel {
	private int id;
	private String email;
	private String type;
	private String authienciationCode;
	public ForgetEmailUserModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForgetEmailUserModel(int id, String email, String type, String authienciationCode) {
		super();
		this.id = id;
		this.email = email;
		this.type = type;
		this.authienciationCode = authienciationCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAuthienciationCode() {
		return authienciationCode;
	}
	public void setAuthienciationCode(String authienciationCode) {
		this.authienciationCode = authienciationCode;
	}
	@Override
	public String toString() {
		return "ForgetEmailUserModel [id=" + id + ", email=" + email + ", type=" + type + ", authienciationCode="
				+ authienciationCode + "]";
	}
	
	

}
