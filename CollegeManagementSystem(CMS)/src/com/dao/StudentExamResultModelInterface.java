package com.dao;

import java.util.List;

import com.model.StudentExamResultModel;

public interface StudentExamResultModelInterface {
	boolean saveInformation(StudentExamResultModel model);

	List<StudentExamResultModel> getAllRecord();

	StudentExamResultModel readId(int id);

	int delete(int id);

	boolean update(StudentExamResultModel model);
}
