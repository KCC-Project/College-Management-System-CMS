package com.cms.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

	public static void sendEmailPasswordForgot(String email, String hash) 
			throws AddressException, MessagingException {
		
		Properties props = new Properties();
		//------ sets SMTP server properties ---------
//        Properties properties = new Properties();
        
        //------- this is not working for now --------
//        properties.put("mail.smtp.host", "smtp.gmail.com");
//        properties.put("mail.smtp.port", 465);
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
        
        // creates a new session with an authenticator
        // this is a our system.. gmail username and password, 
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("collegemanagemetsystem", "cms12345");
            }
        };

        Session session = Session.getInstance(props,auth);
        
        String message_to_user = "The verification link is given below: "
        		+ "http://localhost:8080/CollegeManagementSystem/ResetPassword.jsp?email="+email+"&hash="+hash+"&code=abcd"+"&tablename=student"+"&id=50";
        String message_subject_to_user = "Forgot Password verify link from cms";
        
        MimeMessage msg = new MimeMessage(session);
        msg.setContent(message_to_user, "text/html");
        msg.setSubject(message_subject_to_user);
        msg.setFrom(new InternetAddress("collegemanagemetsystem"));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        
		Transport transport = session.getTransport("smtps");
		transport.connect("smtp.gmail.com", 465, "collegemanagemetsystem", "cms12345");
		transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();
	}
}
