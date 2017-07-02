package com.serviceimpl;

import java.util.List;

import com.dao.ExamModelInterface;
import com.daoimpl.ExamModelImpl;
import com.model.ExamModel;
import com.service.ExamModelServiceInterface;

public class ExamModelServiceImpl implements ExamModelServiceInterface {
	ExamModelInterface examModel = new ExamModelImpl();

	public boolean saveExamType(String examName ,String summary) {
		return examModel.saveExamType(examName,summary);
	}

	public List<ExamModel> getAllExamType() {
		return examModel.getAllExamType();
	}

	public boolean updateExamType(String examName, int id) {
		return examModel.updateExamType(examName, id);
	}

	public int deleteExamType(int id) {
		return examModel.deleteExamType(id);
	}

	@Override
	public ExamModel getSelectedExam(int id) {
		return examModel.getSelectedExam(id);
	}

}
