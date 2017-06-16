package CONTROLLER;

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

import Model.StudentModel;
import SERVICE.StudentServiceInterface;
import SERVICE.Impl.StudentServiceImpl;

@WebServlet("/addStudent")
@MultipartConfig(maxFileSize = 16177215)
public class Student_ADD_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("admin/addstudents.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentModel studentModel = new StudentModel();
		StudentServiceInterface interfaccee = new StudentServiceImpl();
		String password = request.getParameter("password").trim();
		String confirm_passwrod = request.getParameter("confirm_password").trim();
		if (!password.equals(confirm_passwrod)) {
			response.sendRedirect("admin/addstudents.jsp?err=password did not match");
		} else {
			studentModel.setFirstname(request.getParameter("student_firstname"));
			studentModel.setMiddlename(request.getParameter("student_middlename"));
			studentModel.setLastname(request.getParameter("student_Lastname"));
			studentModel.setUsername(request.getParameter("student_username"));
			studentModel.setPassword(request.getParameter("confirm_password"));
			studentModel.setEmail(request.getParameter("email"));
			studentModel.setMobileNo(Integer.parseInt(request.getParameter("Mobile")));
			studentModel.setAddress(request.getParameter("Address"));
			studentModel.setGender(request.getParameter("gender"));

			if (interfaccee.save(studentModel) == true) {
				System.out.println("sucessful in entry");
				response.sendRedirect("admin/managestudents.jsp");
			} else {
				System.out.println("not sucessful in entry");
			}

		}
	}


	
}
