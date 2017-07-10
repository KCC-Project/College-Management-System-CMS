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

import com.model.SemesterModel;
import com.model.StudentModel;
import com.model.StudentSemesterModel;
import com.service.SemesterServiceInterface;
import com.service.StudentSemesterModelServiceInterface;
import com.service.StudentServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_diplayStudent_forNewResult")
public class ajax_diplayStudent_forNewResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int programId=Integer.parseInt(request.getParameter("programId"));
		int batchNo=Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo=Integer.parseInt(request.getParameter("semesterNo"));
		Object[] obj = new Object[10];
		obj[1]=semesterNo;
		obj[2]=programId;
		obj[3]=batchNo;
		
		List<Integer> semesterId=new ArrayList<Integer>();
		List<Integer> studentID= new ArrayList<Integer>();
		
		SemesterServiceInterface inter= new SemesterServiceImpl();
		List<SemesterModel> getSemester_id= inter.searchByFields(obj);
		
		//for getting semesterId and adding id to list
		for (SemesterModel semID1 : getSemester_id) {
			semesterId.add(semID1.getSemester_id());
		}
		
		
		//for getting student id from semester student table and adding id to list
		for (Integer semesterId1 : semesterId) {
			Object[] obj1 = new Object[10];
			obj1[1]=semesterId1;
			StudentSemesterModelServiceInterface inter1= new StudentSemesterModelServiceImpl();
			List<StudentSemesterModel> model=inter1.searchByFields(obj1);
			for (StudentSemesterModel studentSemesterModel : model) {
				studentID.add(studentSemesterModel.getStudent_id());
			}
		}
		
		System.out.println("completed");
		List studentName= new ArrayList();
		for (Integer studentID1 : studentID) {
			Object[] obj1 = new Object[10];
			obj1[0]=studentID1;
			
			StudentServiceInterface inter1= new StudentServiceImpl();
			List<StudentModel> studentList= inter1.searchByField(obj1);
			
			for (StudentModel studentModel : studentList) {

				Map<String , Object> map= new HashMap<String,Object>();
				map.put("Name", studentModel.getFirstname()+" "+studentModel.getMiddlename()+" "+studentModel.getLastname());
				map.put("totalNumber", 100);
				studentName.add(map);
				
			}
		}
		String jsonSearch=JsonUtil.convertJavaToJson(studentName);
		System.out.println(semesterId.toString());
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		System.out.println(jsonSearch);
		response.getWriter().write(jsonSearch);
	}

}
