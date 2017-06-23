<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("userName")!= null) {
		response.sendRedirect("admin/admin-dashboard.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="Resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="Resources/css/custom2.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">

		<form method="post" action="login">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-sm-offset-3 col-md-offset-3 col-lg-offset-4">
				<div class="form-content">
					<div class="form-header back white">
						<div class="form-top-left">
							<h3>Login</h3>
							<p>Be a part of your College Community</p>
						</div>
						<div class="form-top-right">
							<span class="glyphicon glyphicon-pencil"></span>
						</div>

						<br>
					</div>


					<div class="p">

						<div class="form-group">

							<div class="form-group category">

								<label for="category"> <span
									class="glyphicon glyphicon-user"></span> Login as
								</label> <select required class="form-control form-element" name='category'>
									<option class='drop-down' value="" disabled selected> Select One </option>
									<option class='drop-down' value='admin'>Admin</option>
									<option class='drop-down' value='teacher'>Teacher</option>
									<option class='drop-down' value='student'>Student</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><span
								class="glyphicon glyphicon-user"> </span> Username / Email </label> <input
								type="text" class="form-control" required name="InputEmail1User"
								placeholder="Username/Email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" required name="InputPassword1"
								placeholder="Password">
						</div>

						<div class="checkbox">
							<label class="pull-left"> <input type="checkbox" name="rememberMe">
								Remember Me
							</label>
							
						</div>
						
						<Button type="submit"
							class="btn btn-success btn-block login-btn">
							<span class="glyphicon glyphicon-lock"></span>&nbsp;Login
							
						</Button>
						<hr>
						<label class="pullright">
							<a href="" data-toggle="modal" data-target="#myModal">forgot password?</a>
							</label>
					</div>

				</div>

			</div>


		</form>
	</div>
	


<!-- Modal popup of forgot password -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Forgot Password</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="forgotpassword">
        	<div class="form-group">
				<label for="input for forgot email"><span
					class="glyphicon glyphicon-user"> </span> Email </label> <input
					type="text" class="form-control" required name="forgotemailname"
					placeholder="Email">
			</div>
			<Button type="submit"
				class="btn btn-info btn-success btn-block submit-btn login-btn">
				<span class="glyphicon glyphicon-lock"></span>&nbsp;Send verification link
			</Button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>	

</body>
</html>