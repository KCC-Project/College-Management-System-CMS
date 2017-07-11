package com.service;

import java.util.List;

import com.model.SubjectModel;

public interface SubjectModelServiceInterface {
	List<SubjectModel> getAllrecord();
	public List<SubjectModel> searchByFields(Object[] obj);
}
