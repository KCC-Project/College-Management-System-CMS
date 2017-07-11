package com.service;

import java.util.List;

import com.model.SemesterSubjectModel;

public interface SemesterSubjectServiceInterface {
	public List<SemesterSubjectModel> searchByField(Object[] obj);
}
