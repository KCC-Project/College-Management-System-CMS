package com.daoimpl.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import com.dao.admin.StudentModelInterface;
import com.daoimpl.DatabaseConnection;
import com.model.StudentModel;

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
				sql = "insert into student (student_username,student_password,"
						+ "student_firstname,student_middlename,student_lastname,student_email,"
						+ "student_address,student_phone,student_image,student_gender,student_identitycard,status"
						+ "verification_code) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pst = conn.prepareStatement(sql);
				int col = 1;

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
				pst.setString(col++, studentModel.getIdentityCard());
				pst.setInt(col++, studentModel.getStatus());
				pst.setString(col++, studentModel.getVerificationCode());
				int count = pst.executeUpdate();
				if (count > 0) {
					return true;
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				model.setStudentID(rs.getInt("student_id"));
				model.setFirstname(rs.getString("student_firstname"));
				model.setMiddlename(rs.getString("student_middlename"));
				model.setLastname(rs.getString("student_lastname"));
				model.setEmail(rs.getString("student_email"));
				model.setMobileNo(rs.getInt("student_phone"));
				model.setAddress(rs.getString("student_address"));
				model.setGender(rs.getString("student_gender"));
				model.setUsername(rs.getString("student_username"));
				model.setIdentityCard(rs.getString("student_identitycard"));
				model.setStatus(rs.getInt("status"));

				student.add(model);
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
		return student;
	}

	// method for reading only one student information from student table of
	// database
	// and storing retrive values into Student Model
	public StudentModel readId(int id) {
		StudentModel model = new StudentModel();
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "select * from student where student_id=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				model.setFirstname(rs.getString("student_firstname"));
				model.setMiddlename(rs.getString("student_middlename"));
				model.setLastname(rs.getString("student_lastname"));
				model.setEmail(rs.getString("student_email"));
				model.setMobileNo(rs.getInt("student_phone"));
				model.setAddress(rs.getString("student_address"));
				model.setGender(rs.getString("student_gender"));
				model.setUsername(rs.getString("student_username"));
				model.setIdentityCard(rs.getString("student_identitycard"));
				model.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return model;
	}

	// Metod for Deleting selected id form table
	public int delete(int id) {
		int result = 0;
		try {
			Connection connection = DatabaseConnection.connectToDatabase();
			sql = "delete from student where student_id=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return result;
	}

	// Method for updating information of Student of particular id
	public int update(StudentModel stu) {
		int result = 0;

		try {
			conn = DatabaseConnection.connectToDatabase();
			sql = "update student set student_username=?,student_password=?,"
					+ "student_firstname=?,student_middlename=?,student_lastname=?,student_email=?,"
					+ "student_address=?,student_phone=?,student_image=?,student_gender=? ,status=?where student_id=?";
			pst = conn.prepareStatement(sql);
			int col = 1;

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
			pst.setInt(col++, stu.getStatus());
			pst.setInt(col++, stu.getStudentID());
			result = pst.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return result;
	}

}
