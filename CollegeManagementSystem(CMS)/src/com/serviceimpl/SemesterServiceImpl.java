package com.serviceimpl;

import java.util.List;

import com.dao.SemesterModelInterface;
import com.daoimpl.SemesterModelImpl;
import com.model.SemesterModel;
import com.service.SemesterServiceInterface;

public class SemesterServiceImpl implements SemesterServiceInterface {
	
	SemesterModelInterface model = new SemesterModelImpl(); // Semester Model Object
	
	//Service Impl for inserting the data stored in the Semester Model into Database
	public boolean createSemester(SemesterModel semesterModel) {
		return model.createSemester(semesterModel);
	}

	// Retrieving all the data from Semester Model
	public List<SemesterModel> getAllRecord() {
		return model.getAllRecord();
	}

}
