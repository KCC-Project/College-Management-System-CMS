package com.controller.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.StudentModel;
import com.service.StudentServiceInterface;
import com.serviceimpl.StudentServiceImpl;

@WebServlet("/ajax_changeUsername")
public class ajax_changeUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String userID = request.getParameter("userID");
		PrintWriter out = response.getWriter();
		
		StudentServiceInterface student = new StudentServiceImpl();
		List<StudentModel> mo = student.getAllRecord();
		
		for (StudentModel model : mo) {
			String user = model.getUsername();
		if (user.equalsIgnoreCase(userID)) {
				out.write("Match_Found");
				out.flush();
				System.out.println("match Found");
				break;
			}else{
				out.write("");
				out.flush();
			}
			break;
		}
		
	
	}

}
