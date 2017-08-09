package com.dao;

import java.util.List;

import com.model.FeeUpdateModel;


public interface FeeUpdateInterface {
	boolean save(FeeUpdateModel model);

	List<FeeUpdateModel> searchByField(Object[] obj);
}
