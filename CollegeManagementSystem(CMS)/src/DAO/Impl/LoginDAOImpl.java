package DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.LoginDAOInterface;
import Model.LoginModel;

public class LoginDAOImpl implements LoginDAOInterface {
	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;

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
				tableName="teacher"; //here error
				username="";
				password="";
				email="";
			}else{
				tableName="student";
				username="Student_UserName";
				password="Student_Password";
				email="Student_Email";
			}
			
			Connection conn = DatabaseConnection.connectToDatabase();
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
		}
		return false;

	}

}
