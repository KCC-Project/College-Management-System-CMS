<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<div class= "container">
<div class="row">
<h1> Are you sure you want to delete</h1>
<form action="deleteStudent" method="post">
<input type="hidden" name="txtID" value="<%=request.getParameter("id") %>">
<input type="submit" value="Yes" name="deleteConfirm" class="btn btn-alert">
<a href="viewStudent.jsp" class="btn btn-primary">No</a>
</form>
</div>
</div>
</body>
</html>