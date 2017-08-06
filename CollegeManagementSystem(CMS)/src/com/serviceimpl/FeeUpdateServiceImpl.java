package com.serviceimpl;

import com.dao.FeeUpdateInterface;
import com.daoimpl.FeeUpdateIntImpl;
import com.model.FeeUpdateModel;
import com.service.FeeUpdateServiceInterface;

public class FeeUpdateServiceImpl implements FeeUpdateServiceInterface {

	@Override
	public boolean save(FeeUpdateModel model) {
		FeeUpdateInterface inter= new FeeUpdateIntImpl();
		return inter.save(model);
	}

}
