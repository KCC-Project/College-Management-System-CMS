package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.StudentModelInterface;
import com.model.StudentModel;
import com.model.StudentSemesterModel;

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

	@Override
	public List<StudentModel> searchByField(Object[] obj) {
		List<Object> parameters = new ArrayList<Object>();
		List<StudentModel> stModel = new ArrayList<>();
		int student_id = 0;
		String student_firstname = null;
		String student_middlename = null;
		String student_lastname = null;
		String student_email = null;
		int student_phone = 0;
		String student_address = null;
		int student_gender = 5;
		String student_username = null;
		String student_identitycard = null;
		int status = 5;
		
		int start = 0;
		int limit = 0;
		if (obj[0] != null) {  student_id = Integer.parseInt(obj[0].toString()); }
		if (obj[1] != null) {  student_firstname = obj[1].toString(); }
		if (obj[2] != null) {  student_middlename = obj[2].toString(); }
		if (obj[3] != null) {  student_lastname = obj[3].toString(); }
		if (obj[4] != null) {  student_email = obj[4].toString(); }
		if (obj[5] != null) {  student_phone = Integer.parseInt(obj[5].toString()); }
		if (obj[6] != null) {  student_address = obj[6].toString(); }
		if (obj[7] != null) {  student_gender = Integer.parseInt(obj[7].toString()); }
		if (obj[8] != null) {  student_username = obj[8].toString(); }
		if (obj[9] != null) {  student_identitycard = obj[9].toString(); }
		if (obj[10] != null) {  status = Integer.parseInt(obj[10].toString()); }
		if (obj[11] != null) {  start = Integer.parseInt(obj[11].toString()); }
		if (obj[12] != null) {  limit = Integer.parseInt(obj[12].toString()); }
		
		try {
			 StringBuilder query = new StringBuilder("SELECT * FROM student WHERE 1=1");
		        
				if (student_id != 0) {
		            query.append(" AND student_id = ?");
		            parameters.add(student_id);
		        }
				if (student_firstname != null) {
		            query.append(" AND student_firstname = ?");
		            parameters.add(student_firstname);
		        }
				if (student_middlename != null) {
		            query.append(" AND student_middlename = ?");
		            parameters.add(student_middlename);
		        }
				if (student_lastname != null) {
		            query.append(" AND student_lastname = ?");
		            parameters.add(student_lastname);
		        }
				if (student_email != null) {
		            query.append(" AND student_email = ?");
		            parameters.add(student_email);
		        }
				if (student_phone != 0) {
		            query.append(" AND student_phone = ?");
		            parameters.add(student_phone);
		        }
				if (student_address != null) {
		            query.append(" AND student_address = ?");
		            parameters.add(student_address);
		        }
				if (student_gender != 5) {
		            query.append(" AND student_gender = ?");
		            parameters.add(student_gender);
		        }
				if (student_username != null) {
		            query.append(" AND student_username = ?");
		            parameters.add(student_username);
		        }
				if (student_identitycard != null) {
		            query.append(" AND student_identitycard = ?");
		            parameters.add(student_identitycard);
		        }
				if (status != 5) {
		            query.append(" AND status = ?");
		            parameters.add(status);
		        }
				if (start != 0) {
		            query.append(" AND start = ?");
		            parameters.add(start);
		        }
				if (limit != 0) {
		            query.append(" AND limit = ?");
		            parameters.add(limit);
		        }
			Connection connection = DatabaseConnection.connectToDatabase();
			
			 String Query = query.toString();
			    System.out.println("From student Model="+Query);
		        conn = DatabaseConnection.connectToDatabase();
		        pst = conn.prepareStatement(Query);

		        int i = 1;
		        for (Object parameter : parameters) {
		            pst.setObject(i++, parameter);
		        }
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
				stModel.add(model);
			}
		} catch (Exception e) {
			System.out.println("error for search student table="+e.getMessage());
		} finally {
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return stModel;
	}

}
