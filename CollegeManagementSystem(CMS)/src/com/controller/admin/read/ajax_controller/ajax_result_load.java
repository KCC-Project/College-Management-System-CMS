package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ExamModelServiceImpl;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.util.JsonUtil;


@WebServlet("/ajax_result_load")
public class ajax_result_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		Map<String,Object> studentDataMap = new HashMap<String,Object>();
		studentDataMap.put("examDetails", new StudentExamResultModelServiceImpl().getAllRecord());
		studentDataMap.put("exam", new ExamInfoModelServiceImpl().getAllExamInfo());
		studentDataMap.put("student", new StudentServiceImpl().getAllRecord());
		studentDataMap.put("examtype", new ExamModelServiceImpl().getAllExamType());
		
		String JsonObj=JsonUtil.convertJavaToJson(studentDataMap);
		response.getWriter().write(JsonObj);
	}

}
