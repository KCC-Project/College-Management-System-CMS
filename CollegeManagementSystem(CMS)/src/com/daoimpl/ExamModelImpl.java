package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.ExamModelInterface;
import com.model.ExamModel;
import com.model.YearModel;

public class ExamModelImpl implements ExamModelInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

	public boolean saveExamType(String examName,String summary) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into exam_type(type_name,summary) values(?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setString(1, examName);
			pst.setString(2, summary);
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("Problem in saving exam" + e);
		}finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}

	public List<ExamModel> getAllExamType() {
		List<ExamModel> examModel = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from exam_type order by exam_type_id";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {

				ExamModel exam = new ExamModel();
				exam.setExamId(rs.getInt("exam_type_id"));
				exam.setExamTypeName(rs.getString("type_name"));
				exam.setSummary(rs.getString("summary"));
				examModel.add(exam);
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
		return examModel;
	}

	@Override
	public boolean updateExamType(String name,int id) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update exam_type set type_name=? where exam_type_id=?";
			pst = conn.prepareStatement(sql);
		
			pst.setString(1, name);
			pst.setInt(2, id);
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("update problem =" + e);
		}finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}

	@Override
	public int deleteExamType(int id) {
		int result = 0;
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "delete from exam_type where exam_type_id =?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
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
		return result;

	}

	@Override
	public ExamModel getSelectedExam(int id) {
		ExamModel model= new ExamModel();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from exam_type where exam_type_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				model.setExamId(rs.getInt("exam_type_id"));
				model.setExamTypeName(rs.getString("type_name"));
				model.setSummary(rs.getString("summary"));
				
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
