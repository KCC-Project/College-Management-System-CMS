package com.daoimpl;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.ExamInfoModelInterface;
import com.model.ExamInfoModel;
import com.model.ExamModel;
import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;

public class ExamInfoModelImpl implements ExamInfoModelInterface {
	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

	@Override
	public boolean saveExamInfo(ExamInfoModel model) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into exam(subject_id,exam_type_id,exam_date,exam_end_date,exam_starttime,exam_endtime,full_marks,pass_marks,status) values(?,?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getSubjectId());
			pst.setInt(col++, model.getExamTypeId());
			

			Date exam_start_date = model.getExamStartDate();
			java.sql.Date sem_start_date_sql = new java.sql.Date(exam_start_date.getTime()); // converting
			Date exam_end_date =  model.getExamEndDate();
			java.sql.Date sem_end_date_sql = new java.sql.Date(exam_end_date.getTime());
			
			
			pst.setDate(col++, sem_start_date_sql);
			pst.setDate(col++, sem_end_date_sql);
			pst.setString(col++, model.getExamStartTime());
			pst.setString(col++, model.getExamStartTime());
			pst.setInt(col++, model.getFullmarks());
			pst.setInt(col++, model.getPassmarks());
			pst.setInt(col++, model.getStatus());
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("Problem in saving exam information" + e);
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
	public List<ExamInfoModel> getAllExamInfo() {
		List<ExamInfoModel> examModel = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from exam order by exam_id";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				ExamInfoModel model = new ExamInfoModel();
				model.setSubjectId(rs.getInt("subject_id"));
				model.setExamTypeId(rs.getInt("exam_type_id"));
				model.setExamStartDate(rs.getDate("exam_date"));
				model.setExamEndDate(rs.getDate("exam_end_date"));
				model.setExamStartTime(rs.getString("exam_starttime"));
				model.setExamEndTime(rs.getString("exam_endtime"));
				model.setFullmarks(rs.getInt("full_marks"));
				model.setPassmarks(rs.getInt("pass_marks"));
				model.setStatus(rs.getInt("status"));
				model.setExamId(rs.getInt("exam_id"));
			
				ExamModelServiceInterface examModelType = new ExamModelServiceImpl();
				model.setExamTypeName(examModelType.getSelectedExam(rs.getInt("exam_type_id")));
				examModel.add(model);

				model.setSubjectName("Db left");
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
		return examModel;
	}

	@Override
	public boolean updateExamInfo(ExamInfoModel model) {
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update  exam set subject_id=?,exam_type_id=?,exam_date=?,exam_end_date=?,exam_starttime=?,exam_endtime=?,full_marks=?,pass_marks=?,status=? where exam_id=?";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getSubjectId());
			pst.setInt(col++, model.getExamTypeId());
			
			Date exam_start_date =  model.getExamStartDate();
			java.sql.Date sem_start_date_sql = new java.sql.Date(exam_start_date.getTime()); // converting
			Date exam_end_date =  model.getExamEndDate();
			java.sql.Date sem_end_date_sql = new java.sql.Date(exam_end_date.getTime());
			
			pst.setDate(col++,sem_start_date_sql);
			pst.setDate(col++, sem_end_date_sql);
			pst.setString(col++, model.getExamStartTime());
			pst.setString(col++, model.getExamEndTime());
			pst.setInt(col++, model.getFullmarks());
			pst.setInt(col++, model.getPassmarks());
			pst.setInt(col++, model.getStatus());
			pst.setInt(col++, model.getExamId());
			int count = pst.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("update problem =" + e);
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
	public int deleteExamInfo(int id) {
		int result = 0;
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "delete from exam where exam_id =?";
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

}
