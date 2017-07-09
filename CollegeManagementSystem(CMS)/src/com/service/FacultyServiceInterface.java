package com.service;

import java.util.List;

import com.model.FacultyModel;
import com.model.Faculty_ProgramModel;

public interface FacultyServiceInterface {
	List<FacultyModel> getAllRecord();
	FacultyModel getRecordById(int id);
}
