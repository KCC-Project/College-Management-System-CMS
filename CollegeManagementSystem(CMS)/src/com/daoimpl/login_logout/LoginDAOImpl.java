package com.daoimpl.login_logout;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.login_logout.LoginDAOInterface;
import com.daoimpl.DatabaseConnection;
import com.model.LoginModel;

public class LoginDAOImpl implements LoginDAOInterface {
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	public boolean getUserEntryPassword(LoginModel loginModel) {
		try {
			int databaseNameIndex=loginModel.getSelectedIndex();
			String tableName;
			String username;
			String password;
			String email;
			if (databaseNameIndex==1) {
				tableName="admin";
				username="admin_username";
				password="admin_password";
				email="admin_email";
			}else if(databaseNameIndex==2){
				tableName="staff"; 
				username="staff_username";
				password="staff_password";
				email="staff_email";
			}else{
				tableName="student";
				username="student_username";
				password="student_password";
				email="student_email";
			}
			
			 conn = DatabaseConnection.connectToDatabase();
			sql = "select * from "+tableName+" where ((BINARY "+username+"=? or "+email+"=?) and BINARY  "+password +"=?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, loginModel.getUserEntry());
			pst.setString(2, loginModel.getUserEntry());
			pst.setString(3, loginModel.getPassword());
			rs=pst.executeQuery();
			if (rs.next()) {
				System.out.println("login");
				return true;
			}else{
				System.out.println("notlogin");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
