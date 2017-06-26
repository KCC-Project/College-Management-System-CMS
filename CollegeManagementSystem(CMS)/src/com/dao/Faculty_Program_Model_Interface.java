package com.dao;

import java.util.List;

import com.model.Faculty_ProgramModel;
import com.model.StudentModel;

public interface Faculty_Program_Model_Interface {
	
	///this method is for extracting faculty from database
	List<Faculty_ProgramModel> getAllRecord();
	
	//this method is for extracting program from database with faculty id
	List<Faculty_ProgramModel> getAllRecord(int id);
}
