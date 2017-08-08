package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			sql = "insert into fee(due_amount,student_fee_amount_id,semester_no) values(?,?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, feeModel.getDue_amount());
			pst.setInt(col++, feeModel.getStudent_fee_amount_id());
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
		System.out.println("here");
		List<Object> parameters = new ArrayList<Object>();
		List<FeeModel> feeModel = new ArrayList<>();
		int fee_id = 0;
		if (obj[0] != null) {  fee_id = Integer.parseInt(obj[0].toString()); }
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM fee WHERE 1=1");
	        
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
	            
	        	while(rs.next()){
	        		FeeModel model = new FeeModel();
	        		
	        	model.setFee_id(rs.getInt("fee_id"));
	        	model.setDue_amount(rs.getInt("due_amount"));
	        		model.setSemester_no(rs.getInt("semester_no"));
	        		model.setStudent_fee_amount_id(rs.getInt("student_fee_amount_id"));
	        		feeModel.add(model);
				}

	        }

	    }  catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return feeModel;
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
				model.setStudent_fee_amount_id(rs.getInt("student_fee_amount_id"));
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
		System.out.println("id==="+id);
		List<FeeModel> fee = new ArrayList<FeeModel>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from fee where student_fee_amount_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				FeeModel model= new FeeModel();
				model.setFee_id(rs.getInt("fee_id"));
				model.setStudent_fee_amount_id(rs.getInt("student_fee_amount_id"));
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
