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
<link href="../Resources/css/bootstrap-editable.css" rel="stylesheet" />
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

						<a href="addResult.jsp"><button type="button"
								class="btn btn-info pull-right" id="qqq" data-toggle="modal"
								data-target=#add_exam_modal-info>Add Result</button></a>
						<button id="seacrchBtnClicked" type="button" class="btn btn-info"
							style="float: left; margin-left: -20px;" data-toggle="modal"
							data-target=#searchModal onclick="searchBtn();">
							<span class="glyphicon glyphicon-search"></span> Result Search
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
										name="searchIteam" onchange="searcheOption(); ">
										<option value="" disabled selected>Select</option>
										<option value="Name">Name</option>
										<option value="Batch">Batch</option>
										<option value="Id">Id</option>
										<option value="Email">Email</option>
										<option value="Pass/Fail">Pass/Fail</option>
										<option value="Subject">Subject</option>
									</select>
								</div>

								<!-- For Batch -->
								<div class="form-group col-sm-6" id="semester-batch" hidden>
									<select required class="form-control" name="batch_id"
										id="batch-box1">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box1"
										name="Semester_box" onclick="load_exam_type();">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select> <select required class="form-control" id="examType-box"
										name="examType_id">
										<option value="" disabled selected>Select Exam Type</option>
									</select>
								</div>

								<!--Pass fail  -->
								<div class="form-group col-sm-6" id="fass-fail-semester" hidden>
									<select class="form-control" id="batch-box2" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box2"
										name="Semester_box" onclick="load_exam_type();">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>

									</select> <select required class="form-control" id="examType-boxPass"
										name="examType_idPass">
										<option value="" disabled selected>Select Exam Type</option>
									</select> <select required class="form-control" id="pass_fail_box"
										name="pass_fail_box">
										<option value="" disabled selected>Select Pass/Fail</option>
										<option value="1">Pass</option>
										<option value="0">Fail</option>
									</select>
								</div>

								<!--subject  -->
								<div class="form-group col-sm-6" id="subject-semester" hidden>
									<select class="form-control" id="batch-box4" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box4"
										name="Semester_box" onclick="load_exam_type();">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select> <select required class="form-control" id="examType-boxSubject"
										name="examType_idSubject" onchange="load_subject();">
										<option value="" disabled selected>Select Exam Type</option>
									</select> <select required class="form-control"
										id="subject-semester-box" name="subject-semester-box">
										<option value="" disabled selected>Select Subject</option>
									</select>
								</div>

								<!-- Name email id marks -->
								<div class="form-group col-sm-6" id="name-email-marks" hidden>
									<select class="form-control" id="batch-box5" name="batch_id">
										<option value="" disabled selected>Select Batch</option>
									</select> <select required class="form-control" id="Semester_box5"
										name="Semester_box" onclick="load_exam_type();">
										<option value="" disabled selected>Select Semester</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select> <select required class="form-control" id="examType-box5"
										name="examType_id5">
										<option value="" disabled selected>Select Exam Type</option>
									</select> <input type="text" class="form-control"
										name="searchedEnteredField" id="searchedEnteredField"
										placeholder="Enter Name/Email/ID">
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success"
									onclick="loadResult();" data-dismiss="modal">Search</button>
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
										<button   type="button"  id="sucessFulBtn" class="btn btn-warning center-block hidden ">Updated</button>
										<button   type="button"  id="unsucessfulBtn" class="btn btn-warning center-block hidden ">Error in update</button>
										<span class="glyphicon glyphicon-info-sign text-success pull-right " style="margin-right:10px;margin-top: 4px;cursor:pointer " data-toggle="modal" data-target="#infoModal"></span>
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
												<td class="hidden-xs">PassMarks</td>
												<td class="hidden-xs">Scored</td>
												<td class="hidden-xs">Attendence</td>
												<td>Pass/Fail</td>

											</tr>
										<tbody id="result_data">
										</tbody>
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
		
		
		<div class="modal fade" id="infoModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Information</h4>
        </div>
        <div class="modal-body">
          <p>Only</p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;1.Score</p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;2.Attendence</p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;3.Pass/Fail</p>
          <p>Are updatable.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
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

	function loadResult() {
		var searchFilter = document.getElementById("searchIteam").value;
		alert("searchFilter=" + searchFilter);
		var semesterID;
		if (searchFilter === 'Batch') {
			var facultyId = document.getElementById("p-faculty-box").value;
			var programId = document.getElementById("p-program-box").value;
			var batchNo = document.getElementById("batch-box1").value;
			var semesterNo = document.getElementById("Semester_box1").value;
			var examTypeId = document.getElementById("examType-box").value;

			var idSend = "programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo;

			semesterID = getSemesterId(idSend);

			var send = "&programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo + "&facultyId=" + facultyId
					+ "&examTypeId=" + examTypeId + "&semesterID=" + semesterID
					+ "&searchFilter=" + searchFilter;

			var url = "../ajax_result_load_by_Batch";
			var arr = [ url, send ];
			loadResults(arr);
		} else if (searchFilter === 'Name' || searchFilter === 'Id'
				|| searchFilter === 'Email') {

			var facultyId = document.getElementById("p-faculty-box").value;
			var programId = document.getElementById("p-program-box").value;
			var batchNo = document.getElementById("batch-box5").value;
			var semesterNo = document.getElementById("Semester_box5").value;
			var examTypeId = document.getElementById("examType-box5").value;
			var enterField = document.getElementById("searchedEnteredField").value;

			var idSend = "programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo;
			semesterID = getSemesterId(idSend);

			var send = "&programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo + "&facultyId=" + facultyId
					+ "&examTypeId=" + examTypeId + "&enterField=" + enterField
					+ "&semesterID=" + semesterID;

			var url = "../ajax_result_load_by_nameEmailMarksId";
			var arr = [ url, send ];
			loadResults(arr);
		} else if (searchFilter === 'Pass/Fail') {
			var facultyId = document.getElementById("p-faculty-box").value;
			var programId = document.getElementById("p-program-box").value;
			var batchNo = document.getElementById("batch-box2").value;
			var semesterNo = document.getElementById("Semester_box2").value;
			var examTypeId = document.getElementById("examType-boxPass").value;
			var pass_fail = document.getElementById("pass_fail_box").value;
			var idSend = "programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo;
			semesterID = getSemesterId(idSend);

			var send = "&programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo + "&facultyId=" + facultyId
					+ "&examTypeId=" + examTypeId + "&semesterID=" + semesterID
					+ "&pass_fail=" + pass_fail;

			var url = "../ajax_result_load_by_passFail";
			var arr = [ url, send ];
			loadResults(arr);
		} else if (searchFilter === 'Subject') {
			var facultyId = document.getElementById("p-faculty-box").value;
			var programId = document.getElementById("p-program-box").value;
			var batchNo = document.getElementById("batch-box4").value;
			var semesterNo = document.getElementById("Semester_box4").value;

			var examTypeId = document.getElementById("examType-boxSubject").value;
			var subjectID = document.getElementById("subject-semester-box").value;

			var idSend = "programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo;
			semesterID = getSemesterId(idSend);
			var send = "&programId=" + programId + "&batchNo=" + batchNo
					+ "&semesterNo=" + semesterNo + "&facultyId=" + facultyId
					+ "&examTypeId=" + examTypeId + "&semesterID=" + semesterID
					+ "&subjectID=" + subjectID;

			var url = "../ajax_result_load_by_subject";
			var arr = [ url, send ];
			loadResults(arr);

		}
	}
	function getSemesterId(idSend) {
		var output;
		var url = "../ajax_getSemesterId";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, false);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;

				output = return_data;

			}
		}
		aj.send(idSend);
		return output;
	}
	function loadResults(arr) {

		var table = document.getElementById("tblResult");
		var tableHeaderRowCount = 1;
		var rowCount = table.rows.length;
		for (var i = tableHeaderRowCount; i < rowCount; i++) {
			table.deleteRow(tableHeaderRowCount);
		}
		document.getElementById("loader").hidden = false;

		var aj = new XMLHttpRequest();
		aj.open("POST", arr[0], true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				document.getElementById("loader").hidden = true;
				var jSonObject = eval('(' + aj.responseText + ')');
				//alert(jSonObject);

				var content = '';
				for (var i = 0; i < jSonObject.length; i++) {
					content += '<tr>';
					content += '<td  value='+jSonObject[i].student_id+' class="student_sn">'
							+ (i + 1) + '</td>';
					content += "<td value="+jSonObject[i].exam_id+" data-name=\"student_name\"  data-type=\"text\" class=\"student_name\" id='student_name'>"
							+ jSonObject[i].StudentName + "</td>";

					content += '<td  class="student_subject">'
							+ jSonObject[i].subjectName + '</td>';
					content += '<td  class="student_examType">'
							+ jSonObject[i].ExamType + '</td>';
					content += '<td  class="student_fullMarks">'
							+ jSonObject[i].FullMarks + '</td>';
					content += '<td  class="student_passMarks">'
							+ jSonObject[i].passMarks + '</td>';
					content += '<td  class="student_score">'
							+ jSonObject[i].ScoredMarks + '</td>';

					var isAttended = jSonObject[i].is_attended;
					var isAttendedString;
					if (isAttended === 0) {
						isAttendedString="Absent";
					}else if(isAttended === 1){
						isAttendedString="Present";
					}
					content += '<td value='+isAttended+' data-type="select" class="student_attendence" >'
							+ isAttendedString + '</td>';
					var passFailStatus = jSonObject[i].PassFailStatus;
					if (passFailStatus === 0) {
						/*<i class="fa fa-sitemap"> <i class="fa fa-users">*/
						content += '	<td value='+passFailStatus+'><span  class="btn btn-sm btn-danger student_passFail" data-name="student_passFail" data-type="select"  data-pk="'+0+'"> </i> &nbsp;&nbsp; Fail &nbsp;</span></td>';
					} else {
						content += '	<td value='+passFailStatus+'><span  class="btn btn-sm btn-warning student_passFail " data-name="student_passFail" data-type="select"   data-pk="'+1+'"> </i> &nbsp;&nbsp;Pass &nbsp;</span></td>';

					}

					content += '<tr>';
				}
				$("#result_data").html(content);
			}
		}
		aj.send(arr[1]);
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
				|| searchedOption === "Email") {
			document.getElementById("name-email-marks").hidden = false;
			load_batch_year();
			document.getElementById("semester-batch").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
			
			document.getElementById("subject-semester").hidden = true;
		} else if (searchedOption === "Batch") {
			document.getElementById("semester-batch").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
			
			document.getElementById("subject-semester").hidden = true;

		} else if (searchedOption === "Pass/Fail") {
			document.getElementById("fass-fail-semester").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("semester-batch").hidden = true;
			
			document.getElementById("subject-semester").hidden = true;

		} else if (searchedOption === "Subject") {
			document.getElementById("subject-semester").hidden = false;
			load_batch_year();
			document.getElementById("name-email-marks").hidden = true;
			document.getElementById("semester-batch").hidden = true;
			document.getElementById("fass-fail-semester").hidden = true;
		
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
				document.getElementById("batch-box5").innerHTML = return_data;
				document.getElementById("batch-box2").innerHTML = return_data;
				document.getElementById("batch-box4").innerHTML = return_data;

			}
		}
		aj.send(idSend);
	}
	function load_exam_type() {
		var id = document.getElementById("examType-box").value;
		var url = "../ajax_examType_load";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;

				document.getElementById("examType-box5").innerHTML = return_data;
				document.getElementById("examType-box").innerHTML = return_data;

				document.getElementById("examType-boxPass").innerHTML = return_data;
				document.getElementById("examType-boxSubject").innerHTML = return_data;

			}
		}
		aj.send(id);
	}
	function load_subject() {
		var programId = document.getElementById("p-program-box").value;
		var batchNo = document.getElementById("batch-box4").value;
		var semesterNo = document.getElementById("Semester_box4").value;

		var idSend = "programId=" + programId + "&batchNo=" + batchNo
				+ "&semesterNo=" + semesterNo;
		var url = "../ajax_load_subject";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				document.getElementById("subject-semester-box").innerHTML = return_data;

				//alert(return_data);
			}
		}
		aj.send(idSend);

	}
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>
<script src="../Resources/js/bootstrap-editable.min.js"></script>
<script src="../Resources/js/dynamicTableJs.js"></script>


</body>
</html>


</body>
</html>
