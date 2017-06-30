package com.controller.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamModel;
import com.model.SubjectModel;
import com.service.ExamModelServiceInterface;
import com.service.SubjectModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;
import com.serviceimpl.SubjectModelServiceImpl;


@WebServlet("/ajax_examType_load")
public class ajax_examType_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExamModelServiceInterface intferace= new ExamModelServiceImpl();
		List<ExamModel> examType = intferace.getAllExamType();
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = response.getWriter();
		out.write("<option disabled selected>Select Subject </option>");
		
		for (ExamModel model : examType) {		
			out.write("<option value="+model.getExamId()+">" + model.getExamTypeName() + "</option>");
		}
		out.flush();
	}

}
