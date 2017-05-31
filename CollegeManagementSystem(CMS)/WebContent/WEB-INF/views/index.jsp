
<%
	if (session.getAttribute("userName") == null) {
		RequestDispatcher reqDisp = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		reqDisp.forward(request, response);
	}
%>
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

</head>
<body>
	<div class="container">
		<form action="indexController"></form>
		<a href="<%RequestDispatcher dis=request.getRequestDispatcher("/WEB-INF/views/login.jsp"); %> ">logout</a>
		<h1>Welcome ${userName}</h1>
</div>		
</body>
</html>