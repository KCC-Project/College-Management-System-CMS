package CONTROLLER;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.util.MailUtil;

@WebServlet("/forgotPassword")

public class forgotPassword extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("forgotemailname");
		String hash = "1234hello1234"; //system generated hash code will be here
		
		String resultMessage = ""; // message to reply back to user either send is successful or not 
		
		try {
            MailUtil.sendEmailPasswordForgot(email,hash);
            resultMessage = "Success! Please check you email for the verification Link";
            System.out.println(resultMessage);
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "Oops! something went wrong: " + ex.getMessage();
            System.out.println(resultMessage);
        } finally {
            request.setAttribute("Message", resultMessage);
            System.out.println(request.getAttribute("Message"));
        }
	}

}
