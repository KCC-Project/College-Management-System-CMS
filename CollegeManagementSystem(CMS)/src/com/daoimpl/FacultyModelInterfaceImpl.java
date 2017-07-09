package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.FacultyModelInterface;
import com.model.FacultyModel;

public class FacultyModelInterfaceImpl implements FacultyModelInterface {
	
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;
	
	public List<FacultyModel> getAllRecord() {
		List<FacultyModel> faculty = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from faculty";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				FacultyModel model = new FacultyModel();
				model.setFaculty_id(rs.getInt("faculty_id"));
				model.setFaculty_name(rs.getString("faculty_name"));
				faculty.add(model);
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
		return faculty;
	}

	@Override
	public FacultyModel getRecordById(int id) {

		FacultyModel model = new FacultyModel();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from faculty where faculty_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				model.setFaculty_id(rs.getInt("faculty_id"));
				model.setFaculty_name(rs.getString("faculty_name"));
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
