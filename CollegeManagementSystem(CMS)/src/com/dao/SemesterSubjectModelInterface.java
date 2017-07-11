package com.dao;

import java.util.List;

import com.model.SemesterSubjectModel;

public interface SemesterSubjectModelInterface {
	public List<SemesterSubjectModel> searchByField(Object[] obj);
}
