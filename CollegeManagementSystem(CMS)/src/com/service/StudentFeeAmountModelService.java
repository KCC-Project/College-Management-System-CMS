package com.service;

import java.util.List;

import com.model.Student_Fee_AmountModel;

public interface StudentFeeAmountModelService {
	boolean save(Student_Fee_AmountModel feeModel);

	int update(Student_Fee_AmountModel feeModel);

	List<Student_Fee_AmountModel> searchByField(Object[] obj);

	int delete(int id);

	List<Student_Fee_AmountModel> getAllRecord();

	List<Student_Fee_AmountModel> getAllRecord(int id);
}
