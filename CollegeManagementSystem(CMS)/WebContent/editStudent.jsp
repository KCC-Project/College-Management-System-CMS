<%@page import="Model.StudentModel"%>
<%@page import="SERVICE.Impl.StudentServiceImpl"%>
<%@page import="SERVICE.StudentServiceInterface"%>
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

	<%
		Integer id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		StudentModel model= new StudentServiceImpl().readId(id);
	%>
	<div class="container">
		<div class="col-lg-4">
			<form method="Post" action="updateStudent" enctype="multipart/form-data">

				<div class="form-group">
					<label for="FirstName">First Name </label><input type="hidden" name="txtID" value="<%=id%>"> <input type="text"
						name="student_firstname" class="form-control"
						 value="<%= model.getFirstname()%>">
				</div>

				<div class="form-group">
					<label for="middleName">Middle Name </label> <input type="text"
						name="student_middlename" class="form-control"
					value="<%= model.getMiddlename()%>">
				</div>

				<div class="form-group">
					<label for="lastName">Last Name </label> <input type="text"
						name="student_Lastname" class="form-control"
					 value="<%= model.getLastname()%>">
				</div>

				<div class="form-group">
					<label for="Userame"> Userame </label> <input type="text"
						name="student_username" class="form-control"
						 value="<%= model.getUsername()%>">
				</div>

				<div class="form-group">
					<label for="Password">Password </label> <input type="text"
						name="password" class="form-control"  value="<%= model.getPassword()%>">
				</div>

				<div class="form-group">
					<label for="Confirm_Password">Confirm Password </label> <input
						type="text" name="confirm_password" class="form-control"
					value="<%= model.getPassword()%>">
				</div>

				<div class="form-group">
					<label for="Email">Email </label> <input type="email" name="email"
						class="form-control"  value="<%= model.getEmail()%>">
				</div>

				<div class="form-group">
					<label for="phone">Mobile No. </label> <input type="number"
						name="Mobile" class="form-control"  value="<%= model.getMobileNo()%>">
				</div>

				<div class="form-group">
					<label for="Address">Address </label> <input type="text"
						name="Address" class="form-control" value="<%= model.getAddress()%>">
				</div>


				<div class="form-group">


					<label><input type="radio" value="Male" name="fmale">
						Male</label> <label><input type="radio" value="Female"
						name="fmale"> Female</label>

				</div>

				<div class="form-group">
					<label class="sr-only" for="inputfile">Profile Picture</label> <input
						type="file" id="inputfile" name="filepath">
				</div>

				<button type="submit" class="btn btn-default">Update</button>
			</form>
		</div>
	</div>

</body>
</html>