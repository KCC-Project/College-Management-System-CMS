package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;

/**
 * Servlet implementation class deleteExam
 */
@WebServlet("/deleteExam")
public class deleteExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public deleteExam() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deleteExamId = request.getParameter("deleteId");
		ExamModelServiceInterface interfaceExam = new ExamModelServiceImpl();
		if (deleteExamId.equalsIgnoreCase("")) {
			response.sendRedirect("admin/manageExam.jsp?error=deletingexam");
		} else {
			int id = Integer.parseInt(deleteExamId);
			System.out.println("Exam deleted=" + interfaceExam.deleteExamType(id));
			response.sendRedirect("admin/manageExam.jsp");
		}
	}
	}


