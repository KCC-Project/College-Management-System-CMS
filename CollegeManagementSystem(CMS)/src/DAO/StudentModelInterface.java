package DAO;

import java.util.List;

import Model.StudentModel;

public interface StudentModelInterface {
	public boolean save(StudentModel studentModel);
	List<StudentModel> getAllRecord();
	StudentModel readId(int id);
	int delete(int id);
	int update(StudentModel stu);
}
