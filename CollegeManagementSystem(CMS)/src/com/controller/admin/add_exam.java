package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamModel;
import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;

@WebServlet("/add_exam")
public class add_exam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String examTypeName=request.getParameter("add_exam_type");
		System.out.println("exam type name is="+examTypeName);
		ExamModelServiceInterface modelInterface= new ExamModelServiceImpl();
		if (examTypeName.equalsIgnoreCase("")) {
			
			response.sendRedirect("admin/manageExam.jsp");
		}else{
			System.out.println("saved exam="+modelInterface.saveExamType(examTypeName));
			response.sendRedirect("admin/manageExam.jsp");
		}
		
	}

}
