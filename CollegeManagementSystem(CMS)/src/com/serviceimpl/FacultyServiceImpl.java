package com.serviceimpl;

import java.util.List;

import com.dao.FacultyModelInterface;
import com.daoimpl.FacultyModelInterfaceImpl;
import com.model.FacultyModel;
import com.service.FacultyServiceInterface;

public class FacultyServiceImpl implements FacultyServiceInterface {
	
	FacultyModelInterface model = new FacultyModelInterfaceImpl();
	
	public List<FacultyModel> getAllRecord() {
		return model.getAllRecord();
	}

	@Override
	public FacultyModel getRecordById(int id) {
		return model.getRecordById(id);
	}

}
