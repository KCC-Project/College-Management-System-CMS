package com.dao;

import java.util.List;

import com.model.Faculty_ProgramModel;
import com.model.ProgramModel;

public interface ProgramModelInterface {
	public List<ProgramModel> getAllRecord();
	ProgramModel getRecordById(int id);
}