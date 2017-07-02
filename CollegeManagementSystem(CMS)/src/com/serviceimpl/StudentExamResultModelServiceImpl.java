package com.serviceimpl;

import java.util.List;

import com.dao.StudentExamResultModelInterface;
import com.daoimpl.StudentExamResultModelImpl;
import com.model.StudentExamResultModel;
import com.service.StudentExamResultModelServiceInterface;


public class StudentExamResultModelServiceImpl implements StudentExamResultModelServiceInterface {
StudentExamResultModelInterface inter= new StudentExamResultModelImpl();
	
	public boolean saveInformation(StudentExamResultModel model) {
		return inter.saveInformation(model);
	}

	
	public List<StudentExamResultModel> getAllRecord() {
		return inter.getAllRecord();
	}

	
	public StudentExamResultModel readId(int id) {
		return inter.readId(id);
		
	}

	
	public int delete(int id) {
		return inter.delete(id);
	}

	
	public boolean update(StudentExamResultModel model) {
		return inter.update(model);
	}

}
