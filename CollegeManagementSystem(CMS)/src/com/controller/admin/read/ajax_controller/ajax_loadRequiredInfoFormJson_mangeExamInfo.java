package com.controller.admin.read.ajax_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ExamInfoModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_loadRequiredInfoFormJson_mangeExamInfo")
public class ajax_loadRequiredInfoFormJson_mangeExamInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("value");
		if (id.equalsIgnoreCase("")) {

		}else{
			int iD=Integer.parseInt(id);
			ExamInfoModelServiceInterface inter= new ExamInfoModelServiceImpl();
			String examInfoJson=JsonUtil.convertJavaToJson(inter.getSelectedInfo(iD));
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			System.out.println("mausamJson="+examInfoJson);
			response.getWriter().write(examInfoJson);
		}
	}

}
