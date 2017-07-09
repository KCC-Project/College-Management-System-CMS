package com.service;

import java.util.List;

import com.model.YearModel;

public interface YearServiceInterface {
	public boolean saveYear(YearModel yearModel);
	public List<YearModel> getAllRecord();
	List<YearModel> searchByFields(Object[] obj);
}
