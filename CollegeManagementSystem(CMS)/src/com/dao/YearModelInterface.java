package com.dao;

import java.util.List;

import com.model.YearModel;

public interface YearModelInterface {
	public boolean saveYear(YearModel yearModel);
	public List<YearModel> getAllRecord();
}
