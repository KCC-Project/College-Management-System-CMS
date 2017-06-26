package com.serviceimpl;

import java.util.List;

import com.dao.admin.Faculty_Program_Model_Interface;
import com.daoimpl.admin.Faculty_Program_Model_Interface_Impl;
import com.model.Faculty_ProgramModel;
import com.service.Faculty_Program_Model_Service;

public class Faculty_Program_Model_Service_Impl implements Faculty_Program_Model_Service {
	Faculty_Program_Model_Interface model = new Faculty_Program_Model_Interface_Impl();

	@Override
	public List<Faculty_ProgramModel> getAllRecord() {

		return model.getAllRecord();
	}

	@Override
	public List<Faculty_ProgramModel> getAllRecord(int id) {
		return model.getAllRecord(id);
	}

}
