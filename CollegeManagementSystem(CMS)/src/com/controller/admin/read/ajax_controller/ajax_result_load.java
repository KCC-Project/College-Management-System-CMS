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
import com.service.StudentServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ExamModelServiceImpl;
import com.serviceimpl.FacultyServiceImpl;
import com.serviceimpl.ProgramServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
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
		String facultyId = request.getParameter("facultyId");
		String programId = request.getParameter("programId");
		String batchIdName = request.getParameter("batchIdName");
		String semesterIdName = request.getParameter("semesterIdName");
		String nameIdEmailMarks = request.getParameter("nameIdEmailMarks");
		System.out.println("program is is =" + programId);
		System.out.println("faculty is is =" + facultyId);
		System.out.println("semested id =" +semesterIdName );
		
		// list for json converting and adding
		List JsonObject = new ArrayList<>();

		// list for adding dublicate data if present in same class
		List<Integer> idList = new ArrayList<Integer>();

		// calling studentservice and getting student id name etc
		StudentServiceInterface intterface = new StudentServiceImpl();
		List<StudentModel> stModel = intterface.searchByField(nameIdEmailMarks);
		for (StudentModel studentModel : stModel) {

			// getting datainfo from studentsemestertable with student id
			int semesterId = new StudentSemesterModelServiceImpl().getSelectedData(studentModel.getStudentID())
					.getSemesterId();
			SemesterServiceInterface semester = new SemesterServiceImpl();

			System.out.println("semester id="+semesterId);
			Object[] obj = new Object[7];
			obj[0] = semesterId;
			obj[1]=Integer.parseInt(semesterIdName);
			obj[2]=Integer.parseInt(programId);
			
			int semesterNo = 0;
			
			int batch=0;
			String programName=null;
			
			String facultyName=null;
			
			List<SemesterModel> semModel=semester.searchByFields(obj);
			for(SemesterModel sem:semModel){
			 semesterNo = new SemesterServiceImpl().loadById(sem.getSemester_id()).getSemester_no();
			 batch = new SemesterServiceImpl().loadById(sem.getSemester_id()).getBatch_year();
			 programName = new ProgramServiceImpl().getRecordById(Integer.parseInt(programId)).getProgram_name();
			 facultyName = new FacultyServiceImpl().getRecordById(Integer.parseInt(facultyId)).getFaculty_name();
			System.out.println("pName=="+programName+"  fNmae=="+facultyName);
			}
			// calling result service
			StudentExamResultModelServiceInterface result = new StudentExamResultModelServiceImpl();

			// getting result of particular id of student
			StudentExamResultModel list = result.readId(studentModel.getStudentID());

			// mapping for json
			Map<String, Object> studentDataMap = new HashMap<String, Object>();

			int resultId = list.getExamId();
			System.out.println("id=" + resultId);
			int studentId = list.getStudentId();
			StudentModel studentName = new StudentServiceImpl().readId(studentId);
			String fname = studentName.getFirstname();
			String mName = studentName.getMiddlename();
			String lName = studentName.getLastname();

			// retriving infomatin of exam by partcular id
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

			studentDataMap.put("resultId", resultId);
			studentDataMap.put("StudentName", fname + " " + mName + " " + lName);
			studentDataMap.put("image", studentName.getImage());
			studentDataMap.put("phone", studentName.getMobileNo());
			studentDataMap.put("status", studentName.getStatus());
			studentDataMap.put("examMarksByStudent", list.getExamMarks());
			studentDataMap.put("passFailStatus", list.getPassFailStatus());
			studentDataMap.put("subjectName", subjectName);
			studentDataMap.put("subjectCredit", subjectCredit);
			studentDataMap.put("examTypeName", examTypeName);
			studentDataMap.put("examDate", date);
			studentDataMap.put("fullMarks", fullMarks);
			studentDataMap.put("passMarks", passMarks);

			studentDataMap.put("semesterId", semesterId);
			studentDataMap.put("semesterNo", semesterNo);
			
			studentDataMap.put("batch", batch);
			studentDataMap.put("programName", programName);
			
			studentDataMap.put("facultyName", facultyName);

			// adding in list
			JsonObject.add(studentDataMap);
		}

		// System.out.println(JsonObject);

		// converting to json object and send to javascript atonce
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(JsonUtil.convertJavaToJson(JsonObject));
		response.getWriter().write(JsonUtil.convertJavaToJson(JsonObject));

	}

}
