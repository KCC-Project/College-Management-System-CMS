package com.serviceimpl;

import java.util.List;

import com.dao.StudentFeeAmountModelInterface;
import com.daoimpl.StudentFeeAmountModelIntImpl;
import com.model.Student_Fee_AmountModel;
import com.service.StudentFeeAmountModelService;

public class StudentFeeAmountModelServiceImpl implements StudentFeeAmountModelService {
	StudentFeeAmountModelInterface model= new StudentFeeAmountModelIntImpl();
	@Override
	public boolean save(Student_Fee_AmountModel feeModel) {
		return model.save(feeModel);
	}

	@Override
	public int update(Student_Fee_AmountModel feeModel) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Student_Fee_AmountModel> searchByField(Object[] obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Student_Fee_AmountModel> getAllRecord() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Student_Fee_AmountModel> getAllRecord(int id) {
		return model.getAllRecord(id);
	}

}
