package com.dao;

import java.util.List;

import com.model.StudentSemesterModel;

public interface StudentSemesterModelInterface {

	public List<StudentSemesterModel> searchByFields(Object[] obj);
}
