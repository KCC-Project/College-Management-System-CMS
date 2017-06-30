package com.service;

import java.util.List;

import com.model.SemesterModel;

public interface SemesterServiceInterface {
	
	// requesting the services to semesterServiceImpl
	public boolean addSemester (SemesterModel semesterModel);
	public List<SemesterModel> getAllRecord();  
	public List<SemesterModel> loadByProgramId(int program_id);
}
