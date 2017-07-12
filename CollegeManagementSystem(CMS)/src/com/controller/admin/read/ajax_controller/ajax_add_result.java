package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.model.StudentExamResultModel;
import com.service.StudentExamResultModelServiceInterface;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_add_result")
public class ajax_add_result extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String[] studentId = request.getParameterValues("student_id[]");
		String[] student_examid = request.getParameterValues("student_examid[]");
		String[] exam_marks = request.getParameterValues("exam_marks[]");
		String[] student_attendence = request.getParameterValues("student_attendence[]");
		String[] student_passFail = request.getParameterValues("student_passFail[]");
		boolean isSucess = false;
		for (int i = 0; i < studentId.length; i++) {
			StudentExamResultModel result = new StudentExamResultModel();
			result.setStudentId(Integer.parseInt(studentId[i]));
			result.setExamId(Integer.parseInt(student_examid[i]));
			result.setExamMarks(Integer.parseInt(exam_marks[i]));
			result.setIsAttended(Integer.parseInt(student_attendence[i]));
			result.setPassFailStatus(Integer.parseInt(student_passFail[i]));
			StudentExamResultModelServiceInterface inter = new StudentExamResultModelServiceImpl();
			isSucess = inter.saveInformation(result);
		}
		if (isSucess == true) {
			out.println("Successfull");
		}else{
			out.println("not sucessful");
		}
	}

}
