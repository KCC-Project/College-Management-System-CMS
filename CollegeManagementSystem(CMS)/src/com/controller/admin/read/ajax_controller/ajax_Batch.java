package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax_Batch")
public class ajax_Batch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int dateShort;
		String programShort = null;
		String date = request.getParameter("date");
		String program = request.getParameter("program");
		dateShort = Integer.parseInt(date.substring(0, 4));
		int len = program.length();
		for (int i = 0; i < len; i++) {
			if (program.charAt(i) == '(') {
				programShort = program.substring(i + 1, len - 1);
			}
		}
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		out.write("<option  disabled selected>Select Batch</option>");
		out.write("<option >" + programShort + "-Batch-" + dateShort + "</option>");
		out.flush();
	}

}
