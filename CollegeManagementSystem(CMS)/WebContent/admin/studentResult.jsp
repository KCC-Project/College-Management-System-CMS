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
							Add Result</button>
						<button id="seacrchBtnClicked" type="button" class="btn btn-info"
							style="float: left; margin-left: -20px;" data-toggle="modal"
							data-target=#searchModal onclick="searchBtn();">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
					</h3>
				</div>

			</div>

			<!--=======================================Rearching ================================ -->
			<div class="modal fade" id="searchModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Searching</h4>

						</div>

						<div class="modal-body">
							<div class="row">
								<div class="form-group col-sm-6">
									<select required class="form-control" id="p-faculty-box"
										name="faculty_id" onChange="load_program();">
									</select>
								</div>
								<div class="form-group col-sm-6">
									<select required class="form-control" id="p-program-box"
										name="program_id">
										<option value="" disabled selected>Select Programme</option>
									</select>
								</div>
							</div>
							<div class="row">
								<p>
									<button class="w3-button w3-block w3-teal">Searched By</button>
								</p>
								<div class="form-group col-sm-6">
									<select required class="form-control" id="searchIteam"
										name="searchIteam" onchange="searcheOption();">
										<option value="" disabled selected>Select</option>
										<option value="Name">Name</option>
										<option value="Batch">Batch</option>
										<option value="Id">Id</option>
										<option value="Email">Email</option>
										<option value="Marks">Marks</option>
										<option value="Pass/Fail">Pass/Fail</option>
										<option value="Exam Type">Exam Type</option>
										<option value="Subject">Subject</option>
									</select>
								</div>
								<div class="form-group col-sm-6" id="semester-batch" hidden>
									<select required class="form-control" name="batch_id"
										id="batch-box1">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box1"
										name="Semester_box">
										<option value="" disabled selected>Select Semester</option>
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select>
								</div>


								<div class="form-group col-sm-6" id="fass-fail-semester" hidden>
									<select class="form-control" id="batch-box2" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box2"
										name="Semester_box">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>

									</select> <select required class="form-control" id="pass_fail_box"
										name="pass_fail_box">
										<option value="" disabled selected>Select Pass/Fail</option>
									</select>
								</div>


								<div class="form-group col-sm-6" id="exam_type-semester" hidden>
									<select class="form-control" id="batch-box3" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box3"
										name="Semester_box">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select> <select required class="form-control"
										id="exam_type_semester_box" name="exam_type_semester_box">
										<option value="" disabled selected>Select Exam Type</option>
									</select>
								</div>


								<div class="form-group col-sm-6" id="subject-semester" hidden>
									<select class="form-control" id="batch-box4" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box4"
										name="Semester_box">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select> <select required class="form-control"
										id="subject-semester-box" name="subject-semester-box">
										<option value="" disabled selected>Select Subject</option>
									</select>
								</div>


								<div class="form-group col-sm-6" id="name-email-marks" hidden>
									<select class="form-control" id="batch-box5" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box5"
										name="Semester_box">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select> <input type="text" class="form-control"
										name="searchedEnteredField" id="searchedEnteredField"
										placeholder="Enter Name/Email/Marks/ID">
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success"
									onclick="loadAllResult();" data-dismiss="modal">Search</button>
							</div>
						</div>



					</div>

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
												<td class="hidden-xs">Program</td>
											</tr>

										</thead>
										
									</table>
								</div>
								<div class="loader" id="loader" hidden style="margin-left: 40%;"></div>
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
	function searchBtn() {
		load_faculty();
	}

	function loadAllResult() {
		var table = document.getElementById("tblResult");
		var tableHeaderRowCount = 1;
		var rowCount = table.rows.length;
		//alert(rowCount);
		for (var i = tableHeaderRowCount; i < rowCount; i++) {
			table.deleteRow(tableHeaderRowCount);
		}
		document.getElementById("loader").hidden=false;
		var facultyId = document.getElementById("p-faculty-box").value;
		var programId = document.getElementById("p-program-box").value;
		var batchIdName = document.getElementById("batch-box5").value;
		var batchIdName = document.getElementById("batch-box4").value;
		var batchIdName = document.getElementById("batch-box3").value;
		var batchIdName = document.getElementById("batch-box2").value;
		var batchIdName = document.getElementById("batch-box1").value;
		var semesterIdName = document.getElementById("Semester_box5").value;
		var semesterIdName = document.getElementById("Semester_box4").value;
		var semesterIdName = document.getElementById("Semester_box3").value;
		var semesterIdName = document.getElementById("Semester_box2").value;
		var semesterIdName = document.getElementById("Semester_box1").value;
		var nameIdEmailMarks = document.getElementById("searchedEnteredField").value;

		alert(batchIdName);
		//var send="facultyId="+facultyId+"programId="+programId+"batchIdName="+batchIdName+"semesterIdName="+semesterIdName+"nameIdEmailMarks="+nameIdEmailMarks;
		var send = "nameIdEmailMarks=" + nameIdEmailMarks+"&programId="+programId+"&batchIdName="+batchIdName+"&semesterIdName="+semesterIdName+"&facultyId="+facultyId;
		var url = "../ajax_result_load";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				document.getElementById("loader").hidden=true;
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
					var passFailStatus = item.passFailStatus;
					if (passFailStatus === 0) {
						 /*<i class="fa fa-sitemap"> <i class="fa fa-users">*/
						cell7.innerHTML = '<span class="btn btn-sm btn-danger "> </i> &nbsp;&nbsp;Fail &nbsp;</span>';
					} else {
						cell7.innerHTML = '<span class="btn btn-sm btn-warning "></i> Pass &nbsp;</span>';
					}
					cell8.innerHTML = '<span class="btn btn-sm btn-info  hidden-xs"> </i>'+item.programName+'&nbsp; </span>';
					cell9.innerHTML = '<a href='+item.resultId+' value='+item.resultId+' class="btn-sm btn btn-default" title="View Exam Details" data-toggle="modal" data-target=p><i class="fa fa-eye"></i></a><a href='+item.resultId+' value='+item.resultId+'  class="btn-sm btn btn-default" data-toggle="modal" data-target=# title="EditCourseDetails"><i class="fa fa-pencil-square-o"></i></a>	<a href='+item.resultId+' value='+item.resultId+' class="btn-sm btn btn-default" data-toggle="modal" data-target=# title="Delete" data-method="post"><i class="fa fa-trash-o"></i></a>';

					i--;
				}

			}
		}
		aj.send(send);
	}

	function load_faculty() {
		var getid = event.target.id;
		var url = "../ajax_faculty_load";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");

		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				if (getid == "modal-box" || getid == "faculty-box") {
					document.getElementById("faculty-box").innerHTML = return_data;
				} else {
					document.getElementById("p-faculty-box").innerHTML = return_data;
				}

			}
		}
		aj.send();
	}

	function load_program() {
		var getid = event.target.id;
		if (getid == "faculty-box") {
			var id = document.getElementById("faculty-box").value;
		} else {
			var id = document.getElementById("p-faculty-box").value;
		}
		var url = "../aja";
		var idSend = "id=" + id;
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				if (getid == "faculty-box") {
					document.getElementById("program-box").innerHTML = return_data;
				} else {
					document.getElementById("p-program-box").innerHTML = return_data;
				}
			}
		}
		aj.send(idSend);
	}
	function searcheOption() {
		var searchedOption = document.getElementById("searchIteam").value;
		if (searchedOption === "Name" || searchedOption === "Id"
				|| searchedOption === "Email" || searchedOption === "Marks") {
			document.getElementById("name-email-marks").hidden = false;
			load_batch_year();
			document.getElementById("semester-batch").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
			document.getElementById("exam_type-semester").hidden = true;
			document.getElementById("subject-semester").hidden = true;
		} else if (searchedOption === "Batch") {
			document.getElementById("semester-batch").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
			document.getElementById("exam_type-semester").hidden = true;
			document.getElementById("subject-semester").hidden = true;

		} else if (searchedOption === "Pass/Fail") {
			document.getElementById("fass-fail-semester").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("semester-batch").hidden = true;
			document.getElementById("exam_type-semester").hidden = true;
			document.getElementById("subject-semester").hidden = true;

		} else if (searchedOption === "Exam Type") {
			document.getElementById("exam_type-semester").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("semester-batch").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
			document.getElementById("subject-semester").hidden = true;

		} else if (searchedOption === "Subject") {
			document.getElementById("subject-semester").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("semester-batch").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
			document.getElementById("exam_type-semester").hidden = true;
		}
	}

	function load_batch_year() {

		var url = "../ajax_year_load";
		var idSend = "id=1";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				document.getElementById("batch-box1").innerHTML = return_data;
				document.getElementById("batch-box2").innerHTML = return_data;
				document.getElementById("batch-box3").innerHTML = return_data;
				document.getElementById("batch-box4").innerHTML = return_data;
				document.getElementById("batch-box5").innerHTML = return_data;
			}
		}
		aj.send(idSend);
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
