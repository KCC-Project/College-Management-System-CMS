package com.service;

import java.util.List;

import com.model.StudentExamResultModel;

public interface StudentExamResultModelServiceInterface {
	boolean saveInformation(StudentExamResultModel model);

	List<StudentExamResultModel> getAllRecord();

	List<StudentExamResultModel> searchByField(Object[] obj);

	int delete(int id);

	boolean update(StudentExamResultModel model);
}
