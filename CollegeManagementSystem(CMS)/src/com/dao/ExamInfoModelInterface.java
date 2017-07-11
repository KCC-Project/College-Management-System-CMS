package com.dao;

import java.util.List;

import com.model.ExamInfoModel;
import com.model.ExamModel;

public interface ExamInfoModelInterface {
	boolean saveExamInfo(ExamInfoModel model);

	List<ExamInfoModel> getAllExamInfo();

	boolean updateExamInfo(ExamInfoModel model);

	int deleteExamInfo(int id);
	public List<ExamInfoModel> searchByField(Object[] obj);
}
