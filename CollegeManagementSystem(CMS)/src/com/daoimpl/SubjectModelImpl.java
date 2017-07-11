package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.SubjectModelInterface;
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
	public List<SubjectModel> searchByFields(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<SubjectModel> subjectModel = new ArrayList<>();
		int subject_id = 0;
		int subject_name = 0;
		String subject_code = null;
		int subject_credit = 0;
		int status = 0;
		int start = 0;
		int limit = 0;

		if (obj[0] != null) {  subject_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  subject_name = Integer.parseInt(obj[1].toString()); }
		if (obj[2] != null) {  subject_code = obj[2].toString(); }
		if (obj[3] != null) {  subject_credit = Integer.parseInt(obj[3].toString()); }
		if (obj[4] != null) {  status = Integer.parseInt(obj[4].toString()); }
		
		if (obj[5] != null && obj[5] != null) {  
			start = Integer.parseInt(obj[5].toString()); 
			limit = Integer.parseInt(obj[6].toString());
		}
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM subject WHERE 1=1");
	        
			if (subject_id != 0) {
	            query.append(" AND subject_id = ?");
	            parameters.add(subject_id);
	        }
	        if (subject_name != 0) {
	            query.append(" AND subject_name = ?");
	            parameters.add(subject_name);
	        }
	        if (subject_code != null) {
	            query.append(" AND subject_code = ?");
	            parameters.add(subject_code);
	        }
	        if (subject_credit != 0) {
	            query.append(" AND subject_credit = ?");
	            parameters.add(subject_credit);
	        }
	        if (status != 0) {
	            query.append(" AND status = ?");
	            parameters.add(status);
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
	        		SubjectModel model = new SubjectModel();
	        		
	        		model.setSubject_id(rs.getInt("subject_id"));
	        		model.setSubjectName(rs.getString("subject_name"));
	        		model.setSubjectCode(rs.getString("subject_code"));
	        		model.setSubjectCredit(rs.getInt("subject_credit"));
	        		model.setStatus(rs.getInt("status"));
	        		
					subjectModel.add(model);
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
		
		return subjectModel;
	}
	
}

