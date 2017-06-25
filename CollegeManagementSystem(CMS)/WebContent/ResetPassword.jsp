<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
<link href="Resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="Resources/css/loginAndResetPassword.css" rel="stylesheet"
	type="text/css">
</head>
<body onload="checkIfAuthincated();">
	<div class="container">
		<form method="post" action="resetPassword">
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
							<Button type="submit"
								class="btn btn-success btn-block login-btn_resetPassword_only">
								<span class="glyphicon glyphicon-lock"></span>&nbsp;Reset
							</Button>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		window.onload = function() {
			
			//alert("Automatic loads this script");
			var fullURL = window.location.search.substring(1);
			var parameterArray = fullURL.split('&');

			if (parameterArray == "" || parameterArray.length < 5) {
				window.location.replace("index.jsp");
			} else {
				var currentParameterCode = parameterArray[2].split('=');
				var currentParameterTablename = parameterArray[3].split('=');
				var currentParameterID = parameterArray[4].split('=');
				
				if (currentParameterCode == "" ||currentParameterTablename=="" ||currentParameterID=="") {
					window.location.replace("index.jsp");
				}
				var vCode = currentParameterCode[1]; //vcode leko
				var tablename=currentParameterTablename[1];
				var ID=currentParameterID[1];
			
				if (vCode == null || tablename==null || ID==null) {
					window.location.replace("index.jsp");
				} 
				
				else {
					
					var url = "isAuthincatedForResetPassword";
					var vData = "table=" + tablename + "&vCode=" + vCode
							+ "&id=" + ID;
					var aj = new XMLHttpRequest();
					aj.open("POST", url, true);
					aj.setRequestHeader("Content-type",
							"application/x-www-form-urlencoded");
					aj.onreadystatechange = function() {
						if (aj.readyState == 4 && aj.status == 200) {
							var return_data = aj.responseText;
							alert("Result =" + return_data);
							if (return_data.match('false')) {
								window.location.replace("index.jsp");
							}
						}
					}
					aj.send(vData);

				}
			}
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>