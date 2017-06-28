package com.controller.ajax_controller;

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

@WebServlet("/ajax_year_load")
public class ajax_year_load extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int program_id = Integer.parseInt(request.getParameter("id"));
		
		YearServiceInterface service = new YearServiceImpl();
		List<YearModel> year = service.getAllRecord();
		System.out.println("value in year="+year);
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = response.getWriter();
		out.write("<option disabled selected>Select Batch Year </option>");
		
		for (YearModel model : year) {		
			out.write("<option value="+model.getYear_id()+">" + model.getYear() + "</option>");
		}
		out.flush();
	}
}
