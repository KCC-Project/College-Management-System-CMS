package com.serviceimpl;

import java.util.List;

import com.dao.SubjectModelInterface;
import com.daoimpl.SubjectModelImpl;
import com.model.SemesterModel;
import com.model.SubjectModel;
import com.service.SubjectModelServiceInterface;

public class SubjectModelServiceImpl implements SubjectModelServiceInterface {
SubjectModelInterface inter= new SubjectModelImpl();
	@Override
	public List<SubjectModel> getAllrecord() {
		return inter.getAllrecord();
	}
	@Override
	public List<SubjectModel> searchByFields(Object[] obj){
		return inter.searchByFields(obj);
	}

}
