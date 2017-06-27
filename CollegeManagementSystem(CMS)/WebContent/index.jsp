<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("userName") != null) {
		response.sendRedirect("admin/admin-dashboard.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="Resources/font-awesome/css/font-awesome.min.css">
<link href="Resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="Resources/css/loginAndResetPassword.css" rel="stylesheet"
	type="text/css">


</head>
<body>

	<div class="container">

		<form method="post" action="login">
			<div
				class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-sm-offset-3 col-md-offset-3 col-lg-offset-4  form_margin">
				<div class="form-content ">
					<div class="border">
						<div class="form-header back white ">
							<div class="form-top-left ">
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
									</label> <select required class="form-control form-element"
										name='category'>
										<option class='drop-down' value="" disabled selected>
											Select One</option>
										<option class='drop-down' value='admin'>Admin</option>
										<option class='drop-down' value='teacher'>Teacher</option>
										<option class='drop-down' value='student'>Student</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"><span
									class="glyphicon glyphicon-user"> </span> Username / Email </label> <input
									type="text" class="form-control" required
									name="InputEmail1User" placeholder="Username/Email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><span
									class="glyphicon glyphicon-eye-open"></span> Password</label> <input
									type="password" class="form-control" required
									name="InputPassword1" placeholder="Password">
							</div>

							<div class="checkbox">
								<label class="pull-left"> <input type="checkbox"
									name="rememberMe"> Remember Me
								</label>

							</div>

							<Button type="submit" class="btn btn-success btn-block login-btn">
								<span class="glyphicon glyphicon-lock"></span>&nbsp;Login

							</Button>
							<hr>
							<label class="pullright"> <a href="" data-toggle="modal"
								data-target="#myModal">forgot password?</a>
							</label>
						</div>
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

					<div class="form-group">
						<label for="input for forgot email"><span
							class="glyphicon glyphicon-user"> </span> Email </label> <input
							onkeyup="showSubmit();" type="text" class="form-control" required
							id="forgotemailname" placeholder="Email">
					</div>
					<div class="rotationIcon text-center" hidden id="rotationIcon">
						<i class='fa fa-refresh w3-spin' style="font-size: 50px; "></i>
					</div>
					<Button onclick="send();" type="submit" id="btnn"
						class="btn btn-primary active btn-block submit-btn login-btnReset">
						<span class="glyphicon glyphicon-lock"></span>&nbsp;Send
						verification link
					</Button>
					<div id="errmsg"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<script>
		function send() {
			document.getElementById("rotationIcon").style.display = "block";
			document.getElementById("btnn").style.display = "none";
			//document.getElementById("btnn").disabled = true;

			var email = document.getElementById("forgotemailname").value;
			var url = "forgotPassword";
			var sendEmail = "email=" + email;
			var aj = new XMLHttpRequest();
			aj.open("POST", url, true);
			aj.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			aj.onreadystatechange = function() {

				if (aj.readyState == 4 && aj.status == 200) {
					var return_data = aj.responseText;
					var res = return_data.substring(3, 11);
					if (res.match("Success!")) {
						document.getElementById("forgotemailname").disabled = true;
						document.getElementById("btnn").innerHTML = "Sucessfull";
						document.getElementById("rotationIcon").style.display = "none";
					} else {
						document.getElementById("rotationIcon").style.display = "none";
						document.getElementById("btnn").style.display = "block";
						document.getElementById("btnn").innerHTML = "Failed";
						var div = document.getElementById('btnn');
						div.className = 'btn btn-danger btn-block';
					}
					document.getElementById("errmsg").innerHTML = return_data;

				}
			}
			aj.send(sendEmail);
		}

		function showSubmit() {
			document.getElementById("rotationIcon").style.display = "none";
			document.getElementById("btnn").disabled = false;
			var div = document.getElementById('btnn');
			div.className = 'btn btn-primary active btn-block';
			document.getElementById("btnn").innerHTML = "<span class='glyphicon glyphicon-lock'></span>&nbsp;Send verification link";
			document.getElementById("errmsg").innerHTML = "";
		}
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	<script type="text/javascript">
		function googleTranslateElementInit() {
  			new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
		}
	</script>

	<script type="text/javascript" 
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
		

</body>
</html>