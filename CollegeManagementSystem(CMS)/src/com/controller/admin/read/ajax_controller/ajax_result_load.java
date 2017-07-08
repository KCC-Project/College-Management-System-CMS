package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamInfoModel;
import com.model.ExamModel;
import com.model.SemesterModel;
import com.model.StudentExamResultModel;
import com.model.StudentModel;
import com.model.SubjectModel;
import com.service.SemesterServiceInterface;
import com.service.StudentExamResultModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ExamModelServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.serviceimpl.SubjectModelServiceImpl;
import com.util.DateUtil;
import com.util.JsonUtil;

import javafx.collections.transformation.SortedList;

@WebServlet("/ajax_result_load")
public class ajax_result_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List   JsonObject= new ArrayList<>();
		
		StudentExamResultModelServiceInterface result = new StudentExamResultModelServiceImpl();
		List<StudentExamResultModel> list = result.getAllRecord();
		
		for (StudentExamResultModel studentExamResultModel : list) {
			Map<String, Object> studentDataMap = new HashMap<String, Object>();

			int resultId = studentExamResultModel.getExamId();
			System.out.println("id="+resultId);
			int studentId = studentExamResultModel.getStudentId();
			StudentModel studentName = new StudentServiceImpl().readId(studentId);
			String fname = studentName.getFirstname();
			String mName = studentName.getMiddlename();
			String lName = studentName.getLastname();

			ExamInfoModel examInfo = new ExamInfoModelServiceImpl().getSelectedInfo(resultId);

			String date = DateUtil.convertToString(examInfo.getExamStartDate());
			int fullMarks = examInfo.getFullmarks();
			int passMarks = examInfo.getPassmarks();

			int subjectId = examInfo.getSubjectId();
			int examTypeNameId = examInfo.getExamTypeId();

			ExamModel examModel = new ExamModelServiceImpl().getSelectedExam(examTypeNameId);
			String examTypeName = examModel.getExamTypeName();

			SubjectModel subjectModel = new SubjectModelServiceImpl().getSelectedSubject(subjectId);
			String subjectName = subjectModel.getSubjectName();
			int subjectCredit = subjectModel.getSubjectCredit();
			
			
			studentDataMap.put("resultId",resultId);
			studentDataMap.put("StudentName", fname + " " + mName + " " + lName);
			studentDataMap.put("image", studentName.getImage());
			studentDataMap.put("phone", studentName.getMobileNo());
			studentDataMap.put("status", studentName.getStatus());
			studentDataMap.put("examMarksByStudent", studentExamResultModel.getExamMarks());
			studentDataMap.put("passFailStatus", studentExamResultModel.getPassFailStatus());
			studentDataMap.put("subjectName", subjectName);
			studentDataMap.put("subjectCredit", subjectCredit);
			studentDataMap.put("examTypeName", examTypeName);
			studentDataMap.put("examDate", date);
			studentDataMap.put("fullMarks", fullMarks);
			studentDataMap.put("passMarks", passMarks);
			
			JsonObject.add(studentDataMap);
			
		}
		System.out.println(JsonObject);
		response.getWriter().write(JsonUtil.convertJavaToJson(JsonObject));

	}

}
