package com.service;

import java.util.List;

import com.model.ExamInfoModel;

public interface ExamInfoModelServiceInterface {
	boolean saveExamInfo(ExamInfoModel model);

	List<ExamInfoModel> getAllExamInfo();

	boolean updateExamInfo(ExamInfoModel model);

	int deleteExamInfo(int id);
	ExamInfoModel getSelectedInfo(int id);
}
