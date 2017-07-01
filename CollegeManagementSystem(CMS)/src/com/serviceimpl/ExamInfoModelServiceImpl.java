package com.serviceimpl;

import java.util.List;

import com.dao.ExamInfoModelInterface;
import com.daoimpl.ExamInfoModelImpl;
import com.model.ExamInfoModel;
import com.service.ExamInfoModelServiceInterface;

public class ExamInfoModelServiceImpl implements ExamInfoModelServiceInterface {

	ExamInfoModelInterface inter= new ExamInfoModelImpl();
	public boolean saveExamInfo(ExamInfoModel model) {
		return inter.saveExamInfo(model);
	}

	@Override
	public List<ExamInfoModel> getAllExamInfo() {
		return inter.getAllExamInfo();
	}

	@Override
	public boolean updateExamInfo(ExamInfoModel model) {
		return inter.updateExamInfo(model);
	}

	@Override
	public int deleteExamInfo(int id) {
		return inter.deleteExamInfo(id);
	}

	@Override
	public ExamInfoModel getSelectedInfo(int id) {
	return inter.getSelectedInfo(id);
	}

}
