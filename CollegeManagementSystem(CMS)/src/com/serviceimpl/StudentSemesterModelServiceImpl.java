package com.serviceimpl;

import java.util.List;

import com.dao.StudentSemesterModelInterface;
import com.daoimpl.StudentSemesterModelImpl;
import com.model.StudentSemesterModel;
import com.service.StudentSemesterModelServiceInterface;

public class StudentSemesterModelServiceImpl implements StudentSemesterModelServiceInterface {
	StudentSemesterModelInterface inter= new StudentSemesterModelImpl();
	@Override
	public StudentSemesterModel getSelectedData(int id) {
		return inter.getSelectedData(id);
	}

}
