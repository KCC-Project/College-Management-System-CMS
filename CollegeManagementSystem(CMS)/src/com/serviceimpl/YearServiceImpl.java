package com.serviceimpl;

import java.util.List;

import com.dao.YearModelInterface;
import com.daoimpl.YearModelImpl;
import com.model.YearModel;
import com.service.YearServiceInterface;

public class YearServiceImpl implements YearServiceInterface {
	
	YearModelInterface model = new YearModelImpl();
	
	// service to save year
	public boolean saveYear(YearModel yearModel) {
		return model.saveYear(yearModel);
	}

	// service to load year
	public List<YearModel> getAllRecord() {
		return model.getAllRecord();
	}

}
