package com.controller.admin.save;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.SemesterModel;
import com.service.SemesterServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.util.DateUtil;


@WebServlet("/Semester_Add_Controller")
@MultipartConfig(maxFileSize = 16177215)
public class Semester_Add_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Semester_Add_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// catching all the data obtained from the post method
		int program_id = Integer.parseInt(request.getParameter("program_id"));
		int batch_year = Integer.parseInt(request.getParameter("batch_id"));
		int semester_no = Integer.parseInt(request.getParameter("semester_no"));
		Date start_date = DateUtil.convertToDate(request.getParameter("start_date"));
		Date end_date = DateUtil.convertToDate(request.getParameter("end_date"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		
		// checking for empty and invalid values
		if(semester_no == 0 || program_id == 0 || batch_year == 0 ){
			System.out.println("User Entered Invalid Values");
			response.sendRedirect("admin/manageSemesters.jsp?err=user input data error");
		}
		else {
			// Semester Model object
			SemesterModel semesterModel = new SemesterModel();
			
			// storing values in model
			semesterModel.setSemester_no(semester_no);
			semesterModel.setProgram_id(program_id);
			semesterModel.setBatch_year(batch_year);
			semesterModel.setStart_date(start_date);
			semesterModel.setEnd_date(end_date);
			semesterModel.setStatus(status);
			
			System.out.println(start_date);
			System.out.println(end_date);
			
			// using semester service to add semester
			SemesterServiceInterface semesterService = new SemesterServiceImpl();
			if (semesterService.addSemester(semesterModel) == true) {
				System.out.println("Semester Added Sucessfully");
				response.sendRedirect("admin/manageSemesters.jsp?status=sucess");
			} else {
				System.out.println("Oops! Something went Wrong");
				response.sendRedirect("admin/manageSemesters.jsp?err=couldnt add");
			}

		}
	}

}
