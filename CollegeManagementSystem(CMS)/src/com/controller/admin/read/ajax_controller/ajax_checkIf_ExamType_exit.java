package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamModel;
import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamModelServiceImpl;


@WebServlet("/ajax_checkIf_ExamType_exit")
public class ajax_checkIf_ExamType_exit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String examTypeName=request.getParameter("value");
		
		ExamModelServiceInterface model= new ExamModelServiceImpl();
		List<ExamModel> list=model.getAllExamType();
		PrintWriter out= response.getWriter();
		
		int sucess=0;
		if(list.size()>0) {
		for (ExamModel examModel : list) {
			if (examTypeName.equalsIgnoreCase(examModel.getExamTypeName())) {
			sucess=1;
			break;
			}else{
				sucess=0;
			}
		}
		}
		out.write(""+sucess);
		out.flush();
	}

}
