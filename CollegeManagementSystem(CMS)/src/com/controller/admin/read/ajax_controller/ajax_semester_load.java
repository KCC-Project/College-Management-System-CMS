package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.SemesterServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_semester_load")
public class ajax_semester_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String program_id = request.getParameter("id");
		String semester_id = request.getParameter("semester_id");
		int start = 1;
		int limit = 2;
		
		String jsonResponse = null;
		
		if (program_id != null && !program_id.isEmpty()) {
			int id=Integer.parseInt(program_id);
			//System.out.println(program_id);
			SemesterServiceInterface semester= new SemesterServiceImpl();
			
			Object[] obj = new Object[10];
			obj[2]=id;
			
			System.out.println(obj[1]);
			jsonResponse=JsonUtil.convertJavaToJson(semester.searchByFields(obj));
			System.out.println("json checking="+jsonResponse);
			
			//String semesterJson=JsonUtil.convertJavaToJson(semester.loadById(id));
			
			
		}else if(!semester_id.equalsIgnoreCase("")){
			int id=Integer.parseInt(semester_id);
			SemesterServiceInterface semester= new SemesterServiceImpl();
			
			Object[] obj = new Object[10];
			obj[0]=id;
			
			jsonResponse=JsonUtil.convertJavaToJson(semester.searchByFields(obj));
			
		}else {
			System.out.println("No data received");
		}
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		System.out.println("json="+jsonResponse);
		response.getWriter().write(jsonResponse);
	}

}
