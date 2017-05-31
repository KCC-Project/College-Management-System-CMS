package DAO.Impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static	Connection conn = null;
	public static Connection connectToDatabase() throws Exception {
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/cms";
			conn = (Connection) DriverManager.getConnection(url, "root", "");
			return conn;
		} catch (ClassNotFoundException e) {
			throw new Exception("Driver not found"+e);
		}
	}
}
