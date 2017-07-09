package com.service;

import java.util.List;

import com.model.StudentSemesterModel;

public interface StudentSemesterModelServiceInterface {

	public List<StudentSemesterModel> searchByFields(Object[] obj);

}
