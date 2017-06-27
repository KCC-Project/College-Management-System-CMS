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


				<!-- General notice start from here -->
				<section class="col-lg-7 connectedSortable  ">

					<div class="nav-tabs-custom">
						<!-- .nav-tabs-custom -->
						<!-- Tabs within a box -->
						<ul class="nav nav-tabs pull-right">
							<li class=""><a href="#emp-notice" data-toggle="tab"
								aria-expanded="false">Employee</a></li>
							<li class=""><a href="#stu-notice" data-toggle="tab"
								aria-expanded="false">Student</a></li>
							<li class="active"><a href="#all-notice" data-toggle="tab"
								aria-expanded="true">General</a></li>
							<li class="pull-left header" style=""><i class="fa fa-inbox"></i>Notice
								Board</li>
						</ul>
						<div class="slimScrollDiv"
							style="position: relative; overflow: hidden; width: auto; height: 300px;">
							<div class="tab-content"
								style="overflow: hidden; width: auto; height: 300px;">
								<!-- Notice -->
								<div class="tab-pane active" id="all-notice">

									<div class="notice-main bg-light-blue">
										<div class="notice-disp-date">
											<small class="label label-success"><i
												class="fa fa-calendar"></i> 30-05-2015</small>
										</div>
										<div class="notice-body">
											<div class="notice-title">
												<a class="noticeModalLink" href="#" style="color: #FFF"
													data-value="/EduSec 4.2.6 is released (security fix)/EduSec-EduSec-e90fa70/index.php?r=dashboard%2Fnotice%2Fview-popup&amp;id=3">Summer
													Vacation</a>&nbsp;
											</div>
											<div class="notice-desc">Summer Vacation starts from
												June to 2nd week of July.</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="stu-notice">

									<div class="notice-main bg-aqua">
										<div class="notice-disp-date">
											<small class="label label-success"><i
												class="fa fa-calendar"></i> 01-06-2015</small>
										</div>
										<div class="notice-body">
											<div class="notice-title">
												<a class="noticeModalLink" href="#" style="color: #FFF"
													data-value="/EduSec 4.2.6 is released (security fix)/EduSec-EduSec-e90fa70/index.php?r=dashboard%2Fnotice%2Fview-popup&amp;id=1">Next
													Week Summer Exam </a>&nbsp;
											</div>
											<div class="notice-desc">summer Exam will be conducted
												on Next week. All The Best</div>
										</div>
									</div>
									<div class="notice-main bg-aqua">
										<div class="notice-disp-date">
											<small class="label label-success"><i
												class="fa fa-calendar"></i> 25-05-2015</small>
										</div>
										<div class="notice-body">
											<div class="notice-title">
												<a class="noticeModalLink" href="#" style="color: #FFF"
													data-value="/EduSec 4.2.6 is released (security fix)/EduSec-EduSec-e90fa70/index.php?r=dashboard%2Fnotice%2Fview-popup&amp;id=5">Exam
													From Fill</a>&nbsp;
											</div>
											<div class="notice-desc">All Students come and fill
												their exam forms</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="emp-notice">

									<div class="notice-main bg-teal">
										<div class="notice-disp-date">
											<small class="label label-success"><i
												class="fa fa-calendar"></i> 05-06-2015</small>
										</div>
										<div class="notice-body">
											<div class="notice-title">
												<a class="noticeModalLink" href="#" style="color: #FFF"
													data-value="/EduSec 4.2.6 is released (security fix)/EduSec-EduSec-e90fa70/index.php?r=dashboard%2Fnotice%2Fview-popup&amp;id=2">Monthly
													Report</a>&nbsp;
											</div>
											<div class="notice-desc">All Employee have to submit
												their report on month end.</div>
										</div>
									</div>
									<div class="notice-main bg-teal">
										<div class="notice-disp-date">
											<small class="label label-success"><i
												class="fa fa-calendar"></i> 29-05-2015</small>
										</div>
										<div class="notice-body">
											<div class="notice-title">
												<a class="noticeModalLink" href="#" style="color: #FFF"
													data-value="/EduSec 4.2.6 is released (security fix)/EduSec-EduSec-e90fa70/index.php?r=dashboard%2Fnotice%2Fview-popup&amp;id=4">Attendance
													Report</a>&nbsp;
											</div>
											<div class="notice-desc">All Employees collect their
												class wise attendance report</div>
										</div>
									</div>
								</div>
							</div>
							<div class="slimScrollBar"
								style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 300px;"></div>
							<div class="slimScrollRail"
								style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
						</div>
						<!--  /.tab-content -->
					</div>

				</section>
				<!-- GEnaral notice end here -->

				<!--all running courses start here  -->
				<section class="col-lg-5 connectedSortable border">
				
				
<div id="piechart"></div>
				</section>
				<!-- courses Ends herer -->
				
				
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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  ['Work', 8],
  ['Eat', 2],
  ['TV', 4],
  ['Gym', 2],
  ['Sleep', 8]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'My Average Day', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
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
