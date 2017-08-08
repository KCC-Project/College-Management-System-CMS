package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FeeModel;
import com.model.FeeUpdateModel;
import com.serviceimpl.FeeModelServiceImpl;

@WebServlet("/ajax_update_account")
public class ajax_update_account extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String[] studentId = request.getParameterValues("student_id[]");
		String[] amount = request.getParameterValues("amount[]");
		String[] semester_number = request.getParameterValues("section_number[]");
	System.out.println("11111111111111111111111111111111111111");
		boolean isSucess = false;
		for (int i = 0; i < studentId.length; i++) {
			FeeModel model= new FeeModel();
			FeeUpdateModel update=new FeeUpdateModel();
			model.setStudent_fee_amount_id(Integer.parseInt(studentId[i]));
			model.setDue_amount(Integer.parseInt(amount[i]));
			model.setSemester_no(Integer.parseInt(semester_number[i]));
			//isSucess=new FeeModelServiceImpl().update(feeModel, model));
		}
		if (isSucess == true) {
			out.println("Successfull");
		}else{
			out.println("not sucessful");
		}
	
	}

}
