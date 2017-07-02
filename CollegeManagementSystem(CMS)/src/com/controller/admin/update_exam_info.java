package com.controller.admin;

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

@WebServlet("/update_exam_info")
public class update_exam_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject=request.getParameter("subject_idd");
		String examTypeId=request.getParameter("examType_idd");
		String examStartdate=request.getParameter("exam_start_datee");
		String examenddate=request.getParameter("exam_end_datee");
		String examStartTime=request.getParameter("exam_start_timee");
		String examEndTime=request.getParameter("exam_end_timee");
		String examFullmarks=request.getParameter("exam_fullMarkss");
		String examPassmarks=request.getParameter("exam_passMarkss");
		String examStatus=request.getParameter("statuss");
		String examID=request.getParameter("hiddenValueToUpdate");//primarykey
		
		if (examID.equalsIgnoreCase("")||subject.equalsIgnoreCase("")||examTypeId.equalsIgnoreCase("")||examStartdate.equalsIgnoreCase("")||examenddate.equalsIgnoreCase("")||examStartTime.equalsIgnoreCase("")||examEndTime.equalsIgnoreCase("")||examStatus.equalsIgnoreCase("")) {
			response.sendRedirect("admin/manageExamInfo.jsp?error=updateErrorInExamInfo");
			
		}else{
			int subId=Integer.parseInt(subject);
			int examId=Integer.parseInt(examTypeId);
			int primaryKey=Integer.parseInt(examID);
			ExamInfoModel model= new ExamInfoModel();
			model.setSubjectId(subId);
			model.setExamTypeId(examId);
			model.setExamStartDate(DateUtil.convertToDate(examStartdate));
			model.setExamEndDate(DateUtil.convertToDate(examenddate));
			model.setExamStartTime(examStartTime);
			model.setExamEndTime(examEndTime);
			model.setFullmarks(Integer.parseInt(examFullmarks));
			model.setPassmarks(Integer.parseInt(examPassmarks));
			model.setStatus(Integer.parseInt(examStatus));
			model.setExamId(primaryKey);
			ExamInfoModelServiceInterface intface= new ExamInfoModelServiceImpl();
			boolean status= intface.updateExamInfo(model);
			System.out.println(status);
			if (status==true) {
				response.sendRedirect("admin/manageExamInfo.jsp?error=sucessfullEntryUpdateExamInfo");
			}else{
				response.sendRedirect("admin/manageExamInfo.jsp?error=addExamInfo");
				
			}
		}

	}

}
