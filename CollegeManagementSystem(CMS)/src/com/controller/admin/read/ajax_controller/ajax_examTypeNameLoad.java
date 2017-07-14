package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamInfoModel;
import com.service.ExamInfoModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;


@WebServlet("/ajax_examTypeNameLoad")
public class ajax_examTypeNameLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("hereeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		System.out.println("subId=="+subjectId);
		Object[] obj = new Object[15];
		obj[1] = subjectId;
		obj[8] = 0;
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write("<option disabled selected>Select Exam Type</option>");
		
		ExamInfoModelServiceInterface inter= new ExamInfoModelServiceImpl();
		
		List<ExamInfoModel> model= inter.searchByField(obj);
		System.out.println("model size="+model.size());
		
		for (ExamInfoModel examInfoModel : model) {
			System.out.println("examTypename="+examInfoModel.getExamTypeName()+"  "+"exmInfoId="+examInfoModel.getExamId());
			out.write("<option value="+examInfoModel.getExamId()+">" + examInfoModel.getExamTypeName() + "</option>");
		}
		out.flush();
	}

}
