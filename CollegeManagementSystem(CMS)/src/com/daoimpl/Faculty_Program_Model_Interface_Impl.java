package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.Faculty_Program_Model_Interface;
import com.model.Faculty_ProgramModel;

public class Faculty_Program_Model_Interface_Impl implements Faculty_Program_Model_Interface {
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	
	@Override
	public List<Faculty_ProgramModel> getAllRecord() {
		List<Faculty_ProgramModel> fact_programe = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from faculty";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Faculty_ProgramModel model = new Faculty_ProgramModel();
				model.setFaculty_Programe_Name(rs.getString("faculty_name"));
				model.setID(rs.getInt("faculty_id"));
				fact_programe.add(model);
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
		return fact_programe;
	}


	@Override
	public List<Faculty_ProgramModel> getAllRecord(int id) {
		List<Faculty_ProgramModel> fact_programe = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from program where faculty_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Faculty_ProgramModel model = new Faculty_ProgramModel();
				model.setFaculty_Programe_Name(rs.getString("program_name"));
				model.setID(rs.getInt("program_id"));
				fact_programe.add(model);
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
		return fact_programe;
	}

}
