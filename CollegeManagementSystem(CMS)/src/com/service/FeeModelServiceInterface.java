package com.service;

import java.util.List;

import com.model.FeeModel;
import com.model.FeeUpdateModel;

public interface FeeModelServiceInterface {
	boolean save(FeeModel feeModel);

	int update(FeeModel feeModel,FeeUpdateModel model);

	List<FeeModel> searchByField(Object[] obj);

	int delete(int id);

	List<FeeModel> getAllRecord();
	List<FeeModel> getAllRecord(int id);
}
