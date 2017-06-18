package CONTROLLER.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Faculty_ProgramModel;
import SERVICE.Faculty_Program_Model_Service;
import SERVICE.Impl.Faculty_Program_Model_Service_Impl;

@WebServlet("/aja")
public class ajaxForFacultyAndProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ajaxForFacultyAndProgram() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		Faculty_Program_Model_Service service = new Faculty_Program_Model_Service_Impl();
		List<Faculty_ProgramModel> mo = service.getAllRecord(id);
		for (Faculty_ProgramModel model : mo) {
			response.setContentType("text/xml");
		    response.setHeader("Cache-Control", "no-cache");
		    PrintWriter out = response.getWriter();
		    out.write("<option>" +model.getFaculty_Programe_Name() + "</option>");
		    out.flush();
		}
	}

}
