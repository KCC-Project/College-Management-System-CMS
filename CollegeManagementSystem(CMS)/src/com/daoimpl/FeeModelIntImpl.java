package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.FeeModelInterface;
import com.model.FeeModel;
import com.model.FeeUpdateModel;
import com.serviceimpl.FeeUpdateServiceImpl;

public class FeeModelIntImpl implements FeeModelInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

	@Override
	public boolean save(FeeModel feeModel) {
		boolean status = false;
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into fee(due_amount,student_id,semester_no) values(?,?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			System.out.println(
					feeModel.getDue_amount() + "  " + feeModel.getStudent_id() + "  " + feeModel.getSemester_no());
			pst.setInt(col++, feeModel.getDue_amount());
			pst.setInt(col++, feeModel.getStudent_id());
			pst.setInt(col++, feeModel.getSemester_no());
			int count = pst.executeUpdate();
			if (count > 0) {
				status = true;
			}
		} catch (Exception e) {
			System.out.println("Error from saving fee=" + e);
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
	public int update(FeeModel feeModel, FeeUpdateModel model) {
		int status = 0;
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update fee set due_amount=? where fee_id=?";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, feeModel.getDue_amount());
			pst.setInt(col++, feeModel.getFee_id());
			int count = pst.executeUpdate();
			if (count > 0) {
				boolean bol = new FeeUpdateServiceImpl().save(model);
				if (bol == true) {
					status = 1;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return status;
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
		List<FeeModel> fee = new ArrayList<FeeModel>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from fee";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				FeeModel model= new FeeModel();
				model.setFee_id(rs.getInt("fee_id"));
				model.setStudent_id(rs.getInt("student_id"));
				model.setSemester_no(rs.getInt("semester_no"));
				model.setDue_amount(rs.getInt("due_amount"));
				fee.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fee;
	}

	@Override
	public List<FeeModel> getAllRecord(int id) {
		List<FeeModel> fee = new ArrayList<FeeModel>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from fee where student_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				FeeModel model= new FeeModel();
				model.setFee_id(rs.getInt("fee_id"));
				model.setStudent_id(rs.getInt("student_id"));
				model.setSemester_no(rs.getInt("semester_no"));
				model.setDue_amount(rs.getInt("due_amount"));
				fee.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fee;
	}

}
