package com.service;

import java.util.List;

import com.model.ExamModel;

public interface ExamModelServiceInterface {
	boolean saveExamType(String examName,String summary);
	List<ExamModel> getAllExamType();
	boolean updateExamType(String examName,int id);
	int deleteExamType(int id);
	String getSelectedExam(int id);
}
