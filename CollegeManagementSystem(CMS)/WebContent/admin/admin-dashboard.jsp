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

<div class="container-fluid display-table ">

	<div class="row display-table-row col-lg-12  ">

		<jsp:include page="admin-sidemenu.jsp" />


		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 col-lg-10 display-table-cell "
			id="content-area">

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
				<div class="row ">
					<div class="col-lg-3 col-xs-6 ">
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

				
				<div class="row ">
					<div class=" col-lg-7  ">
						<div class="col-lg-12">
							<section class="panel notice-panel">
								<header class="panel-heading">
									<ul class="nav nav-pills small ">
										<li class="pull-left notice-board-name "><a><i
												class="fa fa-inbox"></i> Notice Board</a>
										<li>
										<li class="pull-right"><a data-toggle="tab" href="#staff">
												<i class="icon-envelope"></i> Staff
										</a></li>
										<li class="pull-right"><a data-toggle="tab"
											href="#student"> <i class="glyphicon glyphicon-user"></i>
												Student
										</a></li>
										<li class="active pull-right"><a data-toggle="tab"
											href="#general"> <i class="glyphicon glyphicon-home"></i>
												General
										</a></li>
									</ul>
								</header>

								<div class="panel-body">
									<div class="tab-content">

										<div id="general" class="tab-pane active">
											<div class="notice-div">

												<div class="notice-info">
													<ul>
														<li>
															<p class="bg-primary">
																<span class="title-message"> Summer Vacation </span> <span
																	class="small pull-right"> 2017-06-27 </span>
															</p>
														</li>
														<li><p>Summer Vacation starts from June to 2nd
																week of July.</p></li>
													</ul>
												</div>

											</div>
										</div>


										<div id="student" class="tab-pane">
											<div class="notice-div">

												<div class="notice-info">
													<ul>
														<li>
															<p class="bg-primary">
																<span class="title-message"> Next Week Summer </span> <span
																	class="small pull-right"> 2017-08-15 </span>
															</p>
														</li>
														<li><p>Summer Exam will be conducted on Next
																week. All The Best!!!</p></li>
													</ul>
												</div>
												<div class="notice-info">
													<ul>
														<li>
															<p class="bg-primary">
																<span class="title-message"> Student exam form
																	fillup </span> <span class="small pull-right">
																	2017-07-07 </span>
															</p>
														</li>
														<li><p>All Students come and fill their exam
																forms</p></li>
													</ul>
												</div>

											</div>
										</div>


										<div id="staff" class="tab-pane">
											<div class="notice-div">

												<div class="notice-info">
													<ul>
														<li>
															<p class="bg-primary">
																<span class="title-message"> Monthly Report </span> <span
																	class="small pull-right"> 2017-07-02 </span>
															</p>
														</li>
														<li><p>All Staff have to submit their report on
																month end.</p></li>
													</ul>
												</div>
												<div class="notice-info">
													<ul>
														<li>
															<p class="bg-primary">
																<span class="title-message"> Attendance Report </span> <span
																	class="small pull-right"> 2017-07-28 </span>
															</p>
														</li>
														<li><p>All Staff collect their class wise
																attendance report.</p></li>
													</ul>
												</div>
												<div class="notice-info">
													<ul>
														<li>
															<p class="bg-primary">
																<span class="title-message"> Attendance Report </span> <span
																	class="small pull-right"> 2017-07-28 </span>
															</p>
														</li>
														<li><p>All Staff collect their class wise
																attendance report.</p></li>
													</ul>
												</div>

											</div>
										</div>

									</div>
								</div>
							</section>
						</div>
					</div>


					<div class="col-lg-5 news ">
						<div class="row">
							<div class="col-lg-12">

								<div class="panel panel-default">
									<div class="panel-heading">
										<span class="glyphicon glyphicon-list-alt"
											style="font-size: 15px;" aria-hidden="true"></span>&nbsp;News
									</div>
									<div class="panel-body news_pannel_body">
										<div class="danger">
											<p>
												<strong>Danger!</strong> This is a place of news. Lates news
												will be loaded here.
											</p>
										</div>

										<div class="success">
											<p>
												<strong>Danger!</strong> This is a place of news. Lates news
												will be loaded here.
											</p>
										</div>
										<div class="warning">
											<p>
												<strong>Danger!</strong> This is a place of news. Lates news
												will be loaded here.
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- =================================1st graph========================================= -->
				<br>
				<div class="row hidden-xs">
					<div class="col-lg-12 ">
						<!-- 1st garph -->
						<div class="col-lg-7 ">
						<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Graph Of Sotal Student</h4>
									<p class="category">Per Faculty</p>
								</div>
								<div class="content " >
									<div id="piechart1" style="background-color: white;"></div>
								</div>
							</div>
							</div>
							</div>
						</div>
						
						<div class="col-lg-5  ">
						<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Graph Of Average Pass Ratio</h4>
									<p class="category">Per Faculty</p>
								</div>
								<div class="content  " >
									<div id="piechart2" style="background-color: white;"></div>
								</div>
							</div>
							</div>
						</div>
						</div>
					</div>

				</div>


				<!-- =================================================================================== -->
			</div>
			<!--end row here  -->
		</div>
	</div>
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
				[ 'Task', 'Hours per Day' ], [ 'Science and Tech', 100 ], [ 'Management', 80 ],
				[ 'Arts', 40 ], [ 'Education', 20 ], [ 'Law', 15 ] ]);

		// Optional; add a title and set the width and height of the chart
		
		
		var options = {
			'width' : 618,
			'height' : 300
			
		};

		// Display the chart inside the <div> element with id="piechart"
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart1'));
		
		chart.draw(data, options);
	}
</script>


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
				[ 'Task', 'Hours per Day' ], [ 'Science and Tech', 100 ], [ 'Management', 80 ],
				[ 'Arts', 40 ], [ 'Education', 20 ], [ 'Law', 15 ] ]);

		// Optional; add a title and set the width and height of the chart
		
		
		var options = {
			'width' : 420,
			'height' : 300
			
		};

		// Display the chart inside the <div> element with id="piechart"
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart2'));
		
		chart.draw(data, options);
	}
</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script><!-- Muzi Budaa...yo chaii halna pardaina -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
</body>
</html>
