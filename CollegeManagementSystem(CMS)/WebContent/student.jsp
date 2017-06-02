<%@page import="Model.StudentModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
<link
	href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>

<% StudentModel model = new StudentModel(); %>

<div class="container">
<div class="col-lg-4">
	<form method="post" action="addStudent">
			
				<div class="form-group">
					<label for="FirstName" >First Name </label>
					<input type="text" name="student_firstname" class="form-control" placeholder="firstname" value="<%= model.getFirstname() %>">
				</div>

					<div class="form-group">
					<label for="middleName" >Middle Name </label>
					<input type="text" name="student_middlename" class="form-control" placeholder="middlename">
				</div>

				<div class="form-group">
					<label for="lastName" >Last Name </label>
					<input type="text" name="student_Lastname" class="form-control" placeholder="lasttname">
				</div>

					<div class="form-group">
					<label for="Userame" > Userame </label>
					<input type="text" name="student_username" class="form-control" placeholder="username">
				</div>
			
				<div class="form-group">
					<label for="Password" >Password </label>
					<input type="text" name="password" class="form-control" placeholder="password">
				</div>

				<div class="form-group">
					<label for="Confirm_Password" >Confirm Password </label>
					<input type="text" name="confirm_password" class="form-control" placeholder="password">
				</div>

				<div class="form-group">
					<label for="Email" >Email </label>
					<input type="email" name="email" class="form-control" placeholder="Email">
				</div>

				<div class="form-group">
					<label for="phone" >Mobile No. </label>
					<input type="number" name="Mobile" class="form-control" placeholder="mobile no">
				</div>

				<div class="form-group">
					<label for="Address" >Address </label>
					<input type="text" name="Address" class="form-control" placeholder="Address">
				</div>


				 <div class = "form-group">
    
         
            <label><input type = "radio" name="fmale"> Male</label>
            <label><input type = "radio" name="fmale"> Female</label>
         
  		 </div>

  		 <div class = "form-group">
      <label class = "sr-only" for = "inputfile">Profile Picture</label>
      <input type = "file" id = "inputfile" name="filepath">
   </div>

     <button type = "submit" class = "btn btn-default">Submit</button>
	</form>
</div>
</div>



</body>
</html>