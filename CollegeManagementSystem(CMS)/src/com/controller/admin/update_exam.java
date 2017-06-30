package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;

@WebServlet("/update_exam")
public class update_exam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String examName=request.getParameter("update_exam_type");
		String idString = request.getParameter("id");
		if (examName.equalsIgnoreCase("") || idString.equalsIgnoreCase("id")) {
			response.sendRedirect("admin/manageExamType.jsp");
		}else{
			int id= Integer.parseInt(idString);
		ExamModelServiceInterface examModel= new ExamModelServiceImpl();
		System.out.println("exam type update="+examModel.updateExamType(examName, id));
		response.sendRedirect("admin/manageExamType.jsp");
		}
	}

}
