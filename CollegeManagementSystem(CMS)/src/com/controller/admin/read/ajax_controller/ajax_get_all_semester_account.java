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

import com.model.FeeModel;
import com.model.Student_Fee_AmountModel;
import com.service.FeeModelServiceInterface;
import com.service.StudentFeeAmountModelService;
import com.serviceimpl.FeeModelServiceImpl;
import com.serviceimpl.StudentFeeAmountModelServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_get_all_semester_account")
public class ajax_get_all_semester_account extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		List list = new ArrayList();
		
		StudentFeeAmountModelService studentSer= new StudentFeeAmountModelServiceImpl();
		List<Student_Fee_AmountModel> modell=studentSer.getAllRecord(student_id);
		System.out.println("student fee amount model size=="+modell.size());
		for (Student_Fee_AmountModel student_Fee_AmountModel : modell) {
			FeeModelServiceInterface inter = new FeeModelServiceImpl();
			List<FeeModel> model = inter.getAllRecord(student_Fee_AmountModel.getStudent_Fee_Amount_id());
			System.out.println("FeeModel size=="+model.size());
			for (FeeModel feeModel : model) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fee_id", feeModel.getFee_id());
				map.put("Semester_no", feeModel.getSemester_no());
				list.add(map);
			}
		}
		PrintWriter out = response.getWriter();
		String result = JsonUtil.convertJavaToJson(list);
		System.out.println("mausam=="+result);
		response.getWriter().write(result);

	}

}
