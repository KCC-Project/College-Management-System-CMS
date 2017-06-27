<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("userName") == null) {
		response.sendRedirect("../index.jsp");
	}
%>
<jsp:include page="admin-header.jsp" />

<link rel="stylesheet" type="text/css"
	href="../Resources/css/admin-dashboard.css">
<link href="Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="Resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">


<div class="container-fluid display-table">

	<div class="row display-table-row">

		<jsp:include page="admin-sidemenu.jsp" />


		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

			<ol class="breadcrumb">
				<li><a href="admin-dashboard.jsp"><span
						class="glyphicon glyphicon-home"> Home</span></a></li>
				<li><a><span class="glyphicon glyphicon-blackboard black">
							Dashboard</span></a></li>
			</ol>

			<div class="panel-group" id="first-one">

				<div class="panel panel-default">
					<div class="panel-heading main-color-bg">
						<h3 class="panel-title">Overview</h3>
					</div>
					<div class="panel-body four-section">
						<div class="col-md-3">
							<div class="small-box bg-aqua">
								<div class="inner">
									<h3>15</h3>
									<p>Students</p>
								</div>
								<div class="icon">
									<i class="ion ion-ios-people"></i>
								</div>
								<a class="small-box-footer" href="#" target="_blank">More
									info <i class="fa fa-arrow-circle-right"></i>
								</a>
							</div>

						</div>
						<div class="col-md-3">
							<div class="small-box bg-green">
								<div class="inner">
									<h3>17</h3>
									<p>Staff</p>
								</div>
								<div class="icon">
									<i class="ion ion-person"></i>
								</div>
								<a class="small-box-footer" href="#" target="_blank">More
									info <i class="fa fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="small-box bg-yellow">
								<div class="inner">
									<h3>5</h3>
									<p>Active Courses</p>
								</div>
								<div class="icon">
									<i class="fa fa-graduation-cap"></i>
								</div>
								<a class="small-box-footer" href="#" target="_blank">More
									info <i class="fa fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="small-box bg-red">
								<div class="inner">
									<h3>5</h3>
									<p>Active Batches</p>
								</div>
								<div class="icon">
									<i class="fa fa-sitemap"></i>
								</div>
								<a class="small-box-footer"
									href="#"
									target="_blank">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="panel panel-default" id="second-one">
							<div class="panel-heading main-color-bg">
								<h3 class="panel-title">Notices</h3>
							</div>
							<div class="panel-body">
								<div class="profile-activity">
									<div class="event-info">
										<ul>
											<li><a href="#"><img
													class="event-uploader-image pull-left" src="me.jpg" alt=""></a>
											</li>
											<li>
												<p class="small">
													<a href="#" class="black">{uloader name}</a> at {time,
													date}
												</p>
											</li>
											<li><p>All the UI design must be completed within, 2
													weeks</p></li>
										</ul>
									</div>
									<div class="event-info">
										<ul>
											<li><a href="#"><img
													class="event-uploader-image pull-left" src="me.jpg" alt=""></a>
											</li>
											<li>
												<p class="small">
													<a href="#" class="black">Shrawan Adhikari</a> at {10:05PM
													2017/08/06}
												</p>
											</li>
											<li><p>This is the next notice</p></li>
										</ul>
									</div>


								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default" id="second-one">
							<div class="panel-heading main-color-bg">
								<h3 class="panel-title">News</h3>
							</div>
							<div class="panel-body"></div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>

	<!-- --------------------------------------------------------------- -->



</div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
</body>
</html>
