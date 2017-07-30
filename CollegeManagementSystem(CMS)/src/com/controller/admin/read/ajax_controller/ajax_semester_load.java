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
import com.model.YearModel;
import com.service.ProgramServiceInterface;
import com.service.SemesterServiceInterface;
import com.service.YearServiceInterface;
import com.serviceimpl.ProgramServiceImpl;
import com.serviceimpl.SemesterServiceImpl;
import com.serviceimpl.YearServiceImpl;
import com.util.JsonUtil;
import com.util.Table;

@WebServlet("/ajax_semester_load")
public class ajax_semester_load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String program_id = request.getParameter("id");
		String semester_id = request.getParameter("semester_id");
		String pageNo = request.getParameter("page");
		String req_limit = request.getParameter("limit");
		
		int limit = 5; //default limit
		if(req_limit!=null){ limit = Integer.parseInt(req_limit); }
		int page;
		int start = 0;
		if(pageNo!=null){	page = Integer.parseInt(pageNo); start=(page-1)*limit; }
		
		String jsonResponse = null;
		
		if (program_id != null && !program_id.isEmpty()) {
			int id=Integer.parseInt(program_id);
			
			// classes used
			SemesterServiceInterface semester= new SemesterServiceImpl();
			ProgramServiceInterface program = new ProgramServiceImpl();
			YearServiceInterface year = new YearServiceImpl();
			
			Object[] obj = new Object[10];
			obj[2]=id;
			obj[7]=start; //start limit
			obj[8]=limit; // limit
		
			List<SemesterModel> mode= semester.searchByFields(obj);
			Map<String, Object> map= new HashMap<String,Object>();
			List tempList = new ArrayList();
			
			System.out.println("here is the total rows count: "+Table.getTotalRows());
			int total = Table.getTotalRows();
			int totalPage = Table.getTotalPage();
			
			for (SemesterModel sem : mode) {
				Map<String, Object> semMap= new HashMap<String,Object>();
				int jsemester_id = sem.getSemester_id();
				int semester_no = sem.getSemester_no();
				Date sem_start_date = sem.getStart_date();
				Date sem_end_date = sem.getStart_date();
				int status = sem.getStatus();
				int jprogram_id = sem.getProgram_id();
				int batch_year_id = sem.getBatch_year();
				ProgramModel pModel = program.getRecordById(jprogram_id);
				String program_name = pModel.getProgram_name();
				List<YearModel> yModel = year.getAllRecord();
				int batch_year = 0;
				for(YearModel y: yModel){
					if(batch_year_id == y.getYear_id()){
						batch_year = y.getYear();
					}
				}
				semMap.put("semester_id", jsemester_id);
				semMap.put("semester_no", semester_no);
				semMap.put("program_name", program_name);
				semMap.put("batch_year", batch_year);
				semMap.put("sem_start_date", sem_start_date);
				semMap.put("sem_end_date", sem_end_date);
				semMap.put("status", status);
				tempList.add(semMap);
				
			}
			map.put("tableData",tempList);
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
