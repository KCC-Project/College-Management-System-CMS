package com.serviceimpl;

import java.util.List;

import com.dao.SemesterModelInterface;
import com.daoimpl.SemesterModelImpl;
import com.model.SemesterModel;
import com.service.SemesterServiceInterface;

public class SemesterServiceImpl implements SemesterServiceInterface {
	
	SemesterModelInterface model = new SemesterModelImpl(); // Semester dao Object
	
	//Service Implementation, add semester into Database passing semesterModel
	public boolean addSemester(SemesterModel semesterModel) {
		return model.addSemester(semesterModel);
	}

	// Retrieving all the semester data from database
	public List<SemesterModel> getAllRecord() {
		return model.getAllRecord();
	}

	@Override
	public SemesterModel loadByProgramId(int program_id) {
		return model.loadByProgramId(program_id);
	}

}
