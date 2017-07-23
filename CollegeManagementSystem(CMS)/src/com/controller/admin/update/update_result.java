package com.controller.admin.update;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daoimpl.StudentExamResultModelImpl;
import com.model.StudentExamResultModel;
import com.service.StudentExamResultModelServiceInterface;
import com.serviceimpl.StudentExamResultModelServiceImpl;


@WebServlet("/update_result")
public class update_result extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int student_id=Integer.parseInt(request.getParameter("student_id"));
	int exam_id=Integer.parseInt(request.getParameter("exam_id"));
	int examScore=Integer.parseInt(request.getParameter("examScore"));
	int is_attended=Integer.parseInt(request.getParameter("is_attended"));
	int passFailStatus=Integer.parseInt(request.getParameter("passFailStatus"));
	System.out.println("passFailStatus="+passFailStatus+" is_attended="+is_attended+" student_id="+student_id +" exam_id="+exam_id +" examScore="+examScore );
	PrintWriter out = response.getWriter();
	StudentExamResultModel model= new StudentExamResultModel();
	model.setStudentId(student_id);
	model.setExamId(exam_id);
	model.setExamMarks(examScore);
	model.setIsAttended(is_attended);
	model.setPassFailStatus(passFailStatus);
	StudentExamResultModelServiceInterface result= new StudentExamResultModelServiceImpl();
	boolean resultStatus=result.update(model);
	if (resultStatus==true) {
		out.println("Successfull");
	}else{
		out.println("UnSuccessfull");
	}
	}

}
