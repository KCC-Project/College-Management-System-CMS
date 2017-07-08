package com.dao;

import java.util.List;

import com.model.StudentModel;

public interface StudentModelInterface {
	public boolean save(StudentModel studentModel);
	List<StudentModel> getAllRecord();
	StudentModel readId(int id);
	int delete(int id);
	int update(StudentModel stu);
	List<StudentModel> searchByField(Object obj);
}
