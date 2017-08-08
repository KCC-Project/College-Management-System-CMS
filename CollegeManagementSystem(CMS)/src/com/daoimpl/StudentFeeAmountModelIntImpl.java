package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.StudentFeeAmountModelInterface;
import com.model.FeeModel;
import com.model.Student_Fee_AmountModel;

public class StudentFeeAmountModelIntImpl implements StudentFeeAmountModelInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	@Override
	public boolean save(Student_Fee_AmountModel feeModel) {
		boolean status = false;
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into student_fee_amount(student_id,fee_amount) values(?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			
			pst.setInt(col++, feeModel.getStudent_id());
			pst.setInt(col++, feeModel.getFee_amount());
			
			int count = pst.executeUpdate();
			if (count > 0) {
				status = true;
			}
		} catch (Exception e) {
			System.out.println("Error from saving fee amount=" + e);
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return status;
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

		List<Student_Fee_AmountModel> fee = new ArrayList<Student_Fee_AmountModel>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from student_fee_amount where student_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Student_Fee_AmountModel model= new Student_Fee_AmountModel();
				model.setStudent_Fee_Amount_id(rs.getInt("student_fee_amount_id"));
				model.setStudent_id(rs.getInt("student_id"));
				model.setFee_amount(rs.getInt("fee_amount"));
				
				fee.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fee;
	}

}
