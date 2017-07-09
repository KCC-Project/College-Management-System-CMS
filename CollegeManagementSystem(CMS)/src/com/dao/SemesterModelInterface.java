package com.dao;

import java.util.List;

import com.model.SemesterModel;

public interface SemesterModelInterface {
	public boolean addSemester (SemesterModel semesterModel); // creating semester to insert into database
	public List<SemesterModel> getAllRecord();  // getting all semester records 
	public SemesterModel loadById(int id);
	public List<SemesterModel> searchByFields(Object[] obj);
}
