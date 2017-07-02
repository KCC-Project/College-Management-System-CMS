package com.controller.ajax_controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_ViewExamTypeSummary")
public class ajax_ViewExamTypeSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("value");
		PrintWriter out= response.getWriter();
		if (id.equalsIgnoreCase("")) {
			response.sendRedirect("../manageExamType.jsp?error=ExamTypeExit");
		} else {
			int iD = Integer.parseInt(id);
			ExamModelServiceInterface model = new ExamModelServiceImpl();
			model.getSelectedExam(iD);
			String json=JsonUtil.convertJavaToJson((model.getSelectedExam(iD)));
			System.out.println("json format=="+json);
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(json);
		}
	}
}
