package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.SemesterModel;
import com.service.SemesterServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_getSemesterId")
public class ajax_getSemesterId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		
		
		
		
		Object[] obj = new Object[10];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;
		int storeSemesterId=0;
		SemesterServiceInterface inter = new SemesterServiceImpl();
		List<SemesterModel> getSemester_id = inter.searchByFields(obj);
		for (SemesterModel semesterModel : getSemester_id) {
			storeSemesterId=semesterModel.getSemester_id();
		}
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		
		
		out.write(""+storeSemesterId);
		out.flush();
	}

}
