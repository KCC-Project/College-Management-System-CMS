package CONTROLLER;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.StudentModel;
import SERVICE.StudentServiceInterface;
import SERVICE.Impl.StudentServiceImpl;

@WebServlet("/addStudent")
public class Student_ADD_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("student.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentModel studentModel = new StudentModel();
		StudentServiceInterface interfaccee = new StudentServiceImpl();

		studentModel.setFirstname(request.getParameter("student_firstname"));
		studentModel.setMiddlename(request.getParameter("student_middlename"));
		studentModel.setLastname(request.getParameter("student_Lastname"));
		studentModel.setUsername(request.getParameter("student_username"));
		studentModel.setPassword(request.getParameter("confirm_password"));
		studentModel.setEmail(request.getParameter("email"));
		studentModel.setMobileNo(Integer.parseInt(request.getParameter("Mobile")));
		studentModel.setAddress(request.getParameter("Address"));
		studentModel.setGender(request.getParameter("fmale"));
		//studentModel.setImage();//image baki

		if (interfaccee.save(studentModel) == true) {
			System.out.println("sucessful in entry");
			response.sendRedirect("student.jsp");
		} else {
			System.out.println("not sucessful in entry");
		}

	}

	public void postGetMethod(HttpServletRequest request, HttpServletResponse response) {

	}

}
