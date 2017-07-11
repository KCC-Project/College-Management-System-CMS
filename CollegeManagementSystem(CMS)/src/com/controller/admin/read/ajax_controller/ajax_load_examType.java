package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax_load_examType")
public class ajax_load_examType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		List list= new ArrayList();
		Object[] obj = new Object[10];
		obj[0] = subjectId;
		obj[8] = 1;
		
	}

}
