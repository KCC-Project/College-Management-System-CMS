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

import com.model.FeeUpdateModel;
import com.model.Student_Fee_AmountModel;
import com.service.FeeUpdateServiceInterface;
import com.service.StudentFeeAmountModelService;
import com.serviceimpl.FeeUpdateServiceImpl;
import com.serviceimpl.StudentFeeAmountModelServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_getall_accountUpdate")
public class ajax_getall_accountUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fee_id = Integer.parseInt(request.getParameter("fee_id"));
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		List list= new ArrayList();
		StudentFeeAmountModelService feeInter= new StudentFeeAmountModelServiceImpl();
		List<Student_Fee_AmountModel> feeModel=feeInter.getAllRecord(student_id);
		for (Student_Fee_AmountModel student_Fee_AmountModel : feeModel) {
			FeeUpdateServiceInterface inter=new FeeUpdateServiceImpl();
			Object[] obj = new Object[10];
			obj[1] = fee_id;
			List<FeeUpdateModel> model=inter.searchByField(obj);
			System.out.println("FeeUpdate size=="+model.size());
			
			
			for (FeeUpdateModel feeUpdateModel : model) {
				Map<String, Object> map=new HashMap<String,Object>();
				map.put("amount_paid", feeUpdateModel.getAmount_paid());
				map.put("billNo", feeUpdateModel.getBill_no());
				map.put("paidDate", feeUpdateModel.getPaid_date());
				map.put("feeId", feeUpdateModel.getFee_id());
				map.put("totalFeeAmount", student_Fee_AmountModel.getFee_amount());
				list.add(map);
			}
		}
		
		PrintWriter out = response.getWriter();
		String json=JsonUtil.convertJavaToJson(list);
		System.out.println("Json==="+json);
		response.getWriter().write(json);
	}

}
