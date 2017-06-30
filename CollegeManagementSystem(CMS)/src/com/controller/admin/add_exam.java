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
		if (examTypeName.length()<3) {
			response.sendRedirect("admin/manageExam.jsp?error=examNameLessThan3");
		}else{
		String summary=null;
		try {
			 summary=request.getParameter("summary");
		} catch (Exception e) {
			System.err.println("No summary");
		}
	
		ExamModelServiceInterface modelInterface= new ExamModelServiceImpl();
		if (examTypeName.equalsIgnoreCase("")) {
			
			response.sendRedirect("admin/manageExam.jsp?error=examNameNull");
		}else{
			System.out.println("saved exam="+modelInterface.saveExamType(examTypeName,summary));
			response.sendRedirect("admin/manageExam.jsp");
		}
		
	}
	}

}
