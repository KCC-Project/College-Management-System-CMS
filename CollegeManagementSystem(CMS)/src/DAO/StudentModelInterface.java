package DAO;

import java.util.List;

import Model.StudentModel;

public interface StudentModelInterface {
	public boolean save(StudentModel studentModel);
	List<StudentModel> getAllRecord();
}
