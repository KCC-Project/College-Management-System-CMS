package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;


@WebServlet("/deleteExam")
public class deleteExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteExam() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deleteExamId = request.getParameter("deleteIdJson");
		System.out.println("id===="+deleteExamId);
		ExamModelServiceInterface interfaceExam = new ExamModelServiceImpl();
		if (deleteExamId.equalsIgnoreCase("")) {
			response.sendRedirect("admin/manageExamType.jsp?error=deletingexam_ID_null");
		} else {
			int id = Integer.parseInt(deleteExamId);
			int sucessfull=interfaceExam.deleteExamType(id);
			if (sucessfull>0) {
				response.sendRedirect("admin/manageExamType.jsp?error=deleteExamType_sucessful");
			}else{
			response.sendRedirect("admin/manageExamType.jsp?error=in_use");
			}
		}
	}
	
}
