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
import com.model.YearModel;

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
	public List<SemesterModel> loadByProgramId(int program_id) {
		List<SemesterModel> semester = new ArrayList<>();
		try {
			
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from semester where program_id=1 order by semester_no asc";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
		
			while(rs.next()){
			
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
		
		return semester;
	}

}
