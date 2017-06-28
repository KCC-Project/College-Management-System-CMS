package com.dao;

import java.util.List;

import com.model.SemesterModel;

public interface SemesterModelInterface {
	public boolean createSemester (SemesterModel semesterModel); // creating semester to insert into database
	public List<SemesterModel> getAllRecord();  // getting all semester records 
	
}
