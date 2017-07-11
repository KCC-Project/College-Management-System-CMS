package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.SemesterSubjectModelInterface;
import com.model.SemesterSubjectModel;

public class SemesterSubjectModelImpl implements SemesterSubjectModelInterface {
	
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	@Override
	public List<SemesterSubjectModel> searchByField(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<SemesterSubjectModel> semesterSubject = new ArrayList<>();
		int semester_id = 0;
		int subject_id = 0;
		int start = 0;
		int limit = 0;

		if (obj[0] != null) {  semester_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  subject_id = Integer.parseInt(obj[1].toString()); }
		
		if (obj[2] != null && obj[3] != null) {  
			start = Integer.parseInt(obj[2].toString()); 
			limit = Integer.parseInt(obj[3].toString());
		}
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM semester_subject WHERE 1=1");
	        
			if (semester_id != 0) {
	            query.append(" AND semester_id = ?");
	            parameters.add(semester_id);
	        }
	        if (subject_id != 0) {
	            query.append(" AND subject_id = ?");
	            parameters.add(subject_id);
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
	        		SemesterSubjectModel semesterSubjectModel = new SemesterSubjectModel();
	        		semesterSubjectModel.setSemester_id(rs.getInt("semester_id"));
	        		semesterSubjectModel.setSubject_id(rs.getInt("subject_id"));
					semesterSubject.add(semesterSubjectModel);
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
		
		return semesterSubject;
	}
	
}
