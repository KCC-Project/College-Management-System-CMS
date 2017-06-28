package com.model;

public class YearModel {
	private int year_id;
	private int year;
	
	
	public YearModel(int year_id, int year) {
		super();
		this.year_id = year_id;
		this.year = year;
	}


	public YearModel() {
		
	}


	public int getYear_id() {
		return year_id;
	}


	public void setYear_id(int year_id) {
		this.year_id = year_id;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}
	
	
}
