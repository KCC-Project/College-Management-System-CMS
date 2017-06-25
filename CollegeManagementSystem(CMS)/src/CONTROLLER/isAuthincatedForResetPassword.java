package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SERVICE.ForgetEmailUserModelServiceInterface;
import SERVICE.Impl.ForgetEmailUserModelServiceImpl;

@WebServlet("/isAuthincatedForResetPassword")
public class isAuthincatedForResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableName = request.getParameter("table");
		int id = Integer.parseInt(request.getParameter("id"));
		String code = request.getParameter("vCode");

		ForgetEmailUserModelServiceInterface service = new ForgetEmailUserModelServiceImpl();

		boolean isAuthenciated = service.isAuthenticated(tableName, id, code);

		PrintWriter out = response.getWriter();
		out.write("" + isAuthenciated);
		out.flush();
	}

}
