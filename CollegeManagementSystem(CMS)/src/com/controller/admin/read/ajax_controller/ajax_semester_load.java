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

import com.model.SemesterModel;
import com.service.SemesterServiceInterface;
import com.serviceimpl.SemesterServiceImpl;
import com.util.JsonUtil;
import com.util.Table;

@WebServlet("/ajax_semester_load")
public class ajax_semester_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String program_id = request.getParameter("id");
		String semester_id = request.getParameter("semester_id");
		String starts = request.getParameter("start");
		//System.out.println(Integer.parseInt(starts));
		int start = 0;
		if (starts!=null){ 
			start = Integer.parseInt(starts);
		}
		int limit = 10;
		
		String jsonResponse = null;
		
		if (program_id != null && !program_id.isEmpty()) {
			int id=Integer.parseInt(program_id);
			SemesterServiceInterface semester= new SemesterServiceImpl();
			
			Object[] obj = new Object[10];
			obj[2]=id;
			obj[7]=start; //start limit
			obj[8]=5; // limit
			
		
			List<SemesterModel> mode= semester.searchByFields(obj);
			Map<String, Object> map= new HashMap<String,Object>();
			System.out.println("here is the total rows count: "+Table.getTotalRows());
			int total = Table.getTotalRows();
			int totalPage = Table.getTotalPage();
			map.put("tableData",mode );
			map.put("TotalRow", total);
			map.put("TotalPage", totalPage);
			jsonResponse=JsonUtil.convertJavaToJson(map);
		}else if(semester_id != null && !semester_id.isEmpty()){
			int id=Integer.parseInt(semester_id);
			SemesterServiceInterface semester= new SemesterServiceImpl();
			
			Object[] obj = new Object[10];
			obj[0]=id;
			
			jsonResponse=JsonUtil.convertJavaToJson(semester.searchByFields(obj));
			
		}else {
			System.out.println("No data received");
		}
		
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		System.out.println("json="+jsonResponse);
		response.getWriter().write(jsonResponse);
	}

}
