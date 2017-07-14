package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamInfoModel;
import com.model.SemesterModel;
import com.model.StudentExamResultModel;
import com.model.StudentModel;
import com.model.StudentSemesterModel;
import com.service.ExamInfoModelServiceInterface;
import com.service.SemesterServiceInterface;
import com.service.StudentExamResultModelServiceInterface;
import com.service.StudentSemesterModelServiceInterface;
import com.service.StudentServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ProgramServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentExamResultModelServiceImpl;
import com.serviceimpl.StudentSemesterModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.util.JsonUtil;

@WebServlet("/ajax_result_load_by_nameEmailMarksId")
public class ajax_result_load_by_nameEmailMarksId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		int semesterID = Integer.parseInt(request.getParameter("semesterID"));
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		int examTypeId = Integer.parseInt(request.getParameter("examTypeId"));
		String nameIdEmailMarks = request.getParameter("enterField");
		//System.out.println("sub=" + nameIdEmailMarks.substring(0, 2));
		String identityCard = nameIdEmailMarks.substring(0, 2);
		//System.out.println("ID===" + identityCard);
		int spaceCount = 0;
		for (char c : nameIdEmailMarks.trim().toCharArray()) {
			if (c == ' ') {
				spaceCount++;
			}
		}

		String firstName = null;
		String middleName = "";
		String lastName = null;
		if (spaceCount == 1) {
			firstName = nameIdEmailMarks.trim().substring(0, nameIdEmailMarks.indexOf(' '));
			lastName = nameIdEmailMarks.trim().substring(nameIdEmailMarks.indexOf(' '), nameIdEmailMarks.length());
			System.out.println("fnam=" + firstName);
			System.out.println("lane=" + lastName);
		} else if (spaceCount == 2) {
			int spaceC = 0;
			int count = 0;
			char[] arr = nameIdEmailMarks.trim().toCharArray();
			System.out.println(arr.length);
			int[] space = new int[2];
			for (int i = 0; i < arr.length; i++) {
				if (arr[i] == ' ') {
					space[count] = i;
					count++;
				}
			}
			firstName = nameIdEmailMarks.substring(0, space[0]);
			middleName = nameIdEmailMarks.substring(space[0], space[1]);
			lastName = nameIdEmailMarks.substring(space[1], nameIdEmailMarks.length());
			System.out.println("f=" + firstName.trim());
			System.out.println("M=" + middleName.trim());
			System.out.println("L=" + lastName.trim());
		}

		List tempList = new ArrayList();

		// For getting semester id
		SemesterServiceInterface semInterface = new SemesterServiceImpl();
		Object[] obj = new Object[15];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;
		List<SemesterModel> model = semInterface.searchByFields(obj);
		System.out.println("size of semester=" + model.size());
		for (SemesterModel semesterModel : model) {
			Object[] obj1 = new Object[15];
			obj1[1] = semesterModel.getSemester_id();
			StudentSemesterModelServiceInterface inter = new StudentSemesterModelServiceImpl();
			List<StudentSemesterModel> modelSemStudent = inter.searchByFields(obj1);
			System.out.println("size of student_semester=" + modelSemStudent.size());
			boolean isValidEmail = isValidEmailAddress(nameIdEmailMarks);
			System.out.println(isValidEmail);
			for (StudentSemesterModel studentSemesterModel : modelSemStudent) {
				Object[] obj11 = new Object[15];
				obj11[0] = studentSemesterModel.getStudent_id();
				if (isValidEmail == true) {
					obj11[4] = nameIdEmailMarks.trim();
					System.out.println("Inside emxail");
				} else if (identityCard.equalsIgnoreCase("ID")) {
					obj11[9] = nameIdEmailMarks.trim();
					System.out.println("By id");
				} else {
					obj11[1] = firstName.trim();
					obj11[2] = middleName.trim();
					obj11[3] = lastName.trim();
					System.out.println("Inside first middle last name");
				}
				//System.out.println("student iD=" + studentSemesterModel.getStudent_id());
				//System.out.println("enter ID=" + obj11[9].toString());
				StudentServiceInterface studentInter = new StudentServiceImpl();
				List<StudentModel> stModel = studentInter.searchByField(obj11);
				System.out.println("student Table size=" + stModel.size());
				System.out.println("student Table json=" + JsonUtil.convertJavaToJson(stModel));
				for (StudentModel studentModel : stModel) {
					ExamInfoModelServiceInterface examInfoModel = new ExamInfoModelServiceImpl();
					Object[] obj111 = new Object[15];
					obj111[2] = examTypeId;
					obj111[8] = semesterID;
					System.out.println("selected student name=" + studentModel.getFirstname());
					List<ExamInfoModel> examInfo = examInfoModel.searchByField(obj111);
					System.out.println("examInfo table size=" + examInfo.size());
					for (ExamInfoModel examInfoModel2 : examInfo) {

						Object[] obj1111 = new Object[15];
						obj1111[0] = studentModel.getStudentID();
						obj1111[1] = examInfoModel2.getExamId();
						StudentExamResultModelServiceInterface result = new StudentExamResultModelServiceImpl();
						List<StudentExamResultModel> resultModel = result.searchByField(obj1111);
						if (resultModel.size() != 0) {
							System.out.println("size of result=" + resultModel.size());
							for (StudentExamResultModel studentExamResultModel : resultModel) {
								Map<String, Object> map = new HashMap<String, Object>();
								map.put("ProgramName",
										new ProgramServiceImpl().getRecordById(programId).getProgram_name());
								map.put("subjectName", examInfoModel2.getSubjectName());
								map.put("ExamType", examInfoModel2.getExamTypeName());
								map.put("FullMarks", examInfoModel2.getFullmarks());
								map.put("passMarks", examInfoModel2.getPassmarks());
								map.put("ScoredMarks", studentExamResultModel.getExamMarks());
								map.put("PassFailStatus", studentExamResultModel.getPassFailStatus());
								map.put("StudentName", studentModel.getFirstname() + " " + studentModel.getMiddlename()
										+ " " + studentModel.getLastname());
								tempList.add(map);
							}
						}
					}
				}

			}
		}
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		String jsonString = JsonUtil.convertJavaToJson(tempList);
		System.out.println("TempList=" + jsonString);
		response.getWriter().write(jsonString);

	}

	public static boolean isValidEmailAddress(String email) {
		boolean result = true;
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException ex) {
			result = false;
		}
		return result;
	}

}
