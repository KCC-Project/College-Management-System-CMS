
<%
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("login.jsp");
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
		
		<a href="logout" class="btn btn-danger">logout</a>
	 	<h1>Welcome ${userName}</h1>
	 <a href="student.jsp" class="btn btn-danger">AddStudent</a>
	 </div>		
</body>
</html>