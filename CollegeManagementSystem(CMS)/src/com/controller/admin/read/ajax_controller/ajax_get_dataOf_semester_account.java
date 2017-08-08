package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentModelInterface;
import com.daoimpl.StudentModelImpl;
import com.model.FeeModel;
import com.model.StudentModel;
import com.service.FeeModelServiceInterface;
import com.serviceimpl.FeeModelServiceImpl;
import com.util.JsonUtil;


@WebServlet("/ajax_get_dataOf_semester_account")
public class ajax_get_dataOf_semester_account extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fee_id=Integer.parseInt(request.getParameter("fee_id"));
		int student_id=Integer.parseInt(request.getParameter("student_id"));
		System.out.println("student_id="+student_id+" fee_id="+fee_id);
		
		FeeModelServiceInterface inter= new FeeModelServiceImpl();
		Object[] obj = new Object[10];
		obj[0] = fee_id;
		List<FeeModel>model=inter.searchByField(obj);
		//System.out.println("feeModel size=="+model.size());
		List list= new ArrayList();
		for (FeeModel feeModel : model) {
			StudentModelInterface intt= new StudentModelImpl();
			Object[] obj1 = new Object[15];
			obj1[0] = student_id;
			List<StudentModel> mod=intt.searchByField(obj1);
			for (StudentModel studentModel : mod) {
				Map<String, Object> map=new HashMap<String, Object>();
				boolean isEmpty = false;
				try {
					isEmpty = studentModel.getMiddlename().isEmpty();
				} catch (Exception e) {
					isEmpty=true;
				}
				if (isEmpty==true) {
					map.put("StudentName", studentModel.getFirstname()  + " "
							+ studentModel.getLastname());
				}else {
					map.put("StudentName", studentModel.getFirstname() + " " + studentModel.getMiddlename() + " "
							+ studentModel.getLastname());
				}
				map.put("amount", feeModel.getDue_amount());
				map.put("semester_no", feeModel.getSemester_no());
				map.put("studentFeeAmountId", feeModel.getStudent_fee_amount_id());
				
				list.add(map);
			}
		}
		
		String jsonString = JsonUtil.convertJavaToJson(list);
		System.out.println("info as semester=" + jsonString);
		response.getWriter().write(jsonString);
	}

}
