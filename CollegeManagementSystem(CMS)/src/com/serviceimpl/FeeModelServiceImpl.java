package com.serviceimpl;

import java.util.List;

import com.dao.FeeModelInterface;
import com.model.FeeModel;
import com.model.FeeUpdateModel;
import com.service.FeeModelServiceInterface;

public class FeeModelServiceImpl implements FeeModelServiceInterface {

	FeeModelInterface inter = new com.daoimpl.FeeModelIntImpl();

	public boolean save(FeeModel feeModel) {
		return inter.save(feeModel);
	}

	@Override
	public int update(FeeModel feeModel, FeeUpdateModel model) {
		return inter.update(feeModel, model);
	}

	@Override
	public List<FeeModel> searchByField(Object[] obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FeeModel> getAllRecord() {
		// TODO Auto-generated method stub
		return null;
	}

}
