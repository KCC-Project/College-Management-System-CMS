package com.controller.forget_reset_password_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ForgetEmailUserModel;
import com.model.StudentModel;
import com.service.ForgetEmailUserModelServiceInterface;
import com.service.StudentServiceInterface;
import com.serviceimpl.ForgetEmailUserModelServiceImpl;
import com.serviceimpl.StudentServiceImpl;
import com.util.MailUtil;

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
				String verificationCode=studentModel.getAuthienciationCode();
				int id=studentModel.getId();
				String tableName=studentModel.getType();
				

				String resultMessage = ""; // message to reply back to user
											// either send is successful or not

				try {
					MailUtil.sendEmailPasswordForgot(email, verificationCode,id,tableName);
					resultMessage = "Success! Please check you email for the verification Link <a href='https://www.google.com/gmail/' target='_blank'>click here</a>";
					out.write("<p>" + resultMessage + "</p>");
				} catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "Oops! something went wrong: " + ex.getMessage();
					out.write("<p>" + resultMessage + "</p>");
				} finally {
					request.setAttribute("Message", resultMessage);
				}
			}

		}

		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		out.flush();

	}

}
