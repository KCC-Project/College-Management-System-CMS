package com.serviceimpl;

import java.util.List;

import com.dao.StudentExamModelInterface;
import com.daoimpl.StudentExamModelImpl;
import com.model.StudentExamModel;
import com.service.StudentExamModelServiceInterface;


public class StudentExamModelServiceImpl implements StudentExamModelServiceInterface {
StudentExamModelInterface inter= new StudentExamModelImpl();
	
	public boolean saveInformation(StudentExamModel model) {
		return inter.saveInformation(model);
	}

	
	public List<StudentExamModel> getAllRecord() {
		return inter.getAllRecord();
	}

	
	public StudentExamModel readId(int id) {
		return inter.readId(id);
		
	}

	
	public int delete(int id) {
		return inter.delete(id);
	}

	
	public boolean update(StudentExamModel model) {
		return inter.update(model);
	}

}
