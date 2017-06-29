package com.controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.SemesterModel;
import com.model.StudentModel;
import com.mysql.fabric.Response;
import com.service.SemesterServiceInterface;
import com.service.StudentServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.StudentServiceImpl;


@WebServlet("/Semester_Add_Controller")
public class Semester_Add_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Semester_Add_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); // date formatter
		
		// catching all the data obtained from the post method
		int program_id = Integer.parseInt(request.getParameter("program_id"));
		int batch_year = Integer.parseInt(request.getParameter("batch_id"));
		int semester_no = Integer.parseInt(request.getParameter("semester_no"));
		String start_date_s = request.getParameter("start_date");
		
		Date start_date;
		try {
			start_date = df.parse(start_date_s);
			System.out.println(start_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int status = Integer.parseInt(request.getParameter("status"));
		
		System.out.println("program: "+program_id);
		// checking for empty and invalid values
		if(semester_no == 0 || program_id == 0 || batch_year == 0){
			System.out.println("User Entered Invalid Values");
			//response.sendRedirect("admin/semesterAdd.jsp");
		}
		else {
			// Semester Model object
			SemesterModel semesterModel = new SemesterModel();
			
			// storing values in model
			semesterModel.setSemester_no(semester_no);
			semesterModel.setProgram_id(program_id);
			semesterModel.setBatch_year(batch_year);
			semesterModel.setStatus(status);
			
			// using semester service to add semester
			SemesterServiceInterface semesterService = new SemesterServiceImpl();
			if (semesterService.addSemester(semesterModel) == true) {
				System.out.println("Semester Added Sucessfully");
			} else {
				System.out.println("Oops! Something went Wrong");
			}

		}
	}

}
