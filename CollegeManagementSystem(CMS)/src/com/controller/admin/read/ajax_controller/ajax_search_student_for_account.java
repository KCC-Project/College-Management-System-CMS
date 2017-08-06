package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentModelInterface;
import com.model.StudentModel;
import com.service.StudentServiceInterface;
import com.serviceimpl.StudentServiceImpl;

@WebServlet("/ajax_search_student_for_account")
public class ajax_search_student_for_account extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("val");
		//System.out.println("value==" + name);
		StudentServiceInterface inter = new StudentServiceImpl();
		List<StudentModel> model = inter.searchForAccount(name);
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write("<option disabled selected>Select Student </option>");
		for (StudentModel studentModel : model) {
			boolean isEmpty = false;
			try {
				isEmpty = studentModel.getMiddlename().isEmpty();
			} catch (Exception e) {
				isEmpty=true;
			}
			if (isEmpty==true) {
				out.write("<option value=" + studentModel.getStudentID() + ">" + studentModel.getFirstname() +" "+studentModel.getLastname()+ "</option>");
			}else {
				out.write("<option value=" + studentModel.getStudentID() + ">" + studentModel.getFirstname() + " "+studentModel.getMiddlename()+" "+studentModel.getLastname()+"</option>");
			}
			
		//System.out.println("qqq======="+studentModel.getFirstname());
		}
		out.flush();
	}

}
