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

import com.model.ExamInfoModel;
import com.model.StudentExamResultModel;
import com.model.StudentModel;
import com.service.ExamInfoModelServiceInterface;
import com.service.StudentExamResultModelServiceInterface;
import com.service.StudentServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ProgramServiceImpl;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.util.JsonUtil;



@WebServlet("/ajax_result_load_by_subject")
public class ajax_result_load_by_subject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		int semesterID = Integer.parseInt(request.getParameter("semesterID"));
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		int examTypeId = Integer.parseInt(request.getParameter("examTypeId"));
		int subjectID = Integer.parseInt(request.getParameter("subjectID"));

		List tempList = new ArrayList();

		ExamInfoModelServiceInterface examinfo= new ExamInfoModelServiceImpl();
		Object[] obj = new Object[15];
		obj[1] = subjectID;
		obj[2] = examTypeId;
		obj[8] = semesterID;
		
		
		List<ExamInfoModel> subSem=examinfo.searchByField(obj);
		System.out.println("examInfo size="+subSem.size());
		for (ExamInfoModel examInfoModel : subSem) {
			Object[] obj1 = new Object[15];
			obj1[1] = examInfoModel.getExamId();
			StudentExamResultModelServiceInterface result= new StudentExamResultModelServiceImpl();
			List<StudentExamResultModel> model= result.searchByField(obj1);
			System.out.println("result size="+model.size());
			for (StudentExamResultModel studentExamResultModel : model) {
				Object[] obj2 = new Object[15];
				obj2[0] = studentExamResultModel.getStudentId();
				StudentServiceInterface studentSer= new StudentServiceImpl();
				List<StudentModel> stModel= studentSer.searchByField(obj2);
				System.out.println("size of student="+stModel.size());
				for (StudentModel studentModel : stModel) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("ProgramName",
							new ProgramServiceImpl().getRecordById(programId).getProgram_name());
					map.put("subjectName", examInfoModel.getSubjectName());
					map.put("ExamType", examInfoModel.getExamTypeName());
					map.put("FullMarks", examInfoModel.getFullmarks());
					map.put("passMarks", examInfoModel.getPassmarks());
					map.put("ScoredMarks", studentExamResultModel.getExamMarks());
					map.put("PassFailStatus", studentExamResultModel.getPassFailStatus());
					map.put("StudentName", studentModel.getFirstname() + " " + studentModel.getMiddlename()
							+ " " + studentModel.getLastname());
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
