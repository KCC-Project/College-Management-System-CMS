package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;

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
		resp.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String category = request.getParameter("category");
		int categoryIndex = 0;
		if (category.equalsIgnoreCase("Admin")) {

			categoryIndex = 1;
		} else if (category.equalsIgnoreCase("Teacher")) {
			categoryIndex = 2;
		} else if (category.equalsIgnoreCase("Student")) {
			categoryIndex = 3;
		}
		if (categoryIndex != 0) {
			LoginModel loginModel = new LoginModel();
			loginModel.setUserEntry(request.getParameter("InputEmail1User"));
			loginModel.setPassword(request.getParameter("InputPassword1"));
			String rememberMe = request.getParameter("rememberMe");
			loginModel.setSelectedIndex(categoryIndex);

			LoginServiceInterface loginServiceInterface = new LoginServiceImpl();
			boolean isAuthenticated = loginServiceInterface.getUserEntryPassword(loginModel);
			if (isAuthenticated == true) {
				HttpSession session = request.getSession();
				session.setAttribute("userName", loginModel.getUserEntry());
				if (rememberMe != null) {
					session.setAttribute("password", loginModel.getPassword());
				}
				response.sendRedirect("admin/admin-dashboard.jsp");

			} else {
				response.sendRedirect("index.jsp?err=1");
			}
		} else {
			response.sendRedirect("index.jsp?err=2");
		}

	}

}
