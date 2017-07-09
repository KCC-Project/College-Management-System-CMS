package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.YearModelInterface;
import com.model.SemesterModel;
import com.model.YearModel;
import com.util.DateUtil;

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
			sql = "select * from year order by year_id desc";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
		
			while(rs.next()){
			
				YearModel yearModel = new YearModel();
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

	@Override
	public List<YearModel> searchByFields(Object[] obj) {

		List<Object> parameters = new ArrayList<Object>();
		List<YearModel> yearModel = new ArrayList<>();
		int year_id = 0;
		int year = 0;
		

		System.out.println(obj[1].toString());
		System.out.println(obj[2].toString());
		if (obj[0] != null) {  year_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  year = Integer.parseInt(obj[1].toString()); }
		
		try {
	        StringBuilder query = new StringBuilder("SELECT * FROM year WHERE 1=1");
	        
			if (year_id != 0) {
	            query.append(" AND year_id = ?");
	            parameters.add(year_id);
	        }
	        if (year !=0) {
	            query.append(" AND year = ?");
	            parameters.add(year);
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
	        		
					YearModel yearModel1 = new YearModel();
					yearModel1.setYear_id(rs.getInt("year_id"));
					yearModel1.setYear(rs.getInt("year"));
					yearModel.add(yearModel1);
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
		
		return yearModel;
	
	}

}
