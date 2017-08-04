package com.controller.admin.update;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.SemesterServiceInterface;
import com.serviceimpl.SemesterServiceImpl;


@WebServlet("/update_semester_no")
public class update_semester_no extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int semester_id=Integer.parseInt(request.getParameter("semester_id"));
	int semester_no=Integer.parseInt(request.getParameter("semester_no"));

	boolean resultStatus = false;
	if (semester_id != 0) {
		SemesterServiceInterface semester= new SemesterServiceImpl();
		resultStatus=semester.update_semesterNo(semester_id, semester_no);
	}
	
	
	PrintWriter out = response.getWriter();
		if (resultStatus==true) {
			out.println("Successfull");
		}else{
			out.println("UnSuccessfull");
		}
		
	}

}