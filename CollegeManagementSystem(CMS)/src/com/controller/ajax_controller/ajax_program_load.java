package com.controller.ajax_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ProgramModel;
import com.service.ProgramServiceInterface;
import com.serviceimpl.ProgramServiceImpl;

@WebServlet("/ajax_program_load")
public class ajax_program_load extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ajax_program_load() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProgramServiceInterface service = new ProgramServiceImpl();
		List<ProgramModel> faculty = service.getAllRecord();
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = response.getWriter();
		
		out.flush();
	}
}
