package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax_save_account")
public class ajax_save_account extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String[] studentId = request.getParameterValues("student_id[]");
		String[] amount = request.getParameterValues("amount[]");
		String[] section_number = request.getParameterValues("section_number[]");
		System.out.println(studentId + "  " + amount + " " + section_number);
		boolean isSucess = false;
		for (int i = 0; i < studentId.length; i++) {

		}
	}
}
