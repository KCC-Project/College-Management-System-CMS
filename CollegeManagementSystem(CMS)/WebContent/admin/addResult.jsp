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
						<button type="button" class="btn btn-info pull-right" id="qqq"
							data-toggle="modal" data-target=#filterModal>Add Filter</button>
					</div>
				</div>

			</div>



			<!--====================================================Table==================================================================  -->
			<div class="box box-primary with-border" style="margin-top: 10px;">
				<div class="row with-border" style="overflow: hidden; height: 35px;">
					<div class="col-lg-12 ">
						<h3 style="margin: 0px; height: 35px;">
							<span class="hidden-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Add Exam result</span> <span
								class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Add result</span>
						</h3>
					</div>
				</div>


				<!--=======================================Rearching ================================ -->
				<div class="modal fade" id="filterModal" role="dialog">
					<div class="modal-dialog modal-lg">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Result Add Filter</h4>

							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col-sm-12">
									<div class="col-sm-3">
										<div class="form-group " style="margin-bottom: 0px;">
											<select required class="form-control" id="p-faculty-box"
												name="faculty_id" onChange="load_program();" onclick="onClick();">
											</select>
										</div>
										</div>
										<div class="form-group col-sm-3" style="margin-bottom: 0px;">

											<select required class="form-control" id="p-program-box"
												name="program_id" onchange="load_batch_year();" onclick="onClick1();" disabled>
												<option value="" disabled selected>Select Programme</option>
											</select>
										</div>
										<div class="form-group col-sm-3" style="margin-bottom: 0px;">
											<select required class="form-control" name="batch_id"
												id="batch-box" disabled onclick="onClick2();">
												<option value="" disabled selected>Select Batch</option>
											</select>
										</div>
										<div class="form-group col-sm-3" id="semester-batch"
											style="margin-bottom: 0px;">
											<select required class="form-control" id="Semester_box"
												name="Semester_box" disabled
												onchange="load_subject();" onclick="onClick3();">
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
									<div class="row">
										<div class="col-sm-12" style="margin-top: 10px;">
											<div class="form-group col-sm-6 " style="margin-bottom: 0px;margin-bottom: 10px;">
												<select required class="form-control" id="p-subject-box"
													name="subject_id" onchange="load_examType();" onclick="onClick4();"disabled>
													<option value="" disabled selected>Select Subject</option>
												</select>
											</div>
											<div class="form-group col-sm-6" style="margin-bottom: 0px;">
												<select required class="form-control " id="p-examType-box" disabled
													name="examtype_id" onclick="onClick5();">
													<option value="" disabled selected>Select exam
														Type</option>
												</select>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-success"
										onclick="load_student();" id="searchbtnClicked" disabled data-dismiss="modal">Search</button>
								</div>
							</div>



						</div>

					</div>
				</div>

				<!--=================================================================  -->

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
											<td class="hidden-xs">FullMarks</td>
											<td class="hidden-xs">Passmarks</td>
											<td class="hidden-xs">Attendence</td>
											<td class="hidden-xs">Scored</td>
											<td>Pass/Fail</td>
											<td hidden>Exam ID</td>
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
	function onClick() {
		document.getElementById("p-program-box").disabled = false;
	}
	
	function onClick1() {
		document.getElementById("batch-box").disabled = false;
	}
	function onClick2() {
		document.getElementById("Semester_box").disabled = false;
	}
	function onClick3() {
		document.getElementById("p-subject-box").disabled = false;
	}
	function onClick4() {
		document.getElementById("p-examType-box").disabled = false;
	}
	function onClick5() {
		document.getElementById("searchbtnClicked").disabled = false;
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
			}
		}
		aj.send(idSend);
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
		var idSend = "subjectId=" + subjectId;
		var aj = new XMLHttpRequest();
		//alert("subjectId="+subjectId);
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
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

		var examId = document.getElementById("p-examType-box").value;

		var url = "../ajax_diplayStudent_forNewResult";
		var idSend = "facultyId=" + facultyId + "&programId=" + programId
				+ "&batchNo=" + batchNo + "&semesterNo=" + semesterNo
				+ "&examId=" + examId;
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var jSonObject = eval('(' + aj.responseText + ')');
				//var i = jSonObject.length;
				//alert(jSonObject.StudentInfo[0].Name);
				$("#crud_table").show();
				var content = '';
				for (var i = 0; i < jSonObject.StudentInfo.length; i++) {
					//alert("inside");
					//alert("Student anme=" + jSonObject.StudentInfo[i].Name);
					content += '<tr>';
					content += '<td contenteditable="false" class="student_sn">'
							+ (i + 1) + '</td>';
					content += "<td data-pk="+jSonObject.StudentInfo[i].studentId+" value="+jSonObject.StudentInfo[i].studentId+" data-name=\"student_name\"  data-type=\"text\" class=\"student_name\" id='student_name'>"
							+ jSonObject.StudentInfo[i].Name + "</td>";

					content += '<td  class="student_subject">'
							+ jSonObject.ExamInfo[0].SubjectName + '</td>';
					content += '<td  class="student_examType">'
							+ jSonObject.ExamInfo[0].ExamtypeName + '</td>';
					content += '<td  class="student_fullMarks">'
							+ jSonObject.ExamInfo[0].FullMarks + '</td>';
					content += '<td  class="student_passmarks">'
							+ jSonObject.ExamInfo[0].PassMarks + '</td>';
					content += '<td  data-name="student_attendence" data-type="select" class="student_attendence" ></td>';
					content += '<td  data-type="text" data-name="student_score" class="student_score"  ></td>';
					var passFailStatus = 0;
					if (passFailStatus === 0) {
						/*<i class="fa fa-sitemap"> <i class="fa fa-users">*/
						content += '	<td><span class="btn btn-sm btn-danger student_passFail" data-name="student_passFail" data-type="select"  data-pk="'+0+'"> </i> &nbsp;&nbsp; &nbsp;</span></td>';
					} else {
						content += '	<td ><span class="btn btn-sm btn-warning student_passFail " data-name="student_passFail" data-type="select"   data-pk="'+1+'"> </i> &nbsp;&nbsp; &nbsp;</span></td>';

					}
					content += '<td  hidden class="exam_id" data-name="examId" data-type="select" class="examId" data-pk="'+jSonObject.ExamInfo[0].ExamId+'" value="'+jSonObject.ExamInfo[0].ExamId+'">'
							+ jSonObject.ExamInfo[0].ExamId + '</td>';
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
