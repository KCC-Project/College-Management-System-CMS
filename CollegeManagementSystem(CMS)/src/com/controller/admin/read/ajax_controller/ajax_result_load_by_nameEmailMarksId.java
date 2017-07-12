package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
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

@WebServlet("/ajax_result_load_by_nameEmailMarksId")
public class ajax_result_load_by_nameEmailMarksId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int programId = Integer.parseInt(request.getParameter("programId"));
		int batchNo = Integer.parseInt(request.getParameter("batchNo"));
		int semesterNo = Integer.parseInt(request.getParameter("semesterNo"));
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		int examTypeId = Integer.parseInt(request.getParameter("examTypeId"));
		String nameIdEmailMarks = request.getParameter("enterField");
		System.out.println("sub=" + nameIdEmailMarks.substring(0, 2));
		
		int spaceCount = 0;
		for (char c : nameIdEmailMarks.toCharArray()) {
		    if (c == ' ') {
		         spaceCount++;
		    }
		    
		}
		
		String firstName=null;
		String middleName="";
		String lastName=null;
		if (spaceCount==1) {
			firstName=nameIdEmailMarks.substring(0, nameIdEmailMarks.indexOf(' '));
			lastName=nameIdEmailMarks.substring(nameIdEmailMarks.indexOf(' '), nameIdEmailMarks.length());
			System.out.println("fnam="+firstName);
			System.out.println("lane="+lastName);
		} else if(spaceCount==2){
			firstName=nameIdEmailMarks.substring(0, nameIdEmailMarks.indexOf(' '));
			middleName=nameIdEmailMarks.substring(nameIdEmailMarks.indexOf(' '), nameIdEmailMarks.length());
			System.out.println("f="+firstName);
			System.out.println("M="+middleName);
		}
		System.out.println("space count="+spaceCount);
		
		List tempList = new ArrayList();

		// For getting semester id
		SemesterServiceInterface semInterface = new SemesterServiceImpl();
		Object[] obj = new Object[10];
		obj[1] = semesterNo;
		obj[2] = programId;
		obj[3] = batchNo;
		List<SemesterModel> model = semInterface.searchByFields(obj);
		System.out.println("size of semester=" + model.size());
		for (SemesterModel semesterModel : model) {
			Object[] obj1 = new Object[10];
			obj1[1] = semesterModel.getSemester_id();
			StudentSemesterModelServiceInterface inter = new StudentSemesterModelServiceImpl();
			List<StudentSemesterModel> modelSemStudent = inter.searchByFields(obj1);
			System.out.println("size of student_semester=" + modelSemStudent.size());
			boolean isValidEmail = isValidEmailAddress(nameIdEmailMarks);
			for (StudentSemesterModel studentSemesterModel : modelSemStudent) {
				Object[] obj11 = new Object[10];
				obj11[0] = studentSemesterModel.getStudent_id();
				if (isValidEmail == true) {
					obj11[6] = nameIdEmailMarks;
				}else if(nameIdEmailMarks.substring(0, 2).equalsIgnoreCase("ID")){
					obj11[11] = nameIdEmailMarks;
				}else{
					obj11[3] = nameIdEmailMarks;
				}
				StudentServiceInterface studentInter = new StudentServiceImpl();
				List<StudentModel> stModel = studentInter.searchByField(obj11);
				for (StudentModel studentModel : stModel) {

				}

			}
		}

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
