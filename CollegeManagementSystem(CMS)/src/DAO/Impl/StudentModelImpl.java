package DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.StudentModelInterface;
import Model.StudentModel;

public class StudentModelImpl implements StudentModelInterface {

	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	public boolean save(StudentModel studentModel) {

		try {
			if ((studentModel.getFirstname().equals("") || studentModel.getLastname().equals("")  || studentModel.getLastname().equals("") || studentModel.getUsername().equals("") || studentModel.getPassword().equals("" ))) {
				
				
				return false;
			} else {
				conn = DatabaseConnection.connectToDatabase();
				sql = "insert into student (Semester_ID,Notice_ID,Student_UserName,Student_Password,Student_FirstName,Student_MiddleName,Student_LastName,Student_Email,Student_Address,Student_Phone,Student_Image,Student_Gender) values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pst = conn.prepareStatement(sql);
				int col = 1;
				pst.setInt(col++, 1);
				pst.setInt(col++, 2);
				pst.setString(col++, studentModel.getUsername());
				pst.setString(col++, studentModel.getPassword());
				pst.setString(col++, studentModel.getFirstname());
				pst.setString(col++, studentModel.getMiddlename());
				pst.setString(col++, studentModel.getLastname());
				pst.setString(col++, studentModel.getEmail());
				pst.setString(col++, studentModel.getAddress());
				pst.setInt(col++, studentModel.getMobileNo());
				pst.setBytes(col++, studentModel.getImage()); //// image
				pst.setString(col++, studentModel.getGender());
				int count = pst.executeUpdate();
				if (count > 0) {
					return true;
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

}
