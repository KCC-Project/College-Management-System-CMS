<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
<link href="Resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="Resources/css/loginAndResetPassword.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<form method="post" action="login">
			<div
				class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-sm-offset-3 col-md-offset-3 col-lg-offset-4  form_margin_resetPassword_only">
				<div class="form-content ">
					<div class="border">
						<div class="form-header back white ">
							<div class="form-top-left ">
								<h3>Reset your password</h3>
							</div>
							<div class="form-top-right">
								<span class="glyphicon glyphicon-pencil"></span>
							</div>
							<br>
						</div>
						<div class="p">

							<div class="form-group">
								<label for="password"><span
									class="glyphicon glyphicon-eye-open"> </span> Password </label> <input
									type="password" class="form-control" required
									name="passwordField" placeholder="Enter password">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><span
									class="glyphicon glyphicon-eye-open"></span> Confirm password</label> <input
									type="password" class="form-control" required
									name="confirmPassword" placeholder="Confirm password">
							</div>
							<Button type="submit" class="btn btn-success btn-block login-btn_resetPassword_only">
								<span class="glyphicon glyphicon-lock"></span>&nbsp;Reset
							</Button>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>