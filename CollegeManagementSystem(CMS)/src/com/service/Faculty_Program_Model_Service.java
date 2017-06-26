package com.service;

import java.util.List;

import com.model.Faculty_ProgramModel;

public interface Faculty_Program_Model_Service {
	List<Faculty_ProgramModel> getAllRecord();
	List<Faculty_ProgramModel> getAllRecord(int id);
}
