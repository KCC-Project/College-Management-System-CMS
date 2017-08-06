package com.dao;

import java.util.List;

import com.model.FeeModel;
import com.model.FeeUpdateModel;

public interface FeeModelInterface {
	boolean save(FeeModel feeModel);

	int update(FeeModel feeModel,FeeUpdateModel model);

	List<FeeModel> searchByField(Object[] obj);

	int delete(int id);

	List<FeeModel> getAllRecord();
}
