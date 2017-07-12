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
import com.model.StudentSemesterModel;
import com.model.SubjectModel;
import com.model.YearModel;
import com.service.ExamInfoModelServiceInterface;
import com.service.SemesterServiceInterface;
import com.service.StudentExamResultModelServiceInterface;
import com.service.StudentSemesterModelServiceInterface;
import com.service.StudentServiceInterface;
import com.service.YearServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ExamModelServiceImpl;
import com.serviceimpl.FacultyServiceImpl;
import com.serviceimpl.ProgramServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.serviceimpl.SubjectModelServiceImpl;
import com.serviceimpl.YearServiceImpl;
import com.util.DateUtil;
import com.util.JsonUtil;

import javafx.collections.transformation.SortedList;

@WebServlet("/ajax_result_load_by_Batch")
public class ajax_result_load_by_Batch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		int  examTypeId = Integer.parseInt(request.getParameter("examTypeId"));
		
		//System.out.println("examTypeId="+examTypeId);
		// System.out.println("From Batch="+" programId="+programId+"
		// batchNo="+batchNo+ " semesterno="+semesterNo+ " faculty="+facultyId);

		List tempList = new ArrayList();

		// For getting semester id
		SemesterServiceInterface semInterface = new SemesterServiceImpl();
		Object[] obj = new Object[10];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;
		List<SemesterModel> model = semInterface.searchByFields(obj);
		System.out.println("size of semester="+model.size());
		for (SemesterModel semesterModel : model) {

			//////////////////////////////
			Object[] obj1 = new Object[10];
			obj1[1] = semesterModel.getSemester_id();
			StudentSemesterModelServiceInterface inter = new StudentSemesterModelServiceImpl();
			List<StudentSemesterModel> modelSemStudent = inter.searchByFields(obj1);
			System.out.println("size of student_semester="+modelSemStudent.size());
			for (StudentSemesterModel studentSemesterModel : modelSemStudent) {
				Object[] obj11 = new Object[10];
				obj11[0] = studentSemesterModel.getStudent_id();
				StudentServiceInterface studentInter = new StudentServiceImpl();
				List<StudentModel> stModel = studentInter.searchByField(obj11);
				for (StudentModel studentModel : stModel) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("StudentName", studentModel.getFirstname()+" "+studentModel.getMiddlename()+" "+studentModel.getLastname());
					tempList.add(map);
					
					
					ExamInfoModelServiceInterface examInfoModel= new ExamInfoModelServiceImpl();
					Object[] obj111 = new Object[10];
					obj111[2] = examTypeId;
					List<ExamInfoModel>examInfo= examInfoModel.searchByField(obj111);
					for (ExamInfoModel examInfoModel2 : examInfo) {
						Object[] obj1111 = new Object[10];
						obj1111[0] = studentModel.getStudentID();
						obj1111[1] = examInfoModel2.getExamId();
						StudentExamResultModelServiceInterface result= new StudentExamResultModelServiceImpl();
						//List<StudentExamResultModel> resultModel= result.
					}
				}
				
			}
		}
		String jsonString=JsonUtil.convertJavaToJson(tempList);
		System.out.println("TempList="+jsonString);
	}

}