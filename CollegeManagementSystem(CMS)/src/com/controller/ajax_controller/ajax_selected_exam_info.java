package com.controller.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamInfoModel;
import com.service.ExamInfoModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;

import net.sf.json.JSONObject;

@WebServlet("/ajax_selected_exam_info")
public class ajax_selected_exam_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int iD = Integer.parseInt(id);
		ExamInfoModelServiceInterface model = new ExamInfoModelServiceImpl();
		model.getSelectedInfo(iD);
	

	}

}
