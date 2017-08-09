package com.service;

import java.util.List;

import com.model.FeeUpdateModel;

public interface FeeUpdateServiceInterface {
	boolean save(FeeUpdateModel model);
	List<FeeUpdateModel> searchByField(Object[] obj);
}
