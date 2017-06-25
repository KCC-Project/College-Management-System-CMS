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
import java.util.UUID;

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

	String finaltableName = null;
	int finalid;
	String finalIDNamefield = null;

	private int sucessfulUpdated;

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
					getIDAndTablename(email, list, tablecount);
					setAuthincatedCode();
					if (sucessfulUpdated>0) {
						tablecount = extractEmail(email, list, tablecount);
					}
					tablecount--;
				}

				else if (tablecount == 2) {
					tableName = "staff";
					emailField = "Staff_Email";
					id = "Staff_ID";
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
					id = "admin_ID";
					type = "Admin";
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
			sql = "UPDATE " + finaltableName + " SET verificationCode = '" + uuid + "' WHERE " + finalIDNamefield
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
				model.setAuthienciationCode(rs.getString("verificationCode"));
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
			tblNameID = "Student_ID";
		} else if (tableName.equalsIgnoreCase("staff")) {
			tblNameID = "Staff_ID";
		} else if (tableName.equalsIgnoreCase("admin")) {
			tblNameID = "admin_ID";
		}
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "select * from " + tableName + " where " + tblNameID + "=? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				String vCode = rs.getString("verificationCode");
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

}
