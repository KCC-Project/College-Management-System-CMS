package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.SemesterModelInterface;
import com.model.SemesterModel;
import com.util.DateUtil;

public class SemesterModelImpl implements SemesterModelInterface {

	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;
	
	// method for saving semester information
	public boolean addSemester(SemesterModel semesterModel) {
		
		// getting all the values from the Model
		int semester_id = semesterModel.getSemester_id();
		int semester_no = semesterModel.getSemester_no();
		int program_id = semesterModel.getProgram_id();
		int batch_year = semesterModel.getBatch_year();
		Date sem_start_date = semesterModel.getStart_date();
		java.sql.Date sem_start_date_sql = new java.sql.Date(sem_start_date.getTime()); // converting
		Date sem_end_date = semesterModel.getEnd_date();
		java.sql.Date sem_end_date_sql = new java.sql.Date(sem_end_date.getTime()); //converting
		int status = semesterModel.getStatus();
		
	
		try {
			if (semester_no == 0 || program_id == 0 || batch_year ==0) {
				return false;
			}
			
			else {
				conn = DatabaseConnection.connectToDatabase();
				sql = "insert into semester (semester_no,program_id,batch_year_id,sem_start_date,sem_end_date,status) "
						+ "values(?,?,?,?,?,?)";
				pst = conn.prepareStatement(sql);
				int col = 1;

				pst.setInt(col++, semester_no);
				pst.setInt(col++, program_id);
				pst.setInt(col++, batch_year);
				pst.setDate(col++, sem_start_date_sql);
				pst.setDate(col++, sem_end_date_sql);
				pst.setInt(col++, status);
				
				int count = pst.executeUpdate();
				if (count > 0) {
					return true;
				}
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

		return false;

	}

	// method for loading semester information
	public List<SemesterModel> getAllRecord() {

		return null;
	}

	@Override
	public SemesterModel loadById(int id) {
		SemesterModel semesterModel = new SemesterModel();
		
		try {
			
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from semester where semester_id=? order by semester_no asc";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
		
			while(rs.next()){
				
				semesterModel.setSemester_id(rs.getInt("semester_id"));
				semesterModel.setSemester_no(rs.getInt("semester_no"));
				semesterModel.setProgram_id(rs.getInt("program_id"));
				semesterModel.setBatch_year(rs.getInt("batch_year_id"));
				semesterModel.setStart_date(rs.getDate("sem_start_date"));
				semesterModel.setEnd_date(rs.getDate("sem_end_date"));
				semesterModel.setStatus(rs.getInt("status"));
				
				
			}
		} catch (Exception e) {
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
		
		return semesterModel;
	}

	@Override
	public List<SemesterModel> searchByFields(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<SemesterModel> semester = new ArrayList<>();
		int semester_id = 0;
		int semester_no = 0;
		int program_id = 0;
		int batch_year = 0;
		java.sql.Date sem_start_date_sql = null;
		java.sql.Date sem_end_date_sql = null;
		int status = 0;

		if (obj[0] != null) {  semester_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  semester_no = Integer.parseInt(obj[1].toString()); }
		if (obj[2] != null) {  program_id = Integer.parseInt(obj[2].toString()); }
		if (obj[3] != null) {  batch_year = Integer.parseInt(obj[3].toString()); }
		if (obj[4] != null) { Date sem_start_date = DateUtil.convertToDate(obj[4].toString()); 
			sem_start_date_sql = new java.sql.Date(sem_start_date.getTime()); }// converting
		if (obj[5] != null) { Date sem_end_date = DateUtil.convertToDate(obj[5].toString());
			sem_end_date_sql = new java.sql.Date(sem_end_date.getTime()); }//converting
		if (obj[6] != null) {  status = Integer.parseInt(obj[6].toString()); }
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM semester WHERE 1=1");
	        
			if (semester_id != 0) {
	            query.append(" AND semester_id = ?");
	            parameters.add(semester_id);
	        }
	        if (semester_no != 0) {
	            query.append(" AND semester_no = ?");
	            parameters.add(semester_no);
	        }
	        if (program_id != 0) {
	            query.append(" AND program_id = ?");
	            parameters.add(program_id);
	        }
	        if (batch_year != 0) {
	            query.append(" AND batch_year_id = ?");
	            parameters.add(batch_year);
	        }
			if (sem_start_date_sql != null) {
	            query.append(" AND sem_start_date = ?");
	            parameters.add(sem_start_date_sql);
	        }
	        if (sem_end_date_sql != null) {
	            query.append(" AND sem_end_date = ?");
	            parameters.add(sem_end_date_sql);
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
	        		System.out.println("From Db="+rs.getInt("program_id"));
					SemesterModel semesterModel = new SemesterModel();
					semesterModel.setSemester_id(rs.getInt("semester_id"));
					semesterModel.setSemester_no(rs.getInt("semester_no"));
					semesterModel.setProgram_id(rs.getInt("program_id"));
					semesterModel.setBatch_year(rs.getInt("batch_year_id"));
					semesterModel.setStart_date(rs.getDate("sem_start_date"));
					semesterModel.setEnd_date(rs.getDate("sem_end_date"));
					semesterModel.setStatus(rs.getInt("status"));
					
					semester.add(semesterModel);
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
		
		return semester;
	}
}
