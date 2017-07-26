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
import com.service.ForgetEmailUserModelServiceInterface;
import com.serviceimpl.ForgetEmailUserModelServiceImpl;


@WebServlet("/forgotPassword_verificationTimeLimit")
public class forgotPassword_verificationTimeLimit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		ForgetEmailUserModelServiceInterface service = new ForgetEmailUserModelServiceImpl();
		List<ForgetEmailUserModel> list = service.getForgetEmailSearched(email);
		if (list.size()>0) {
			out.write("Password Reset Timeout");
		}
	}

}
