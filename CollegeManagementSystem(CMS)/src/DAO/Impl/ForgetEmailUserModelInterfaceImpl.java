/**
 * 
 */
package DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.ForgetEmailUserModelInterface;
import Model.ForgetEmailUserModel;

public class ForgetEmailUserModelInterfaceImpl implements ForgetEmailUserModelInterface {
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	String tableName = null;
	String emailField = null;
	String id = null;
	String type = null;

	public List<ForgetEmailUserModel> getForgetEmailSearched(String email) {
		List<ForgetEmailUserModel> list = new ArrayList<>();
		try {

			int tablecount = 3;
			do {
				if (tablecount == 3) {
					tableName = "student";
					emailField = "Student_Email";
					id = "Student_ID";
					type = "student";
					tablecount = extractEmail(email, list, tablecount);
					tablecount--;
				}
			

				else if (tablecount == 2) {
					tableName = "staff";
					emailField = "Staff_Email";
					id = "Staff_ID";
					type = "Staff";
					tablecount = extractEmail(email, list, tablecount);
					tablecount--;
				}
				else if (tablecount == 1) {
					tableName = "admin";
					emailField = "admin_email";
					id = "admin_ID";
					type = "Admin";
					tablecount = extractEmail(email, list, tablecount);
					tablecount--;
				}

			} while (tablecount> 0);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return list;
	}

	private int extractEmail(String email, List<ForgetEmailUserModel> list, int tablecount)
			throws Exception, SQLException {
		conn = DatabaseConnection.connectToDatabase();
		sql = "select * from " + tableName + " where " + emailField + "=? ";
		pst = conn.prepareStatement(sql);
		pst.setString(1, email);
		rs = pst.executeQuery();
		//System.out.println("outside");

		while (rs.next()) {
			//System.out.println("inside");
			ForgetEmailUserModel model = new ForgetEmailUserModel();
			model.setEmail(rs.getString(emailField));
			model.setId(rs.getInt(id));
			model.setType(type);
			list.add(model);
			System.out.println("Email form forget email :" + rs.getString(emailField));
			System.out.println("From :"+type);
			tablecount = 0;
		}
		return tablecount;
	}

	public boolean isAuthenticated(String tableName, int id, String code) {
		String tblNameID=null;
		if (tableName.equalsIgnoreCase("student")) {
			tblNameID="Student_ID";
		}else if(tableName.equalsIgnoreCase("staff")){
			tblNameID="Staff_ID";
		}else if(tableName.equalsIgnoreCase("admin")){
			tblNameID="admin_ID";
		}
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from " + tableName + " where " + tblNameID + "=? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()){
				String vCode=rs.getString("verificationCode");
				if (vCode.equals(code)) {
					return true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

}
