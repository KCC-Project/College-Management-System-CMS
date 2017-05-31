<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link
	href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/Resources/css/custom2.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<div class="container">

		<form method="post" action="login">
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 col-sm-offset-4">
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
								</label> <select class="form-control form-element" name='category'>
								<option class='drop-down' value='selectOne'>Select One</option>
									<option class='drop-down' value='admin'>Admin</option>
									<option class='drop-down' value='teacher'>Teacher</option>
									<option class='drop-down' value='student'>Student</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><span
								class="glyphicon glyphicon-user"> </span> Username / Email </label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								placeholder="Username/Email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password">
						</div>

						<div class="checkbox">
							<label> <input type="checkbox"> Remember Me
							</label>
						</div>
						<button type="button"
							class="btn btn-default btn-success btn-block submit-btn login-btn">
							<span class="glyphicon glyphicon-lock"></span>&nbsp; Login
						</button>

					</div>
				</div>
				</div>
			</div>

		</form>

	</div>
</body>
</html>