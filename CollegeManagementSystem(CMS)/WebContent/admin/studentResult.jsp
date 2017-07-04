<%@page import="com.model.ExamInfoModel"%>
<%@page import="com.serviceimpl.ExamInfoModelServiceImpl"%>
<%@page import="com.service.ExamInfoModelServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ExamModel"%>
<%@page import="java.util.List"%>
<%@page import="com.serviceimpl.ExamModelServiceImpl"%>
<%@page import="com.service.ExamModelServiceInterface"%>
<link href="../Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="../Resources/font-awesome/css/font-awesome.min.css">
<link href="../Resources/css/manageExam.css" rel="stylesheet"
	type="text/css">

<jsp:include page="admin-header.jsp" />


<div class="container-fluid display-table">
	<div class="row display-table-row">

		<jsp:include page="admin-sidemenu.jsp" />


		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

			<ol class="breadcrumb">
				<li><a href="admin-dashboard.jsp"><span
						class="glyphicon glyphicon-home"> Home</span></a></li>
				<li><a><span class="glyphicon glyphicon-education black">
							Student</span></a></li>
				<li><a><span class="glyphicon glyphicon-education black">
							Result</span></a></li>
			</ol>


			<!--=============================================Main Containt===============================  -->

			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<button type="button" class="btn btn-info pull-right" id="qqq"
							data-toggle="modal" data-target=#add_exam_modal-info>
							Result</button>

					</h3>

				</div>
			</div>

			<!--====================================================Table==================================================================  -->
			<div class="box box-primary with-border" style="margin-top: 10px;">
				<div class="row with-border" style="overflow: hidden;">
					<div class="col-lg-12 ">
						<h3 style="margin: 0px; padding-left: 20px; height: 35px;">
							<span class="hidden-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Manage Exam result</span> <span
								class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Exam result</span>
						</h3>
					</div>
				</div>


				<!-- Regular exam -->
				<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">
						<div class="panel box box-default">
							<div class="box-header with-border">
								<br>
								<div class="table-responsive">
									<table class="table table-hover" id="tblResult">
										<thead>
											<tr>
												<td>S.No</td>
												<td>Name</td>
												<td>Subject</td>
												<td class="hidden-xs">Exam Type</td>
												<td class="hidden-xs">FullMarks</td>
												<td class="hidden-xs">Scored</td>
												<td>Pass/Fail</td>
												<td class="hidden-xs">Faculty</td>
											</tr>
										</thead>
										
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- ======================end of exam type============= -->


				<!--=========================================================================================  -->

			</div>


			<!-- /.box-group -->
		</div>



		<div id="delete" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form action="../delete_Exam_info" method="Post">
						<div class="modal-body">
							<h3>
								Are you sure you want to delete this item? <br> <strong"></strong>
							</h3>
						</div>
						<div class="modal-footer">
							<input type=hidden name="deleteId" id="deleteId12">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-success">Delete</button>
						</div>
					</form>
				</div>

			</div>
		</div>
		<!--=========================================================================================  -->
	</div>
</div>
<script type="text/javascript">
	window.addEventListener('load', function() {
		loadAllResult();
	}, true);

	function loadAllResult() {
		var url = "../ajax_result_load";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {

				var jSonObject = eval('(' + aj.responseText + ')');
				//alert("mausam="+jSonObject.StudentName);
				var i = jSonObject.length;

				for ( var prop in jSonObject) {

					var item = jSonObject[prop];

					var table = document.getElementById("tblResult");
					var row = table.insertRow(1);

					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
					var cell6 = row.insertCell(5);
					var cell7 = row.insertCell(6);
					var cell8 = row.insertCell(7);
					var cell9 = row.insertCell(8);

					cell1.innerHTML = i;
					cell2.innerHTML = item.StudentName;
					cell3.innerHTML = item.subjectName;
					cell4.innerHTML = item.examTypeName;
					cell5.innerHTML = item.fullMarks;
					cell6.innerHTML = item.examMarksByStudent;
					var passFailStatus=item.passFailStatus;
					if(passFailStatus===0){
						cell7.innerHTML = '<span class="btn btn-sm btn-danger "> <i class="fa fa-sitemap"></i> Pass &nbsp;</span>';	
					}else{
					cell7.innerHTML = '<span class="btn btn-sm btn-warning "> <i class="fa fa-sitemap"></i> Pass &nbsp;</span>';
					}
					cell8.innerHTML = '<span class="btn btn-sm btn-info  hidden-xs"> <i class="fa fa-users"></i> BE-Computer &nbsp; </span>';
					cell9.innerHTML = '<a href='+item.resultId+' value='+item.resultId+' class="btn-sm btn btn-default" title="View Exam Details" data-toggle="modal" data-target=p><i class="fa fa-eye"></i></a><a href='+item.resultId+' value='+item.resultId+'  class="btn-sm btn btn-default" data-toggle="modal" data-target=# title="EditCourseDetails"><i class="fa fa-pencil-square-o"></i></a>	<a href='+item.resultId+' value='+item.resultId+' class="btn-sm btn btn-default" data-toggle="modal" data-target=# title="Delete" data-method="post"><i class="fa fa-trash-o"></i></a>';
							
					i--;
				}

			}
		}
		aj.send();
	}
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Muzi Budaa...yo chaii halna pardaina -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>



</body>
</html>


</body>
</html>
