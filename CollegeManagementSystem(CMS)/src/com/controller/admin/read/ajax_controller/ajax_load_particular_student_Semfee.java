package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Student_Fee_AmountModel;
import com.service.StudentFeeAmountModelService;
import com.serviceimpl.StudentFeeAmountModelServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_load_particular_student_Semfee")
public class ajax_load_particular_student_Semfee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int student_id=Integer.parseInt(request.getParameter("student_id"));
		System.out.println("student id=="+student_id);
		StudentFeeAmountModelService service = new StudentFeeAmountModelServiceImpl();
		List<Student_Fee_AmountModel> model2 = service.getAllRecord(student_id);
		
		List list = new ArrayList();
		for (Student_Fee_AmountModel student_Fee_AmountModel : model2) {
			Map<String, Object> map= new HashMap<String,Object>();
			map.put("studentid", student_Fee_AmountModel.getStudent_id());
			map.put("semFeeAmount", student_Fee_AmountModel.getFee_amount());
			list.add(map);
			
		}
		String json=JsonUtil.convertJavaToJson(list);
		System.out.println("ajax_load_particular_student_Semfee=="+json);
		response.getWriter().write(json);
	}

}
