package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.StudentServiceInterface;
import com.serviceimpl.StudentServiceImpl;
//Mausam 

@WebServlet("/deleteStudent")
public class deleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public deleteStudent() {
      
    }
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("herer");
	int id=Integer.parseInt(request.getParameter("txtID"));
	StudentServiceInterface delete= new StudentServiceImpl();
	if(delete.delete(id)>0){
		response.sendRedirect("admin/managestudents.jsp");
	}
	else{
		response.sendRedirect("admin/deleteStudent.jsp?id="+id);
	}
	}

}
