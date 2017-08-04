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
	public SemesterModel loadById(int id) {
		return model.loadById(id);
	}
	
	public List<SemesterModel> searchByFields(Object[] obj){
		return model.searchByFields(obj);
	}

	@Override
	public boolean update_semesterNo(int semester_id, int semester_no) {
		return model.update_semesterNo(semester_id,semester_no);
	}
}
