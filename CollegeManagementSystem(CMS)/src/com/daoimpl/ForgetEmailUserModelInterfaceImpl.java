/**
 * 
 */
package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.dao.ForgetEmailUserModelInterface;
import com.model.ForgetEmailUserModel;

public class ForgetEmailUserModelInterfaceImpl implements ForgetEmailUserModelInterface {
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	private String tableName = null;
	private String emailField = null;
	private String id = null;
	private String type = null;

	private String finaltableName = null;
	private int finalid;
	private String finalIDNamefield = null;

	private int sucessfulUpdated;

	public List<ForgetEmailUserModel> getForgetEmailSearched(String email) {
		List<ForgetEmailUserModel> list = new ArrayList<>();
		try {

			int tablecount = 3;
			do {
				if (tablecount == 3) {
					tableName = "student";
					emailField = "student_email";
					id = "student_id";
					type = "student";
					getIDAndTablename(email, list, tablecount);
					setAuthincatedCode();
					if (sucessfulUpdated>0) {
						tablecount = extractEmail(email, list, tablecount);
					}
					tablecount--;
				}

				else if (tablecount == 2) {
					tableName = "staff";
					emailField = "staff_email";
					id = "staff_id";
					type = "Staff";
					getIDAndTablename(email, list, tablecount);
					setAuthincatedCode();
					if (sucessfulUpdated > 0) {
						tablecount = extractEmail(email, list, tablecount);
					}

					tablecount--;
				} else if (tablecount == 1) {
					tableName = "admin";
					emailField = "admin_email";
					id = "admin_id";
					type = "admin";
					getIDAndTablename(email, list, tablecount);
					setAuthincatedCode();
					if (sucessfulUpdated > 0) {
						tablecount = extractEmail(email, list, tablecount);
					}
					tablecount--;
				}

			} while (tablecount > 0);
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

		return list;
	}

	private void getIDAndTablename(String email, List<ForgetEmailUserModel> list, int tablecount) throws Exception {
		conn = DatabaseConnection.connectToDatabase();
		sql = "select * from " + tableName + " where " + emailField + "=? ";
		pst = conn.prepareStatement(sql);
		pst.setString(1, email);
		rs = pst.executeQuery();
		while (rs.next()) {
			finaltableName = type;
			finalIDNamefield = id;
			finalid = rs.getInt(id);
		}
	}

	private void setAuthincatedCode() {
		try {

			String uuid = UUID.randomUUID().toString();
			sql = "UPDATE " + finaltableName + " SET verification_code = '" + uuid + "' WHERE " + finalIDNamefield
					+ "=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, finalid);
			sucessfulUpdated = pst.executeUpdate();
			if (sucessfulUpdated > 0) {
				System.out.println("sucessfully updated");
			} else {
				System.out.println("not sucessfull updated");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private int extractEmail(String email, List<ForgetEmailUserModel> list, int tablecount)
			throws Exception, SQLException {

		sql = "select * from " + tableName + " where " + emailField + "=? ";
		pst = conn.prepareStatement(sql);
		pst.setString(1, email);
		rs = pst.executeQuery();
		while (rs.next()) {

			ForgetEmailUserModel model = new ForgetEmailUserModel();
			model.setEmail(rs.getString(emailField));
			model.setId(rs.getInt(id));
			model.setType(type);
			try {
				model.setAuthienciationCode(rs.getString("verification_code"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			list.add(model);
			System.out.println("Email form forget email :" + rs.getString(emailField));
			System.out.println("From :" + type);
			tablecount = 0;
		}
		return tablecount;
	}

	public boolean isAuthenticated(String tableName, int id, String code) {
		String tblNameID = null;
		if (tableName.equalsIgnoreCase("student")) {
			tblNameID = "student_id";
		} else if (tableName.equalsIgnoreCase("staff")) {
			tblNameID = "staff_id";
		} else if (tableName.equalsIgnoreCase("admin")) {
			tblNameID = "admin_id";
		}
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from " + tableName + " where " + tblNameID + "=? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				String vCode = rs.getString("verification_code");
				if (vCode.equals(code)) {
					return true;
				}
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
		return false;
	}


	public boolean resetPassword(String tableName, int id, String verificationCode, String password) {
		String idColumnName = null;
		String setPassword=null;
		try {
			if (tableName.equals("admin")) {
				idColumnName="admin_id";
				setPassword="admin_password";
			}
			else if(tableName.equals("student")){
				idColumnName="student_id";
				setPassword="student_password";
			}
			else if(tableName.equals("staff")){
				idColumnName="staff_id";
				setPassword="staff_password";
			}
			conn = DatabaseConnection.connectToDatabase();
			sql="select * from "+tableName+" where "+idColumnName +"=?" ;
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()){
				String code=rs.getString("verification_code");
				if (code.equals(verificationCode)) {
					sql = "UPDATE " + tableName + " SET "+ setPassword+" = '" + password + "' WHERE " + idColumnName
							+ "=?";
					pst=conn.prepareStatement(sql);
					pst.setInt(1, id);
					int count=pst.executeUpdate();
					if (count>0) {
						return true;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

}
