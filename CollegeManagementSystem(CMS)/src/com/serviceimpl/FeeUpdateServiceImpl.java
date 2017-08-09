package com.serviceimpl;

import java.util.List;

import com.dao.FeeUpdateInterface;
import com.daoimpl.FeeUpdateIntImpl;
import com.model.FeeUpdateModel;
import com.service.FeeUpdateServiceInterface;

public class FeeUpdateServiceImpl implements FeeUpdateServiceInterface {
	FeeUpdateInterface inter = new FeeUpdateIntImpl();

	@Override
	public boolean save(FeeUpdateModel model) {

		return inter.save(model);
	}

	@Override
	public List<FeeUpdateModel> searchByField(Object[] obj) {
		return inter.searchByField(obj);
	}

}
