package com.model;

public class LoginModel {
	private int selectedIndex;
	private String userEntry;
	private String password;

	public LoginModel() {

	}

	public LoginModel(int selectedIndex, String userEntry, String password) {
		super();
		this.selectedIndex = selectedIndex;
		this.userEntry = userEntry;
		this.password = password;
	}

	public int getSelectedIndex() {
		return selectedIndex;
	}

	public void setSelectedIndex(int selectedIndex) {
		this.selectedIndex = selectedIndex;
	}

	public String getUserEntry() {
		return userEntry;
	}

	public void setUserEntry(String userEntry) {
		this.userEntry = userEntry;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
		
	}

	@Override
	public String toString() {
		return "LoginModel [selectedIndex=" + selectedIndex + ", userEntry=" + userEntry + ", password=" + password
				+ "]";
	}

}
