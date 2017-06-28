package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.dao.SemesterModelInterface;
import com.model.SemesterModel;

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
		int status = semesterModel.getStatus();
		
	
		try {
			if (semester_no == 0 || program_id == 0 || batch_year ==0) {
				return false;
			}
			
			else {
				conn = DatabaseConnection.connectToDatabase();
				sql = "insert into semester (semester_no,program_id,batch_year,status" 
				+ "values(?,?,?,?,)";
				pst = conn.prepareStatement(sql);
				int col = 1;

				pst.setInt(col++, semester_no);
				pst.setInt(col++, program_id);
				pst.setInt(col++, batch_year);
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

}
