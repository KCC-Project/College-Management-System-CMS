package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.FeeUpdateInterface;
import com.model.FeeUpdateModel;

public class FeeUpdateIntImpl implements FeeUpdateInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

	public boolean save(FeeUpdateModel model) {
		boolean status = false;
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
				status = true;
			}
		} catch (Exception e) {
			System.out.println("Error in saving fee update=" + e.getMessage());
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
	public List<FeeUpdateModel> searchByField(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<FeeUpdateModel> feeUpdateModel = new ArrayList<>();
		int fee_id = 0;
		if (obj[1] != null) {
			fee_id = Integer.parseInt(obj[1].toString());
		}

		try {
			StringBuilder query = new StringBuilder("SELECT * FROM fee_update WHERE 1=1");

			if (fee_id != 0) {
				query.append(" AND fee_id = ?");
				parameters.add(fee_id);
			}

			String Query = query.toString();
			System.out.println(Query);

			conn = DatabaseConnection.connectToDatabase();
			pst = conn.prepareStatement(Query);

			int i = 1;
			for (Object parameter : parameters) {
				pst.setObject(i++, parameter);
			}

			rs = pst.executeQuery();
			if (rs != null) {

				while (rs.next()) {
					FeeUpdateModel model = new FeeUpdateModel();

					model.setFee_update_id(rs.getInt("fee_update_id"));
					model.setFee_id(rs.getInt("fee_id"));
					model.setAmount_paid(rs.getInt("amount_paid"));
					model.setBill_no(rs.getString("bill_no"));
					model.setPaid_date(rs.getDate("paid_date"));
					feeUpdateModel.add(model);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return feeUpdateModel;
	}

}
