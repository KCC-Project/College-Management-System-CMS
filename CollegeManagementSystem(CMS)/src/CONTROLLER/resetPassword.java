package CONTROLLER;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SERVICE.ForgetEmailUserModelServiceInterface;
import SERVICE.Impl.ForgetEmailUserModelServiceImpl;

@WebServlet("/resetPassword")
public class resetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password = request.getParameter("passwordField");
		String Confirmpassword = request.getParameter("confirmPassword");
		String tableName = request.getParameter("tableName");
		String verificationCode = request.getParameter("verificationCode");
		String id1 = request.getParameter("id");
		if (id1.equals("")) {
			id1 = "-1";
		}
		int id = Integer.parseInt(id1);

		System.out.println(password + " =" + Confirmpassword);
		System.out.println("tablename= " + tableName);
		System.out.println("code= " + verificationCode);
		System.out.println("id= " + id);
		if (password.equals("") || Confirmpassword.equals("") || tableName.equals("") || verificationCode.equals("")
				|| id < 0) {
			response.sendRedirect("index.jsp?error=hack");
		} else {
			if (password.equals(Confirmpassword)) {
				ForgetEmailUserModelServiceInterface service = new ForgetEmailUserModelServiceImpl();
				boolean isSucessfull = service.resetPassword(tableName, id, verificationCode, Confirmpassword);
				if (isSucessfull == true) {
					response.sendRedirect("index.jsp?error=passwordResetSucessful");
				} else {
					response.sendRedirect("index.jsp?error=passwordResetNotSucessful");
				}
				System.out.println("Password reset sucess or not ="
						+ service.resetPassword(tableName, id, verificationCode, Confirmpassword));
			}
		}
	}
}
