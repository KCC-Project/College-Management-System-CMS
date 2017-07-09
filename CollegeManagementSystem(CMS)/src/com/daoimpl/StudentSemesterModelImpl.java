package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.StudentSemesterModelInterface;
import com.model.SemesterModel;
import com.model.StudentSemesterModel;
import com.util.DateUtil;


public class StudentSemesterModelImpl implements StudentSemesterModelInterface {

	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;
	
	@Override
	public List<StudentSemesterModel> searchByFields(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<StudentSemesterModel> studentSemester = new ArrayList<>();
		int student_id = 0;
		int semester_id = 0;
		int is_completed = 0;
		int class_id = 0;
		int status = 0;
		if (obj[0] != null) {  student_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  semester_id = Integer.parseInt(obj[1].toString()); }
		if (obj[2] != null) {  is_completed = Integer.parseInt(obj[2].toString()); }
		if (obj[3] != null) {  class_id = Integer.parseInt(obj[3].toString()); }
		if (obj[4] != null) {  status = Integer.parseInt(obj[4].toString()); }
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM student_semester WHERE 1=1");
	        
			if (student_id != 0) {
	            query.append(" AND student_id = ?");
	            parameters.add(student_id);
	        }
	        if (semester_id != 0) {
	            query.append(" AND semester_id = ?");
	            parameters.add(semester_id);
	        }
	        if (is_completed != 0) {
	            query.append(" AND is_completed = ?");
	            parameters.add(is_completed);
	        }
	        if (class_id != 0) {
	            query.append(" AND class_id = ?");
	            parameters.add(class_id);
	        }
	        if (status != 0) {
	            query.append(" AND status = ?");
	            parameters.add(status);
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
	        if (rs != null) {
	            
	        	while(rs.next()){
	        		StudentSemesterModel studentSemesterModel = new StudentSemesterModel();
	        		
	        		studentSemesterModel.setStudent_id(rs.getInt("student_id"));
	        		studentSemesterModel.setSemester_id(rs.getInt("semester_id"));
	        		studentSemesterModel.setIs_completed(rs.getInt("is_completed"));
	        		studentSemesterModel.setClass_id(rs.getInt("class_id"));
	        		studentSemesterModel.setStatus(rs.getInt("status"));
	        		
					studentSemester.add(studentSemesterModel);
				}

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
		
		return studentSemester;
	}
	
}
