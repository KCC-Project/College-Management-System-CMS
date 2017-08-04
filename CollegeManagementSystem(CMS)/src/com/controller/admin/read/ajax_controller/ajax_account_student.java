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
import com.model.SemesterModel;
import com.model.StudentModel;
import com.model.StudentSemesterModel;
import com.service.SemesterServiceInterface;
import com.service.StudentSemesterModelServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
import com.util.JsonUtil;



@WebServlet("/ajax_account_student")
public class ajax_account_student extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		List tempList = new ArrayList();
		System.out.println("programId=" + programId + " batchNo=" + batchNo + " semesterNo=" + semesterNo);
		Object[] obj = new Object[15];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;
		SemesterServiceInterface inter = new SemesterServiceImpl();
		List<SemesterModel> getSemester_id = inter.searchByFields(obj);
		System.out.println("semester size=="+getSemester_id.size());
		for (SemesterModel semesterModel : getSemester_id) {
			Object[] obj1 = new Object[15];
			obj1[1] = semesterModel.getSemester_id();
			StudentSemesterModelServiceInterface st= new StudentSemesterModelServiceImpl();
			List<StudentSemesterModel> studentSemesterModel=st.searchByFields(obj1);
			System.out.println("studentSemesterModel size=="+studentSemesterModel.size());
			for (StudentSemesterModel studentSemesterModel2 : studentSemesterModel) {
				Object[] obj2 = new Object[15];
				obj2[0] = studentSemesterModel2.getStudent_id();
				StudentModelInterface stModel= new StudentModelImpl();
				List<StudentModel> studentModel=stModel.searchByField(obj2);
				System.out.println("studentModel size=="+studentModel.size());
				for (StudentModel studentModel2 : studentModel) {
					Map<String, Object> map = new HashMap<String, Object>();
					boolean isEmpty = false;
					try {
						isEmpty = studentModel2.getMiddlename().isEmpty();
					} catch (Exception e) {
						isEmpty=true;
					}
					if (isEmpty==true) {
						map.put("StudentName", studentModel2.getFirstname()  + " "
								+ studentModel2.getLastname());
					}else {
						map.put("StudentName", studentModel2.getFirstname() + " " + studentModel2.getMiddlename() + " "
								+ studentModel2.getLastname());
					}
					tempList.add(map);
				}
			}
			
		}
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		String jsonString = JsonUtil.convertJavaToJson(tempList);
		System.out.println("TempList=" + jsonString);
		response.getWriter().write(jsonString);
	}

}
