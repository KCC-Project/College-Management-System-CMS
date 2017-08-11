package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Student_Fee_AmountModel;
import com.service.StudentFeeAmountModelService;
import com.serviceimpl.StudentFeeAmountModelServiceImpl;

@WebServlet("/ajax_save_student_fee_amount")
public class ajax_save_student_fee_amount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] studentId = request.getParameterValues("student_id[]");
		String[] amount = request.getParameterValues("amount[]");
		System.out.println("studentId==" + studentId);
		System.out.println("amount==" + amount);
		PrintWriter out = response.getWriter();
		boolean status = false;

		int dublicateData = 0;
		
		//for checking if student fee alreay present or not
		for (int i = 0; i < studentId.length; i++) {
			StudentFeeAmountModelService service = new StudentFeeAmountModelServiceImpl();
			List<Student_Fee_AmountModel> model2 = service
					.getAllRecord(Integer.parseInt(studentId[i]));
			if (model2.size() > 0) {
				dublicateData++;
			}
		}
		System.out.println("size ==" + dublicateData);
		
		//if no duplicate entery found then saave
		if(dublicateData==0) {
		for (int i = 0; i < studentId.length; i++) {

			Student_Fee_AmountModel model = new Student_Fee_AmountModel();
			model.setStudent_id(Integer.parseInt(studentId[i]));
			model.setFee_amount(Integer.parseInt(amount[i]));
			StudentFeeAmountModelService service = new StudentFeeAmountModelServiceImpl();

			status = service.save(model);

		}
		}
		if (status == true) {
			out.println(1);
		} else {
			out.println(0);
		}
	}

}
