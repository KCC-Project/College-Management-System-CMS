package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.StudentExamResultModelInterface;
import com.model.ExamModel;
import com.model.StudentExamResultModel;
import com.model.StudentModel;

public class StudentExamResultModelImpl implements StudentExamResultModelInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

	@Override
	public boolean saveInformation(StudentExamResultModel model) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into student_exam(student_id,exam_id,exam_marks,is_attended,pass_fail_status) values(?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getStudentId());
			pst.setInt(col++, model.getExamId());
			pst.setInt(col++, model.getExamMarks());
			pst.setInt(col++, model.getIsAttended());
			pst.setInt(col++, model.getPassFailStatus());
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("Problem in saving student_exam information" + e);
		} finally {
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
	public List<StudentExamResultModel> getAllRecord() {
		List<StudentExamResultModel> StudentExamModel = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from student_exam order by student_id";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				StudentExamResultModel model = new StudentExamResultModel();
				model.setStudentId(rs.getInt("student_id"));
				model.setExamId(rs.getInt("exam_id"));
				model.setExamMarks(rs.getInt("exam_marks"));
				model.setIsAttended(rs.getInt("is_attended"));
				model.setPassFailStatus(rs.getInt("pass_fail_status"));
				StudentExamModel.add(model);
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
		return StudentExamModel;
	}

	@Override
	public StudentExamResultModel readId(int id) {
		StudentExamResultModel model = new StudentExamResultModel();
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "select * from student_exam where student_id=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				model.setStudentId(rs.getInt("student_id"));
				model.setExamId(rs.getInt("exam_id"));
				model.setExamMarks(rs.getInt("exam_marks"));
				model.setIsAttended(rs.getInt("is_attended"));
				model.setPassFailStatus(rs.getInt("pass_fail_status"));
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

	@Override
	public int delete(int id) {
		int result = 0;
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "delete from student_exam where student_id=?";
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
	public boolean update(StudentExamResultModel model) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update student_exam set exam_id=?,exam_marks=?,is_attended=?,pass_fail_status=? where  student_id=?";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getExamId());
			pst.setInt(col++, model.getExamMarks());
			pst.setInt(col++, model.getIsAttended());
			pst.setInt(col++, model.getPassFailStatus());
			pst.setInt(col++, model.getStudentId());
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("update problem in student exam=" + e);
		} finally {
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

}
