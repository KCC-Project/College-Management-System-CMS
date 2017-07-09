package com.dao;

import java.util.List;

import com.model.FacultyModel;
import com.model.Faculty_ProgramModel;

public interface FacultyModelInterface {
	List<FacultyModel> getAllRecord();
	FacultyModel getRecordById(int id);
}
