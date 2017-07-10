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
<!-- x-editable (bootstrap version) -->
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
					<div
						style="margin: 0px; padding: 0px; height: 35px; margin-bottom: 0px;">
						<div class="form-group col-sm-3" style="margin-bottom: 0px;">
							<select required class="form-control" id="p-faculty-box"
								name="faculty_id" onChange="load_program();">
							</select>
						</div>
						<div class="form-group col-sm-3" style="margin-bottom: 0px;">

							<select required class="form-control" id="p-program-box"
								name="program_id" onchange="load_batch_year();">
								<option value="" disabled selected>Select Programme</option>
							</select>
						</div>
						<div class="form-group col-sm-3" style="margin-bottom: 0px;">
							<select required class="form-control" name="batch_id"
								id="batch-box">
								<option value="" disabled selected>Select Batch</option>
							</select>
						</div>
						<div class="form-group col-sm-3" id="semester-batch"
							style="margin-bottom: 0px;">
							<select required class="form-control" id="Semester_box"
								name="Semester_box" disabled onchange="addBtnEnable();">
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
								class="fa fa-graduation-cap"></i> Add Exam result</span>
							<button class="btn btn-success pull-right" id="go"
								style="visibility: hidden;" onclick="load_student();">Go</button>
							<span class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Add result</span>
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
									<table class="table table-bordered" id="crud_table">
										<tr>
											<td>S.No</td>
											<td>Name</td>
											<td>Subject</td>
											<td class="hidden-xs">Exam Type</td>
											<td class="hidden-xs">Attendence</td>
											<td class="hidden-xs">FullMarks</td>
											<td class="hidden-xs">Scored</td>
											<td>Pass/Fail</td>
											<td>Exam ID</td>
										</tr>
										<tbody id="employee_data">
										<td data-name='student_name'  data-type='text' contenteditable="true" class="student_name">asdfasdf</td>
										</tbody>
										<!-- <tr>
											<td contenteditable="true" class="student_sn"></td>
											<td contenteditable="true" class="student_name"></td>
											<td contenteditable="true" class="student_subject"></td>
											<td contenteditable="true" class="student_examType"></td>
											<td contenteditable="true" class="student_attendence"></td>
											<td contenteditable="true" class="student_fullMarks"></td>
											<td contenteditable="true" class="student_score"></td>
											<td contenteditable="true" class="student_passFail"></td>
											<td contenteditable="true" class="exam_id"></td>

										</tr> -->
									</table>
									<div align="center">
										<button type="button" name="save" id="save"
											class="btn btn-info">Save</button>
									</div>
									<br />
									<div id="inserted_item_data"></div>
								</div>
								<div class="loader" id="loader" hidden style="margin-left: 40%;"></div>
							</div>


						</div>
					</div>
				</div>


				<!-- ======================end of exam type============= -->
			</div>
		</div>



		<!--=========================================================================================  -->
	</div>
</div>
<script>
	window.addEventListener("load", function() {
		load_faculty();
	}, true)
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
				document.getElementById("batch-box").innerHTML = return_data;
				document.getElementById("Semester_box").disabled = false;

			}
		}
		aj.send(idSend);
	}
	function addBtnEnable() {
		document.getElementById("go").style.visibility = "visible";
	}
	function load_student() {
		var facultyId = document.getElementById("p-faculty-box").value;
		var programId = document.getElementById("p-program-box").value;
		var batchNo = document.getElementById("batch-box").value;
		var semesterNo = document.getElementById("Semester_box").value;

		var url = "../ajax_diplayStudent_forNewResult";
		var idSend = "facultyId=" + facultyId + "&programId=" + programId
				+ "&batchNo=" + batchNo + "&semesterNo=" + semesterNo;
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var jSonObject = eval('(' + aj.responseText + ')');
				var i = jSonObject.length;
				alert(i);

				for ( var prop in jSonObject) {

					var item = jSonObject[prop];

					var table = document.getElementById("crud_table");
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

					cell1.innerHTML = '	<td contenteditable="true" class="student_sn">'
							+ i + '</td>';
					cell2.innerHTML = "<td data-name='student_name'  data-type='text' class='student_name'>"
							+ item.Name + "</td>";
							
					cell3.innerHTML = '<td contenteditable="true" class="student_subject">'
							+ "math" + '</td>';
					cell4.innerHTML = '<td contenteditable="true" class="student_examType">'
							+ "Regular" + '</td>';
					cell5.innerHTML = '<td contenteditable="true" class="student_attendence">'
							+ "present" + '</td>';
					cell6.innerHTML = '<td contenteditable="true" class="student_fullMarks">'
							+ 100+ '</td>';
							cell7.innerHTML =	'<td contenteditable="true" class="student_score">'
							+ 50 + '</td>';
					var passFailStatus = 0;
					if (passFailStatus === 0) {
						/*<i class="fa fa-sitemap"> <i class="fa fa-users">*/
						cell8.innerHTML = '	<td contenteditable="true" class="student_passFail"><span class="btn btn-sm btn-danger "> </i> &nbsp;&nbsp;Fail &nbsp;</span></td>';
					} else {
						cell8.innerHTML = '	<td contenteditable="true" class="student_passFail"><span class="btn btn-sm btn-warning "> </i> &nbsp;&nbsp;pass &nbsp;</span></td>';

					}
					cell9.innerHTML = '	<td contenteditable="true" class="exam_id">'+"Left"+'</td>';

					i--;
				}
			}
		}
		aj.send(idSend);

		/* alert("faultyID="+facultyId);
		alert("programId"+programId);
		alert("batchIdName"+batchNo);
		alert("semesterNo"+semesterNo); */

	}
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Muzi Budaa...yo chaii halna pardaina -->
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
