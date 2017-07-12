package com.controller.admin.delete;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daoimpl.ExamInfoModelImpl;
import com.service.ExamInfoModelServiceInterface;
import com.service.ExamModelServiceInterface;
import com.serviceimpl.ExamInfoModelServiceImpl;
import com.serviceimpl.ExamModelServiceImpl;

@WebServlet("/delete_Exam_info")
public class delete_Exam_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deleteExamId = request.getParameter("deleteIdJson");
	//	System.out.println("deleted exmid="+deleteExamId);
	ExamInfoModelServiceInterface interfaceExamInfo= new ExamInfoModelServiceImpl();
		if (deleteExamId.equalsIgnoreCase("")) {
			response.sendRedirect("admin/manageExamInfo.jsp?error=deletingexamInfo");
		} else {
			int id = Integer.parseInt(deleteExamId);
			//System.out.println("examId from ajax="+id);
			int delete=interfaceExamInfo.deleteExamInfo(id);
			if (delete==1) {
				response.sendRedirect("admin/manageExamInfo.jsp?error=sucessfuldelete");	
			}else{
				response.sendRedirect("admin/manageExamInfo.jsp?error=notDeleted_inuse");		
			}
			
		}
	}

}
