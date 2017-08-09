package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FeeModel;
import com.model.FeeUpdateModel;
import com.service.FeeModelServiceInterface;
import com.serviceimpl.FeeModelServiceImpl;
import com.util.DateUtil;

@WebServlet("/ajax_update_account")
public class ajax_update_account extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String[] student_fee_amount_id = request.getParameterValues("student_id[]");
		String[] amount = request.getParameterValues("amount[]");
		String[] semester_number = request.getParameterValues("section_number[]");
		String[] paid_amount=request.getParameterValues("amount_paid[]");
	System.out.println("student_fee_amount_id="+student_fee_amount_id[0]);
		int isSucess =0;
		for (int i = 0; i < student_fee_amount_id.length; i++) {
			System.out.println("info======"+student_fee_amount_id[i]+"   "+amount[i]+"    "+semester_number[i]+"     "+paid_amount[i]);
			int fee_id=0;
			FeeModelServiceInterface inter= new FeeModelServiceImpl();
			List<FeeModel> mo=inter.getAllRecord(Integer.parseInt(student_fee_amount_id[i]));
			for (FeeModel feeModel : mo) {
				fee_id=feeModel.getFee_id();
			}
			System.out.println("fee_id===="+fee_id);
			FeeModel model= new FeeModel();
			FeeUpdateModel updateModel= new FeeUpdateModel();
			FeeUpdateModel update=new FeeUpdateModel();
			model.setStudent_fee_amount_id(Integer.parseInt(student_fee_amount_id[i]));
			model.setDue_amount(Integer.parseInt(amount[i]));
			model.setSemester_no(Integer.parseInt(semester_number[i]));
			model.setFee_id(fee_id);
			updateModel.setFee_id(fee_id);
			updateModel.setAmount_paid(Integer.parseInt(paid_amount[i]));
			updateModel.setBill_no("100NF");
			String d="2017-08-15";
			updateModel.setPaid_date(DateUtil.convertToDate(d));
			isSucess=new FeeModelServiceImpl().update(model, updateModel);
		}
		if (isSucess == 1) {
			out.println("Successfull");
		}else{
			out.println("not sucessful");
		}
	
	}

}
