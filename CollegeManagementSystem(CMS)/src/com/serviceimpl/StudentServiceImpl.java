package com.serviceimpl;

import java.util.List;

import com.dao.StudentModelInterface;
import com.daoimpl.StudentModelImpl;
import com.model.StudentModel;
import com.service.StudentServiceInterface;

public class StudentServiceImpl implements StudentServiceInterface {

	StudentModelInterface model = new StudentModelImpl();

	public boolean save(StudentModel studentModel) {
		return model.save(studentModel);

	}

	@Override
	public List<StudentModel> getAllRecord() {
		
		return model.getAllRecord();
	}

	@Override
	public StudentModel readId(int id) {
		return model.readId(id);
	}

	@Override
	public int delete(int id) {
		return model.delete(id);
	}

	@Override
	public int update(StudentModel stu) {
		return model.update(stu);
	}

}
