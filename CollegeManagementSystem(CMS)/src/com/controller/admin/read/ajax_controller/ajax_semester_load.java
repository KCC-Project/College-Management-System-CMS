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
		if (program_id.equalsIgnoreCase("")) {
			System.out.println("no data recevied");
		}else{
			
			int id=Integer.parseInt(program_id);
			System.out.println(program_id);
			SemesterServiceInterface semester= new SemesterServiceImpl();
			
			Object[] obj = new Object[7];
			obj[1]=5;
			
			System.out.println(obj[1]);
			String jsonSearch=JsonUtil.convertJavaToJson(semester.searchByFields(obj));
			System.out.println("json checking="+jsonSearch);
			
			String semesterJson=JsonUtil.convertJavaToJson(semester.loadByProgramId(id));
			
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			System.out.println("json="+semesterJson);
			response.getWriter().write(semesterJson);
		}
	}

}
