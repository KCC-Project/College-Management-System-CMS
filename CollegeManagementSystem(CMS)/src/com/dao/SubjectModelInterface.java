package com.dao;

import java.util.List;

import com.model.SubjectModel;

public interface SubjectModelInterface {
	List<SubjectModel> getAllrecord();
	public List<SubjectModel> searchByFields(Object[] obj);
}
