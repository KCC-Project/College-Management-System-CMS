package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.SubjectModelInterface;
import com.model.StudentModel;
import com.model.SubjectModel;

public class SubjectModelImpl implements SubjectModelInterface {

	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	public List<SubjectModel> getAllrecord() {

		List<SubjectModel> subjectModel = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from subject order by subject_id";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				SubjectModel model = new SubjectModel();
				model.setSubject_id(rs.getInt("subject_id"));
				model.setSubjectName(rs.getString("subject_name"));
				model.setSubjectCode(rs.getString("subject_code"));
				model.setSubjectCredit(rs.getInt("subject_credit"));
				model.setStatus(rs.getInt("status"));
				subjectModel.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return subjectModel;
	}

	@Override
	public SubjectModel getSelectedSubject(int id) {
		SubjectModel model = new SubjectModel();
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "select * from subject where subject_id=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {

				model.setSubject_id(rs.getInt("subject_id"));
				model.setSubjectName(rs.getString("subject_name"));
				model.setSubjectCode(rs.getString("subject_code"));
				model.setSubjectCredit(rs.getInt("subject_credit"));
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
