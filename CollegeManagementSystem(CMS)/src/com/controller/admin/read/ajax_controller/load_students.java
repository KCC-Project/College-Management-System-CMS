package com.controller.admin.read.ajax_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ProgramModel;
import com.model.SemesterModel;
import com.model.StudentModel;
import com.model.YearModel;
import com.service.StudentServiceInterface;
import com.serviceimpl.StudentServiceImpl;
import com.util.JsonUtil;
import com.util.Table;

@WebServlet("/load_students")
public class load_students extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public load_students() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentServiceInterface studentService = new StudentServiceImpl();
		String name = request.getParameter("term");
		System.out.println(name);
		
		int spaceCount = 0;
		for (char c : name.trim().toCharArray()) {
			if (c == ' ') {
				spaceCount++;
			}
		}
		
		String firstName = null;
		String middleName = "";
		String lastName = null;
		if (spaceCount == 1) {
			firstName = name.trim().substring(0, name.indexOf(' '));
			lastName = name.trim().substring(name.indexOf(' '), name.length());
			System.out.println("fnam=" + firstName);
			System.out.println("lane=" + lastName);
		} else if (spaceCount == 2) {
			int spaceC = 0;
			int count = 0;
			char[] arr = name.trim().toCharArray();
			System.out.println(arr.length);
			int[] space = new int[2];
			for (int i = 0; i < arr.length; i++) {
				if (arr[i] == ' ') {
					space[count] = i;
					count++;
				}
			}
			firstName = name.substring(0, space[0]);
			middleName = name.substring(space[0], space[1]);
			lastName = name.substring(space[1], name.length());
			System.out.println("f=" + firstName.trim());
			System.out.println("M=" + middleName.trim());
			System.out.println("L=" + lastName.trim());
		}
		
		Object[] obj = new Object[10];
		obj[1] = firstName;
		obj[3] = lastName;
		
		List<StudentModel> mode= studentService.searchByField(obj);
		Map<String, Object> map= new HashMap<String,Object>();
		List tempList = new ArrayList();
		
		System.out.println("here is the total rows count: "+Table.getTotalRows());
		int total = Table.getTotalRows();
		int totalPage = Table.getTotalPage();
		
		for (StudentModel st : mode) {
			Map<String, Object> stMap= new HashMap<String,Object>();
			int student_id = st.getStudentID();
			String firstname = st.getFirstname();
			String middlename = st.getMiddlename();
			String lastname = st.getLastname();
			String identityCard = st.getIdentityCard();
			String full = firstname + " " + middlename + " " +lastname + " " +identityCard;
			
			
			stMap.put("id", full);
			stMap.put("label", full);
			stMap.put("value", student_id);
			tempList.add(stMap);
		}
		String jsonResponse=JsonUtil.convertJavaToJson(tempList);
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		System.out.println("json="+jsonResponse);
		response.getWriter().write(jsonResponse);
	}

}
