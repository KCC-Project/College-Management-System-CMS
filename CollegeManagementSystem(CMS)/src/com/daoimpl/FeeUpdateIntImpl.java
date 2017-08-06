package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.dao.FeeUpdateInterface;
import com.model.FeeUpdateModel;

public class FeeUpdateIntImpl implements FeeUpdateInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	public boolean save(FeeUpdateModel model) {
		boolean status =false;
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into fee_update(fee_id,amount_paid,bill_no,paid_date) values(?,?,?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getFee_id());
			pst.setInt(col++, model.getAmount_paid());
			pst.setString(col++, model.getBill_no());
			Date paidDate = model.getPaid_date();
			java.sql.Date pDate = new java.sql.Date(paidDate.getTime()); // converting
			pst.setDate(col++, pDate);
			int count = pst.executeUpdate();
			if (count > 0) {
				status= true;
			}
		} catch (Exception e) {
			System.out.println("Error in saving fee update="+e.getMessage());
		}finally {
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

}
