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

import com.daoimpl.ExamInfoModelImpl;
import com.model.ExamInfoModel;
import com.model.SemesterModel;
import com.model.SemesterSubjectModel;
import com.model.StudentModel;
import com.model.StudentSemesterModel;
import com.service.ExamInfoModelServiceInterface;
import com.service.SemesterServiceInterface;
import com.service.StudentSemesterModelServiceInterface;
import com.service.StudentServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.SemesterSubjectServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_diplayStudent_forNewResult")
public class ajax_diplayStudent_forNewResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		
		int examId=Integer.parseInt(request.getParameter("examId"));
		Object[] obj = new Object[15];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;

		List<Integer> semesterId = new ArrayList<Integer>();
		List<Integer> studentID = new ArrayList<Integer>();

		SemesterServiceInterface inter = new SemesterServiceImpl();
		List<SemesterModel> getSemester_id = inter.searchByFields(obj);

		// for getting semesterId and adding id to list
		for (SemesterModel semID1 : getSemester_id) {
			semesterId.add(semID1.getSemester_id());
		}

		// for getting student id from semester student table and adding id to
		// list
		for (Integer semesterId1 : semesterId) {
			Object[] obj1 = new Object[15];
			obj1[1] = semesterId1;
			StudentSemesterModelServiceInterface inter1 = new StudentSemesterModelServiceImpl();
			List<StudentSemesterModel> model = inter1.searchByFields(obj1);
			for (StudentSemesterModel studentSemesterModel : model) {
				studentID.add(studentSemesterModel.getStudent_id());
			}
		}

		List ExamInfoDetail = new ArrayList();
		List studentName= new ArrayList(); 
		Map<String, Object> finalDataJson=new HashMap<String,Object>();
		for (Integer studentID1 : studentID) {
			Object[] obj1 = new Object[15];
			obj1[0] = studentID1;

			StudentServiceInterface inter1 = new StudentServiceImpl();
			List<StudentModel> studentList = inter1.searchByField(obj1);

			for (StudentModel studentModel : studentList) {

				Map<String, Object> map = new HashMap<String, Object>();
				boolean isEmpty = false;
				try {
					isEmpty = studentModel.getMiddlename().isEmpty();
				} catch (Exception e) {
					isEmpty=true;
				}
				if (isEmpty==true) {
					map.put("Name", studentModel.getFirstname()  + " "
							+ studentModel.getLastname());
				}else {
					map.put("Name", studentModel.getFirstname() + " " + studentModel.getMiddlename() + " "
							+ studentModel.getLastname());
				}
				
				map.put("studentId", studentModel.getStudentID());
				studentName.add(map);

			}
		}
		
		ExamInfoModelServiceInterface interExamInfo=new ExamInfoModelServiceImpl();
		Object[] obj5 = new Object[15];
		obj5[0] = examId;
		List<ExamInfoModel> examinfoModel= interExamInfo.searchByField(obj5);
		for (ExamInfoModel examInfoModel2 : examinfoModel) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ExamtypeName", examInfoModel2.getExamTypeName());
			map.put("FullMarks", examInfoModel2.getFullmarks());
			map.put("PassMarks", examInfoModel2.getPassmarks());
			map.put("ExamId", examInfoModel2.getExamId());
			map.put("SubjectName", examInfoModel2.getSubjectName());
			
			ExamInfoDetail.add(map);
		}
		finalDataJson.put("StudentInfo", studentName);
		finalDataJson.put("ExamInfo", ExamInfoDetail);
		
		String jsonSearch = JsonUtil.convertJavaToJson(finalDataJson);
		/*response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");*/
		System.out.println(jsonSearch);
		response.getWriter().write(jsonSearch);
	}

}
