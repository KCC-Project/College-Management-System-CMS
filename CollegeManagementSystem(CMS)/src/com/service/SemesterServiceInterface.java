package com.service;

import java.util.List;

import com.model.SemesterModel;

public interface SemesterServiceInterface {
	
	// requesting the services to semesterServiceImpl
	public boolean createSemester (SemesterModel semesterModel);
	public List<SemesterModel> getAllRecord();  
}
