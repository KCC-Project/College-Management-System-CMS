package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.ProgramModelInterface;
import com.model.Faculty_ProgramModel;
import com.model.ProgramModel;

public class ProgramModelInterfaceImpl implements ProgramModelInterface {
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	@Override
	public List<ProgramModel> getAllRecord() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProgramModel getRecordById(int id) {

		ProgramModel model = new ProgramModel();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from program where program_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
			
				model.setProgram_name(rs.getString("program_name"));
				model.setProgram_id(rs.getInt("program_id"));
				model.setFaculty_id(rs.getInt("faculty_id"));
				model.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return model;
	}

}
