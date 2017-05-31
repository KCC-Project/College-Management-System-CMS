package CONTROLLER;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LoginModel;
import SERVICE.LoginServiceInterface;
import SERVICE.Impl.LoginServiceImpl;

@WebServlet("/login")
public class loginController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher reqDisp = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
		reqDisp.forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LoginModel loginModel = new LoginModel();
		loginModel.setUserEntry(request.getParameter("InputEmail1User"));
		loginModel.setPassword(request.getParameter("InputPassword1"));
		String n= request.getParameter("rememberMe");
		System.out.println("remember me value :"+n);
		LoginServiceInterface loginServiceInterface = new LoginServiceImpl();
		boolean isAuthenticated = loginServiceInterface.getUserEntryPassword(loginModel);
		System.out.println("is authenciated: " + isAuthenticated);
		if (isAuthenticated == true ) {
			HttpSession session = request.getSession();
			session.setAttribute("userName", loginModel.getUserEntry());
			if ( n!=null) {
				session.setAttribute("password", loginModel.getPassword());
			}
		
			
			RequestDispatcher reqDisp = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			reqDisp.forward(request, response);
		
		} else {
			RequestDispatcher reqDisp = request.getRequestDispatcher("/WEB-INF/views/login.jsp?err=1");
			reqDisp.forward(request, response);
		}
	}

}
