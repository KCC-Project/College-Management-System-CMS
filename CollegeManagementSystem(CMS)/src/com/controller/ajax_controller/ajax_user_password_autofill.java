package com.controller.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax_user_password_autofill")
public class ajax_user_password_autofill extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		PrintWriter out = response.getWriter();
	//	System.out.println("idddd:"+id);
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		//out.write("<p>"+id+"</p>");
		out.write(id);
		out.flush();
	}

}
