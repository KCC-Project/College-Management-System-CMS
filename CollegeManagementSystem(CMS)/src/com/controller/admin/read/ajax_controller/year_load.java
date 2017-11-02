package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.YearModel;
import com.service.YearServiceInterface;
import com.serviceimpl.YearServiceImpl;
import com.util.JsonUtil;


@WebServlet("/year_load")
public class year_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			System.out.println("this is working");
		
			//int program_id = Integer.parseInt(request.getParameter("id"));
			
			YearServiceInterface service = new YearServiceImpl();
			List<YearModel> year = service.getAllRecord();
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			
			PrintWriter out = response.getWriter();
			response.getWriter().write(JsonUtil.convertJavaToJson(year));
			System.out.println("json="+JsonUtil.convertJavaToJson(year));
			out.flush();
	}	

}
