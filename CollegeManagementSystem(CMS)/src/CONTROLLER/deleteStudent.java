package CONTROLLER;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SERVICE.StudentServiceInterface;
import SERVICE.Impl.StudentServiceImpl;


@WebServlet("/deleteStudent")
public class deleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public deleteStudent() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
