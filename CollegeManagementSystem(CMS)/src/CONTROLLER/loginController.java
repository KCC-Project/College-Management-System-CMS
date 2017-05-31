package CONTROLLER;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		LoginServiceInterface loginServiceInterface = new LoginServiceImpl();
		System.out.println("from controller :"+loginServiceInterface.getUserEntryPassword(loginModel));
	}

}
