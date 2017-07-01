package com.dao;

import java.util.List;

import com.model.StudentExamModel;

public interface StudentExamModelInterface {
	boolean saveInformation(StudentExamModel model);

	List<StudentExamModel> getAllRecord();

	StudentExamModel readId(int id);

	int delete(int id);

	boolean update(StudentExamModel model);
}
