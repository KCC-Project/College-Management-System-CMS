package com.controller.admin;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.StudentModel;
import com.service.StudentServiceInterface;
import com.serviceimpl.StudentServiceImpl;

@WebServlet("/updateStudent")
@MultipartConfig(maxFileSize = 16177215)
public class updateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public updateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
	IOException {
	
		StudentModel studentModel = new StudentModel();
		StudentServiceInterface interfaccee = new StudentServiceImpl();
		System.out.println(request.getParameter("password"));
		System.out.println(request.getParameter("student_firstname"));
		
		String password = request.getParameter("password").trim();
		String confirm_passwrod = request.getParameter("confirm_password").trim();
		if (!password.equals(confirm_passwrod)) {
			response.sendRedirect("student.jsp?err=password did not match");
		} else {
			studentModel.setStudentID(Integer.parseInt(request.getParameter("txtID")));
			studentModel.setFirstname(request.getParameter("student_firstname"));
			studentModel.setMiddlename(request.getParameter("student_middlename"));
			studentModel.setLastname(request.getParameter("student_Lastname"));
			studentModel.setUsername(request.getParameter("student_username"));
			studentModel.setPassword(request.getParameter("confirm_password"));
			studentModel.setEmail(request.getParameter("email"));
			studentModel.setMobileNo(Integer.parseInt(request.getParameter("Mobile")));
			studentModel.setAddress(request.getParameter("Address"));
			studentModel.setGender(request.getParameter("fmale"));

			InputStream inputStream = null;
			Part filePart = request.getPart("filepath");
			if (filePart != null) {
				inputStream = filePart.getInputStream();
			}

			studentModel.setImage(getBytesFromInputStream(inputStream));

			if (interfaccee.update(studentModel)>0) {
				System.out.println("sucessful in entry");
				response.sendRedirect("viewStudent.jsp");
			} else {
				System.out.println("not sucessful in entry");
			}
			}

		}

		public static byte[] getBytesFromInputStream(InputStream is) throws IOException {

			try {
				ByteArrayOutputStream os = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];

				for (int len; (len = is.read(buffer)) != -1;) {
					os.write(buffer, 0, len);
				}
				return os.toByteArray();
			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
		}


	
		
		

}
