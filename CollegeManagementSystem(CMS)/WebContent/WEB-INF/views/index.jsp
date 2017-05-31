<% if(session.getAttribute("userName")==null){
	RequestDispatcher reqDisp = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
	reqDisp.forward(request, response);
}  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information System</title>
<link
	href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/Resources/css/custom2.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<form action="indexController"></form>

<h1>Welcome ${userName}</h1> 
</body>
</html>