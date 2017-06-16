package DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import DAO.Faculty_Program_Model_Interface;
import Model.Faculty_ProgramModel;
import Model.StudentModel;

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
				model.setFaculty_Programe_Name(rs.getString("Faculty_Name"));
				model.setID(rs.getInt("Faculty_ID"));
				fact_programe.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fact_programe;
	}


	@Override
	public List<Faculty_ProgramModel> getAllRecord(int id) {
		List<Faculty_ProgramModel> fact_programe = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from program where Faculty_ID=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Faculty_ProgramModel model = new Faculty_ProgramModel();
				model.setFaculty_Programe_Name(rs.getString("Program_Name"));
				model.setID(rs.getInt("Program_ID"));
				fact_programe.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fact_programe;
	}

}
