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
import com.model.FacultyModel;
import com.model.SemesterModel;
import com.service.ExamInfoModelServiceInterface;
import com.service.FacultyServiceInterface;
import com.service.SemesterServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.FacultyServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.sun.xml.internal.ws.encoding.policy.FastInfosetFeatureConfigurator;
import com.util.JsonUtil;

@WebServlet("/ajax_loadRequiredInfoFormJson_mangeExamInfo")
public class ajax_loadRequiredInfoFormJson_mangeExamInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("value");
		System.out.println("id from json=" + id);
		List list = new ArrayList();
		if (id.equalsIgnoreCase("")) {

		} else {
			int iD = Integer.parseInt(id);
			Object[] obj = new Object[15];
			obj[0] = id;
			ExamInfoModelServiceInterface inter = new ExamInfoModelServiceImpl();
			List<ExamInfoModel> model = inter.searchByField(obj);
			for (ExamInfoModel examInfoModel : model) {

				SemesterServiceInterface interr = new SemesterServiceImpl();
				Object[] obj12 = new Object[15];
				obj12[0] = examInfoModel.getSemester_id();
				List<SemesterModel> semModel = interr.searchByFields(obj12);
				for (SemesterModel semesterModel : semModel) {

					FacultyServiceInterface facultyInter = new FacultyServiceImpl();
					FacultyModel facultyModel = facultyInter.getRecordById(semesterModel.getProgram_id());
					
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("faculty_id", facultyModel.getFaculty_id());
						map.put("faculty_name", facultyModel.getFaculty_name());
						map.put("program_id", semesterModel.getProgram_id());
						map.put("batchYear_id", semesterModel.getBatch_year());
						map.put("semester_no", semesterModel.getSemester_no());
						map.put("Semester_id", semesterModel.getSemester_id());
						map.put("examInfo", model);
						list.add(map);
					
				}
			}
			String examInfoJson = JsonUtil.convertJavaToJson(list);
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			System.out.println("mausamJson=" + examInfoJson);
			response.getWriter().write(examInfoJson);
		}
	}

}
