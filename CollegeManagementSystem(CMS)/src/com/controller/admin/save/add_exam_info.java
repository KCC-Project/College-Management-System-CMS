package com.controller.admin.save;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ExamInfoModel;
import com.service.ExamInfoModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.util.DateUtil;

@WebServlet("/add_exam_info")
public class add_exam_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int subjectIDHidden = Integer.parseInt(request.getParameter("subIdHidden"));//for whole sem
		String examTypeId = request.getParameter("examType_id");
		String examStartdate = request.getParameter("exam_start_date");
		String examenddate = request.getParameter("exam_end_date");
		String examStartTime = request.getParameter("exam_start_time");
		String examEndTime = request.getParameter("exam_end_time");
		String examFullmarks = request.getParameter("exam_fullMarks");
		String examPassmarks = request.getParameter("exam_passMarks");
		String examStatus = request.getParameter("status");
		int semesterNo = Integer.parseInt(request.getParameter("SemesterIdPrimary"));

		if (subjectIDHidden == -100) {
			/*int examId = Integer.parseInt(examTypeId);
			ExamInfoModel model = new ExamInfoModel();
			model.setSubjectId(-100);
			model.setSemester_id(semesterNo);
			model.setExamTypeId(examId);
			model.setExamStartDate(DateUtil.convertToDate(examStartdate));
			model.setExamEndDate(DateUtil.convertToDate(examenddate));
			model.setExamStartTime(examStartTime);
			model.setExamEndTime(examEndTime);
			model.setFullmarks(Integer.parseInt(examFullmarks));
			model.setPassmarks(Integer.parseInt(examPassmarks));
			model.setStatus(Integer.parseInt(examStatus));
			ExamInfoModelServiceInterface intface = new ExamInfoModelServiceImpl();
			boolean status = intface.saveExamInfo(model);
			if (status == true) {
				response.sendRedirect("admin/manageExamInfo.jsp?error=sucessfullEntryAddExamInfo");
			} else {
				response.sendRedirect("admin/manageExamInfo.jsp?error=addExamInfo");

			}*/
		} else {

			if (examTypeId.equalsIgnoreCase("") || examStartdate.equalsIgnoreCase("")
					|| examenddate.equalsIgnoreCase("") || examStartTime.equalsIgnoreCase("")
					|| examEndTime.equalsIgnoreCase("") || examStatus.equalsIgnoreCase("")) {
				response.sendRedirect("admin/manageExamInfo.jsp?error=addExamInfo_empty");

			} else {
				String subject = request.getParameter("subject_id");
				int subId = Integer.parseInt(subject);
				int examId = Integer.parseInt(examTypeId);
				ExamInfoModel model = new ExamInfoModel();
				model.setSubjectId(subId);
				model.setSemester_id(semesterNo);
				model.setExamTypeId(examId);
				model.setExamStartDate(DateUtil.convertToDate(examStartdate));
				model.setExamEndDate(DateUtil.convertToDate(examenddate));
				model.setExamStartTime(examStartTime);
				model.setExamEndTime(examEndTime);
				model.setFullmarks(Integer.parseInt(examFullmarks));
				model.setPassmarks(Integer.parseInt(examPassmarks));
				model.setStatus(Integer.parseInt(examStatus));
				ExamInfoModelServiceInterface intface = new ExamInfoModelServiceImpl();
				boolean status = intface.saveExamInfo(model);
				if (status == true) {
					response.sendRedirect("admin/manageExamInfo.jsp?error=sucessfullEntryAddExamInfo");
				} else {
					response.sendRedirect("admin/manageExamInfo.jsp?error=addExamInfo");

				}
			}
		}

	}

}
