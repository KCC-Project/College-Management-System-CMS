package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.SemesterModel;
import com.model.SemesterSubjectModel;
import com.model.SubjectModel;
import com.service.SemesterServiceInterface;
import com.service.SemesterSubjectServiceInterface;
import com.service.SubjectModelServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.SemesterSubjectServiceImpl;
import com.serviceimpl.SubjectModelServiceImpl;



@WebServlet("/ajax_load_subject")
public class ajax_load_subject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		
		
		
		
		Object[] obj = new Object[10];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;

		List<Integer> semesterId = new ArrayList<Integer>();
		List<Integer> subjectId = new ArrayList<Integer>();

		SemesterServiceInterface inter = new SemesterServiceImpl();
		List<SemesterModel> getSemester_id = inter.searchByFields(obj);

		// for getting semesterId and adding id to list
		for (SemesterModel semID1 : getSemester_id) {
			semesterId.add(semID1.getSemester_id());
		}

		
		for (Integer semesterId1 : semesterId) {
			Object[] obj1 = new Object[10];
			obj1[0] = semesterId1;
			SemesterSubjectServiceInterface inter1= new SemesterSubjectServiceImpl();
			List<SemesterSubjectModel> model = inter1.searchByField(obj1);
			for (SemesterSubjectModel SemesterSubjectModel : model) {
				subjectId.add(SemesterSubjectModel.getSubject_id());
			}
		}
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write("<option disabled selected>Select Subject </option>");
		
		for (Integer subjectId1 : subjectId) {
			Object[] obj1 = new Object[10];
			obj1[0] = subjectId1;
			SubjectModelServiceInterface model= new SubjectModelServiceImpl();
			List<SubjectModel> submodel= model.searchByFields(obj1);
			for (SubjectModel subjectModel : submodel) {
				out.write("<option value="+subjectModel.getSubject_id()+">" + subjectModel.getSubjectName() + "</option>");
			}
		}
		out.flush();
		
		
		
	}

}
