package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamInfoModel;
import com.model.ProgramModel;
import com.model.SemesterModel;
import com.model.StudentSemesterModel;
import com.service.ExamInfoModelServiceInterface;
import com.service.ProgramServiceInterface;
import com.service.SemesterServiceInterface;
import com.service.StudentSemesterModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ProgramServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.util.JsonUtil;

@WebServlet("/ajax_loadExamInfoDetails")
public class ajax_loadExamInfoDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	ExamInfoModelServiceInterface examInfo=new ExamInfoModelServiceImpl();
	Object[] obj = new Object[15];
	obj[9]=Integer.parseInt(request.getParameter("status"));
	java.util.List<ExamInfoModel> list=examInfo.searchByField(obj);
	
	java.util.List listRandom= new ArrayList();
	for (ExamInfoModel examInfoModel : list) {
		
		Object[] obj1 = new Object[15];
		obj1[0]=examInfoModel.getSemester_id();

		SemesterServiceInterface inter= new SemesterServiceImpl();
		java.util.List<SemesterModel> model= inter.searchByFields(obj1);
		for (SemesterModel semesterModel : model) {
			Object[] obj2 = new Object[15];
			obj2[1]=semesterModel.getSemester_id();
			StudentSemesterModelServiceInterface studentInter= new StudentSemesterModelServiceImpl();
			java.util.List<StudentSemesterModel> semModel=studentInter.searchByFields(obj2);
			
			ProgramServiceInterface program= new ProgramServiceImpl();
			ProgramModel mo=program.getRecordById(semesterModel.getProgram_id());
		
			Map<String, Object> map= new HashMap<String,Object>();
			map.put("subjectName", examInfoModel.getSubjectName());
			map.put("examType", examInfoModel.getExamTypeName());
			map.put("startDate", examInfoModel.getExamStartDate());
			map.put("endDate", examInfoModel.getExamEndDate());
			map.put("startTime", examInfoModel.getExamStartTime());
			map.put("endTime", examInfoModel.getExamEndTime());
			map.put("fullMarks", examInfoModel.getFullmarks());
			map.put("passMarks", examInfoModel.getPassmarks());
			map.put("status", examInfoModel.getStatus());
			map.put("semesterNo", semesterModel.getSemester_no());
			map.put("examId", examInfoModel.getExamId());
			map.put("TotalStudent", semModel.size());
			map.put("ProgramName", mo.getProgram_name());
			listRandom.add(map);
		}
	}
	response.setContentType("text/xml");
	response.setHeader("Cache-Control", "no-cache");
	System.out.println("json="+JsonUtil.convertJavaToJson(listRandom));
	response.getWriter().write(JsonUtil.convertJavaToJson(listRandom));
	
	}

}
