package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.StudentExamResultModelInterface;
import com.model.ExamModel;
import com.model.SemesterSubjectModel;
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
	public List<StudentExamResultModel> searchByField(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<StudentExamResultModel> studentExam = new ArrayList<>();
		int student_id = 0;
		int exam_id = 0;
		int exam_marks = 0;
		int is_attended = 0;
		int pass_fail_status = 5;
		int start = 0;
		int limit = 0;

		if (obj[0] != null) {  student_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  exam_id = Integer.parseInt(obj[1].toString()); }
		if (obj[2] != null) {  exam_marks = Integer.parseInt(obj[2].toString()); }
		if (obj[3] != null) {  is_attended = Integer.parseInt(obj[3].toString()); }
		if (obj[4] != null) {  pass_fail_status = Integer.parseInt(obj[4].toString()); }
		
		if (obj[5] != null && obj[6] != null) {  
			start = Integer.parseInt(obj[5].toString()); 
			limit = Integer.parseInt(obj[6].toString());
		}
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM student_exam WHERE 1=1");
	        
			if (student_id != 0) {
	            query.append(" AND student_id = ?");
	            parameters.add(student_id);
	        }
	        if (exam_id != 0) {
	            query.append(" AND exam_id = ?");
	            parameters.add(exam_id);
	        }
	        if (exam_marks != 0) {
	            query.append(" AND exam_marks = ?");
	            parameters.add(exam_marks);
	        }
	        if (is_attended != 0) {
	            query.append(" AND is_attended = ?");
	            parameters.add(is_attended);
	        }
	        if (pass_fail_status != 5) {
	            query.append(" AND pass_fail_status = ?");
	            parameters.add(pass_fail_status);
	        }
	        if (start != 0 && limit != 0) {
	            query.append(" LIMIT ?, ?");
	            parameters.add(start);
	            parameters.add(limit);
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
	            
	        	while(rs.next()){
	        		StudentExamResultModel model = new StudentExamResultModel();
	        		
	        		model.setStudentId(rs.getInt("student_id"));
	        		model.setExamId(rs.getInt("exam_id"));
	        		model.setExamMarks(rs.getInt("exam_marks"));
	        		model.setIsAttended(rs.getInt("is_attended"));
	        		model.setPassFailStatus(rs.getInt("pass_fail_status"));
	        		
	        		studentExam.add(model);
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
		
		return studentExam;
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
			sql = "update student_exam set exam_marks=?,is_attended=?,pass_fail_status=? where  (student_id=? && exam_id=?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(col++, model.getExamMarks());
			pst.setInt(col++, model.getIsAttended());
			pst.setInt(col++, model.getPassFailStatus());
			pst.setInt(col++, model.getStudentId());
			pst.setInt(col++, model.getExamId());
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
