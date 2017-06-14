package DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import DAO.StudentModelInterface;
import Model.StudentModel;

public class StudentModelImpl implements StudentModelInterface {

	private String sql;
	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;

	// method for saving Student information
	public boolean save(StudentModel studentModel) {
		try {
			if ((studentModel.getFirstname().equals("") || studentModel.getLastname().equals("")
					|| studentModel.getLastname().equals("") || studentModel.getUsername().equals("")
					|| studentModel.getPassword().equals(""))) {

				return false;
			} else {
				conn = DatabaseConnection.connectToDatabase();
				sql = "insert into student (Semester_ID,Student_UserName,Student_Password,"
						+ "Student_FirstName,Student_MiddleName,Student_LastName,Student_Email,"
						+ "Student_Address,Student_Phone,Student_Image,Student_Gender) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?)";
				pst = conn.prepareStatement(sql);
				int col = 1;
				
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

	// method for retriving all records from database of student from student
	// table
	// and storing retrive values in Student Model
	public List<StudentModel> getAllRecord() {
		List<StudentModel> student = new ArrayList<>();
		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "Select * from student";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				StudentModel model = new StudentModel();
				model.setStudentID(rs.getInt("Student_ID"));
				model.setFirstname(rs.getString("Student_FirstName"));
				model.setMiddlename(rs.getString("Student_MiddleName"));
				model.setLastname(rs.getString("Student_LastName"));
				model.setEmail(rs.getString("Student_Email"));
				model.setMobileNo(rs.getInt("Student_Phone"));
				model.setAddress(rs.getString("Student_Address"));
				model.setGender(rs.getString("Student_Gender"));

				try {
					byte[] imagedata = rs.getBytes("Student_Image");

					model.setImage(imagedata);
				} catch (Exception e) {
					JOptionPane.showMessageDialog(null, " has no profile Picture insert One");
				}

				student.add(model);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return student;
	}

	// method for reading only one student information from student table of database
	// and storing retrive values into Student Model
	public StudentModel readId(int id) {
		StudentModel model = new StudentModel();
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "select * from student where Student_ID=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {

				model.setFirstname(rs.getString("Student_FirstName"));
				model.setMiddlename(rs.getString("Student_MiddleName"));
				model.setLastname(rs.getString("Student_LastName"));
				model.setEmail(rs.getString("Student_Email"));
				model.setMobileNo(rs.getInt("Student_Phone"));
				model.setAddress(rs.getString("Student_Address"));
				model.setGender(rs.getString("Student_Gender"));
				model.setUsername(rs.getString("Student_UserName"));
				model.setPassword(rs.getString("Student_Password"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}

	//Metod for Deleting selected id form table
	public int delete(int id) {
		int result = 0;
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "delete from student where Student_ID=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//Method for updating information of Student of particular id
	public int update(StudentModel stu) {
		int result = 0;

		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update student set Semester_ID=?,Student_UserName=?,Student_Password=?,"
					+ "Student_FirstName=?,Student_MiddleName=?,Student_LastName=?,Student_Email=?,"
					+ "Student_Address=?,Student_Phone=?,Student_Image=?,Student_Gender=? where Student_ID=?";
			pst = conn.prepareStatement(sql);
			int col = 1;
		
			pst.setInt(col++, 2);
			pst.setString(col++, stu.getUsername());
			pst.setString(col++, stu.getPassword());
			pst.setString(col++, stu.getFirstname());
			pst.setString(col++, stu.getMiddlename());
			pst.setString(col++, stu.getLastname());
			pst.setString(col++, stu.getEmail());
			pst.setString(col++, stu.getAddress());
			pst.setInt(col++, stu.getMobileNo());

			pst.setBytes(col++, stu.getImage()); //// image
			pst.setString(col++, stu.getGender());
			pst.setInt(col++, stu.getStudentID());
			result = pst.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

}
