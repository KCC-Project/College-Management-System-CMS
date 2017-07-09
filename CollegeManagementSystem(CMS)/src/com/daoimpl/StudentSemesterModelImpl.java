package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.StudentSemesterModelInterface;
import com.model.StudentSemesterModel;


public class StudentSemesterModelImpl implements StudentSemesterModelInterface {

	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	@Override
	public StudentSemesterModel getSelectedData(int id) {
		StudentSemesterModel model = new StudentSemesterModel();
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "select * from student_semester where student_id=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				model.setStudentId(rs.getInt("student_id"));
				model.setSemesterId(rs.getInt("semester_id"));
				model.setIsCompleted(rs.getInt("is_completed"));
				model.setClassId(rs.getInt("class_id"));
				model.setStatus(rs.getInt("status"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
