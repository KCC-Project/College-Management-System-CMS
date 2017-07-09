package com.serviceimpl;

import java.util.List;

import com.dao.ProgramModelInterface;
import com.daoimpl.ProgramModelInterfaceImpl;
import com.model.ProgramModel;
import com.service.ProgramServiceInterface;

public class ProgramServiceImpl implements ProgramServiceInterface {
	
	ProgramModelInterface model = new ProgramModelInterfaceImpl();
	
	public List<ProgramModel> getAllRecord() {
		return model.getAllRecord();
	}

	@Override
	public ProgramModel getRecordById(int id) {
		return model.getRecordById(id);
	}

}
