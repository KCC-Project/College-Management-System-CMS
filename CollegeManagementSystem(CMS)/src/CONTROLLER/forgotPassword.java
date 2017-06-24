package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.MailUtil;

import Model.ForgetEmailUserModel;
import Model.StudentModel;
import SERVICE.ForgetEmailUserModelServiceInterface;
import SERVICE.StudentServiceInterface;
import SERVICE.Impl.ForgetEmailUserModelServiceImpl;
import SERVICE.Impl.StudentServiceImpl;

@WebServlet("/forgotPassword")

public class forgotPassword extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");

		ForgetEmailUserModelServiceInterface service = new ForgetEmailUserModelServiceImpl();
		List<ForgetEmailUserModel> list = service.getForgetEmailSearched(email);
		if (list.isEmpty()) {
			String mess = "Invalid Email! please use your valid email address to restore password";
			out.write("<p>" + mess + "</p>");
		}
		
		for (ForgetEmailUserModel studentModel : list) {
			String emailFromDb = studentModel.getEmail();
			if (emailFromDb.equalsIgnoreCase(email)) {
				String hash = "1234hello1234"; // system generated hash code
												// will be here

				String resultMessage = ""; // message to reply back to user
											// either send is successful or not

				try {
					MailUtil.sendEmailPasswordForgot(email, hash);
					resultMessage = "Success! Please check you email for the verification Link <a href='https://www.google.com/gmail/' target='_blank'>click here</a>";
					out.write("<p>" + resultMessage + "</p>");
				} catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "Oops! something went wrong: " + ex.getMessage();
					out.write("<p>" + resultMessage + "</p>");
				} finally {
					request.setAttribute("Message", resultMessage);
					// System.out.println(request.getAttribute("Message"));
				}

				// break;
			}

		}

		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		out.flush();

	}

}
