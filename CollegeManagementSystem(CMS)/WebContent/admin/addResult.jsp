<%@page import="com.model.ExamInfoModel"%>
<%@page import="com.serviceimpl.ExamInfoModelServiceImpl"%>
<%@page import="com.service.ExamInfoModelServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.model.ExamModel"%>
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
								name="Semester_box" disabled
								onchange="addBtnEnable();load_subject();">
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
				<div class="row with-border" style="overflow: hidden; height: 35px;">
					<div class="col-lg-12 ">
						<h3 style="margin: 0px;height: 35px;">
							<span class="hidden-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Add Exam result</span>
							<div class="form-group col-sm-3 col-sm-offset-3" style="margin-bottom: 0px;">
								<select required class="form-control"
									id="p-subject-box" name="subject_id" >
									<option value="" disabled selected>Select Subject</option>
								</select>
							</div>
							<div class="form-group col-sm-3" style="margin-bottom: 0px;">
								<select required class="form-control "
									id="p-examType-box" name="examtype_id" onclick="load_examType();">
									<option value="" disabled selected>Select exam Type</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
							<!-- style="visibility: hidden;" -->
							<button class="btn btn-success  btn-block" id="go"
								 onclick="load_student();">Search</button>
							</div>	 
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
										</tbody>
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
	function load_subject() {
		var programId = document.getElementById("p-program-box").value;
		var batchNo = document.getElementById("batch-box").value;
		var semesterNo = document.getElementById("Semester_box").value;

		var url = "../ajax_load_subject";
		var idSend = "programId=" + programId + "&batchNo=" + batchNo
				+ "&semesterNo=" + semesterNo;
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				
				document.getElementById("p-subject-box").innerHTML = return_data;

			}
		}
		aj.send(idSend);

	}
	
	function load_examType() {
		var subjectId = document.getElementById("p-subject-box").value;
		var url = "../ajax_examTypeNameLoad";
		var idSend = "subjectId="+subjectId;
		var aj = new XMLHttpRequest();
		alert("subjectId="+subjectId);
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				alert("datareturned="+return_data);
				document.getElementById("p-examType-box").innerHTML = return_data;

			}
		}
		aj.send(idSend);
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
				alert(jSonObject[0].Name);
				$("#crud_table").show();
				var content = '';
				for (var i = 0; i < jSonObject.length; i++) {
					content += '<tr>';
					content += '<td contenteditable="false" class="student_sn">'
							+ (i + 1) + '</td>';
					content += "<td data-pk="+jSonObject[i].studentId+" value="+jSonObject[i].studentId+" data-name=\"student_name\"  data-type=\"text\" class=\"student_name\">"
							+ jSonObject[i].Name + "</td>";

					content += '<td  class="student_subject">' + "math"
							+ '</td>';
					content += '<td  class="student_examType">' + "Regular"
							+ '</td>';
					content += '<td  data-name="student_attendence" data-type="select" class="student_attendence" data-pk="'+jSonObject[i].Name +'">'
							+ "present" + '</td>';
					content += '<td  class="student_fullMarks">' + 100
							+ '</td>';
					content += '<td  data-type="text" data-name="student_score" class="student_score"  ></td>';
					var passFailStatus = 0;
					if (passFailStatus === 0) {
						/*<i class="fa fa-sitemap"> <i class="fa fa-users">*/
						content += '	<td><span class="btn btn-sm btn-danger student_passFail" data-name="student_passFail" data-type="select"  data-pk="'+0+'"> </i> &nbsp;&nbsp;Fail &nbsp;</span></td>';
					} else {
						content += '	<td ><span class="btn btn-sm btn-warning student_passFail " data-name="student_passFail" data-type="select"   data-pk="'+1+'"> </i> &nbsp;&nbsp;pass &nbsp;</span></td>';

					}
					content += '<td  class="exam_id" data-name="student_attendence" data-type="select" class="student_attendence" data-pk="'+jSonObject[i].Name +'">'
							+ "Left" + '</td>';
					content += '<tr>';
					//i--;

				}
				$("#employee_data").html(content);
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
<script src="../Resources/js/bootstrap-editable.min.js"></script>
<script src="../Resources/js/dynamicTableJs.js"></script>
</body>
</html>


</body>
</html>
