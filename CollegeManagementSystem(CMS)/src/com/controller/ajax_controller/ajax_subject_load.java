package com.controller.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Faculty_ProgramModel;
import com.model.SubjectModel;
import com.service.Faculty_Program_Model_Service;
import com.service.SubjectModelServiceInterface;
import com.serviceimpl.Faculty_Program_Model_Service_Impl;
import com.serviceimpl.SubjectModelServiceImpl;


@WebServlet("/ajax_subject_load")
public class ajax_subject_load extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SubjectModelServiceInterface intface= new SubjectModelServiceImpl();
		List<SubjectModel> subject = intface.getAllrecord();
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = response.getWriter();
		out.write("<option disabled selected>Select Subject </option>");
		
		for (SubjectModel model : subject) {		
			out.write("<option value="+model.getSubject_id()+">" + model.getSubjectName() + "</option>");
		}
		out.flush();
	}

}
