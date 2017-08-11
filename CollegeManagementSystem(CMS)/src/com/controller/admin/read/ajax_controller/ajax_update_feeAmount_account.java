package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Student_Fee_AmountModel;
import com.service.StudentFeeAmountModelService;
import com.serviceimpl.StudentFeeAmountModelServiceImpl;

/**
 * Servlet implementation class ajax_update_feeAmount_account
 */
@WebServlet("/ajax_update_feeAmount_account")
public class ajax_update_feeAmount_account extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] studentId = request.getParameterValues("student_id[]");
		String[] amount = request.getParameterValues("amount[]");
		System.out.println("studentId from update ==" + studentId[0]);
		System.out.println("amount from update ==" + amount[0]);
		int  status = 0;

		for (int i = 0; i < studentId.length; i++) {

			Student_Fee_AmountModel model = new Student_Fee_AmountModel();
			model.setStudent_id(Integer.parseInt(studentId[i]));
			model.setFee_amount(Integer.parseInt(amount[i]));
			StudentFeeAmountModelService service = new StudentFeeAmountModelServiceImpl();

			status = service.update(model);

		}
		if (status==1) {
			response.getWriter().println(1);
		}else {
			response.getWriter().println(0);
		}
	}

}
