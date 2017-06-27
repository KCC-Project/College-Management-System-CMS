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
<link href="../Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="../Resources/font-awesome/css/font-awesome.min.css">
<link href="../Resources/ionicons/css/ionicons.min.css" rel="stylesheet">

<div class="container-fluid display-table">

	<div class="row display-table-row ">

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

				<!--NOtice and message loading section  -->
				<div class="callout callout-info msg-of-day">
					<h4>
						<i class="fa fa-bullhorn"></i> Message of day box
					</h4>
					<p>
						<marquee onmouseout="this.setAttribute('scrollamount', 6, 0);"
							onmouseover="this.setAttribute('scrollamount', 0, 0);"
							scrollamount="6" behavior="scroll" direction="left">Each
							Day is a GIFT don't send it BACK unopened. Have a nice Day !</marquee>
					</p>
				</div>
				<!--End  of notice and message section  -->

				<!--4 box start from here  -->
				<div class="row">
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
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
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
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
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
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
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3>5</h3>
								<p>Active Batches</p>
							</div>
							<div class="icon">
								<i class="fa fa-sitemap"></i>
							</div>
							<a class="small-box-footer" href="#" target="_blank">More
								info <i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
				</div>

				<!--4 box end  here  -->



			</div>
		</div>


	</div>

	<!-- --------------------------------------------------------------- -->



</div>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	// Load google charts
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	// Draw the chart and set the chart values
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 8 ], [ 'Eat', 2 ],
				[ 'TV', 4 ], [ 'Gym', 2 ], [ 'Sleep', 8 ] ]);

		// Optional; add a title and set the width and height of the chart
		var options = {
			'title' : 'My Average Day',
			'width' : 485,
			'height' : 343
		};

		// Display the chart inside the <div> element with id="piechart"
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		chart.draw(data, options);
	}
</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
</body>
</html>
