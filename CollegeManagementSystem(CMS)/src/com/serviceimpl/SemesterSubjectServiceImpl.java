package com.serviceimpl;

import java.util.List;

import com.dao.SemesterSubjectModelInterface;
import com.daoimpl.SemesterSubjectModelImpl;
import com.model.SemesterSubjectModel;
import com.service.SemesterSubjectServiceInterface;

public class SemesterSubjectServiceImpl implements SemesterSubjectServiceInterface {
	SemesterSubjectModelInterface model = new SemesterSubjectModelImpl();
	public List<SemesterSubjectModel> searchByField(Object[] obj){
		return model.searchByField(obj);
	}
}
