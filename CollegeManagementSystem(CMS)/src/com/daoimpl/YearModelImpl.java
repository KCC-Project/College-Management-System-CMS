package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.YearModelInterface;
import com.model.YearModel;

public class YearModelImpl implements YearModelInterface {

	private Connection conn;
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	
	// adding year into database
	public boolean saveYear(YearModel yearModel) {
		int year_id = yearModel.getYear_id();
		int year = yearModel.getYear();
		
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "insert into year(year) values(?)";
			pst = conn.prepareStatement(sql);
			int col = 1;
			pst.setInt(year, year);
			int count = pst.executeUpdate();
			if(count>0){
				return true;
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
		
		return false;
	}

	// loading year from database
	public List<YearModel> getAllRecord() {
		List<YearModel> year = new ArrayList<>();
		try {
			
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from year";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
		
			while(rs.next()){
			
				YearModel yearModel = new YearModel();
				System.out.println("year is db="+rs.getInt("year"));
				yearModel.setYear(rs.getInt("year"));
				yearModel.setYear_id(rs.getInt("year_id"));
				
				year.add(yearModel);
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
		
		return year;
	}

}
