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

	public void getUserEntryPassword(LoginModel loginModel) {
		try {
			Connection conn = DatabaseConnection.connectToDatabase();
			sql = "select * from admin where ((BINARY admin_username=? or admin_email=?) and BINARY  admin_password=?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, loginModel.getUserEntry());
			pst.setString(2, loginModel.getUserEntry());
			pst.setString(3, loginModel.getPassword());
			rs=pst.executeQuery();
			if (rs.next()) {
				System.out.println("login");
			}else{
				System.out.println("notlogin");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
