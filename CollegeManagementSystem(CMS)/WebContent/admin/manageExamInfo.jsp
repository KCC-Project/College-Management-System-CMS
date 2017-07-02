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
							Exam info</span></a></li>

			</ol>


			<!--=============================================Main Containt===============================  -->

			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<button type="button" class="btn btn-info pull-right"
							onclick="loadAdd();" data-toggle="modal"
							data-target=#add_exam_modal-info>Add Exam info</button>

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
								class="fa fa-graduation-cap"></i> Manage Current Active Exam
								Information</span> <span class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Manage Exam info</span>
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
									<table class="table table-hover">
										<thead>
											<tr>
												<td>S.No</td>
												<td>Subject</td>
												<td class="hidden-xs">Exam Type</td>
												<td>Start Date</td>
												<!-- <td class="hidden-xs">End Date</td> -->
												<td class="hidden-xs">Start Time</td>
												<td class="hidden-xs">End Time</td>
												<td class="hidden-xs">Full Marks</td>
												<td class="hidden-xs">Pass Marks</td>
												<td class="hidden-xs">Status</td>

											</tr>
										</thead>
										<tbody>
											<%
												ExamInfoModelServiceInterface interfaceModel = new ExamInfoModelServiceImpl();
												List<ExamInfoModel> list = interfaceModel.getAllExamInfo();
												int i = 0;
												for (ExamInfoModel model : list) {
													i++;
											%>
											<tr>
												<td><%=i%>.</td>
												<td><%=model.getSubjectName()%></td>
												<td class="hidden-xs"><%=model.getExamTypeName()%></td>
												<td><%=model.getExamStartDate()%></td>
												<%-- <td class="hidden-xs"><%=model.getExamEndDate()%></td> --%>
												<td class="hidden-xs"><%=model.getExamStartTime()%></td>
												<td class="hidden-xs"><%=model.getExamEndTime()%></td>
												<td class="hidden-xs"><%=model.getFullmarks()%></td>
												<td class="hidden-xs"><%=model.getPassmarks()%></td>
												<td class="hidden-xs"><%=model.getStatus()%></td>

												<td><span class="btn btn-sm btn-info  hidden-xs hidden-sm">
														<i class="fa fa-users"></i> BE-computer &nbsp; <span
														class="badge"> 5 </span>
												</span> <a href="#?id=<%=model.getExamId()%>"
													class="btn-sm btn btn-default hidden-lg hidden-md hidden-sm visible-xs" title="View Exam Details"
													"
											data-toggle="modal"
													data-target=#viewExamDetail
													onclick="viewExamDetailsOriginal('<%=model.getExamId()%>');"
													id="viewExamDetails"><i class="fa fa-eye"></i></a> <a
													onclick="loadUpdate();viewExamDetails('<%=model.getExamId()%>');"
													class="btn-sm btn btn-default"
													href="#?id=<%=model.getExamId()%>" data-toggle="modal"
													data-target=#mad id="updateExamDetail"
													title="Edit Course Details"><i
														class="fa fa-pencil-square-o"></i></a> <a
													onclick="viewExamDetails('<%=model.getExamId()%>'); "
													href="#?id=<%=model.getExamId()%>"
													class="btn-sm btn btn-default" data-toggle="modal"
													data-target=#deleteExamType title="Delete"
													data-method="post"><i class="fa fa-trash-o"></i></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
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
		<!-- ============================================================================================================================ -->
		<!-- Modal  Addd-->
		<div id="add_exam_modal-info" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Exam Information</h4>
					</div>
					<form action="../add_exam_info" method="Post" id="formOfInfo">
						<div class="modal-body">

							<div class="form-group">
								<label>Subject: <span class="astriek">*</span></label> <select
									required class="form-control" id="subject-box"
									name="subject_id"></select>
							</div>
							<div class="form-group">
								<label>Exam Type: <span class="astriek">*</span></label> <select
									required class="form-control" id="examType-box"
									name="examType_id">
									<option value="" disabled selected>Select Exam Type</option>
								</select>
							</div>


							<div class="form-group">
								<label>Exam Date: </label> <input type="date"
									id="exam_start_date" name="exam_start_date"
									class="form-control" placeholder="yyyy/mm/dd">
							</div>
							<div class="form-group">
								<label>Exam End Date: </label> <input type="date"
									id="exam_end_date" name="exam_end_date" class="form-control"
									placeholder="yyyy/mm/dd">
							</div>


							<div class="form-group">
								<label>Exam Start Time: </label> <input type="time"
									id="exam_start_time" name="exam_start_time"
									class="form-control" placeholder="yyyy/mm/dd">
							</div>
							<div class="form-group">
								<label>Exam End Time: </label> <input type="time"
									id="exam_end_time" name="exam_end_time" class="form-control"
									placeholder="yyyy/mm/dd">
							</div>


							<div class="form-group">
								<label>Full Marks: </label> <input type="number"
									id="exam_fullMarks" name="exam_fullMarks" class="form-control"
									placeholder="Fullmarks">
							</div>
							<div class="form-group">
								<label>Pass Marks: </label> <input type="number"
									id="exam_passMarks" name="exam_passMarks" class="form-control"
									placeholder="Passmarks">
							</div>

							<div class="form-group">
								<label>Status :</label> <input type="radio" name="status"
									required checked value="1">Active <input type="radio"
									name="status" value="0">Completed
							</div>

						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</form>
				</div>

			</div>
		</div>


		<!-- ==================================================================================== -->
		<!-- Update -->
		<div id="mad" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Exam Information</h4>
					</div>
					<form action="../update_exam_info" method="Post" id="formOfInfo">
						<div class="modal-body">

							<div class="form-group">
								<label>Subject: <span class="astriek">*</span></label> <select
									required class="form-control" id="subject-boxx"
									name="subject_idd"></select>
							</div>
							<div class="form-group">
								<label>Exam Type: <span class="astriek">*</span></label> <select
									required class="form-control" id="examType-boxx"
									name="examType_idd">
									<option value="" disabled selected>Select Exam Type</option>
								</select>
							</div>


							<div class="form-group">
								<label>Exam Date: </label> <input type="date"
									id="exam_start_datee" name="exam_start_datee"
									class="form-control" placeholder="yyyy/mm/dd">
							</div>
							<div class="form-group">
								<label>Exam End Date: </label> <input type="date"
									id="exam_end_datee" name="exam_end_datee" class="form-control"
									placeholder="yyyy/mm/dd">
							</div>


							<div class="form-group">
								<label>Exam Start Time: </label> <input type="time"
									id="exam_start_timee" name="exam_start_timee"
									class="form-control" placeholder="yyyy/mm/dd">
							</div>
							<div class="form-group">
								<label>Exam End Time: </label> <input type="time"
									id="exam_end_timee" name="exam_end_timee" class="form-control"
									placeholder="yyyy/mm/dd">
							</div>


							<div class="form-group">
								<label>Full Marks: </label> <input type="number"
									id="exam_fullMarkss" name="exam_fullMarkss"
									class="form-control" placeholder="Fullmarks">
							</div>
							<div class="form-group">
								<label>Pass Marks: </label> <input type="number"
									id="exam_passMarkss" name="exam_passMarkss"
									class="form-control" placeholder="Passmarks">
							</div>

							<div class="form-group">
								<label>Status :</label> <input type="radio" name="statuss"
									required checked value="1">Active <input type="radio"
									name="statuss" value="0">Completed
							</div>

						</div>
						<div class="modal-footer">
							<input type="hidden" id="hiddenValueToUpdate"
								name="hiddenValueToUpdate">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-success">Update</button>
						</div>
					</form>
				</div>

			</div>
		</div>


		<!--=========================================================================================  -->
		<!-- Delete -->
		<div id="deleteExamType" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form action="../delete_Exam_info" method="Post">
						<div class="modal-body">
							<h3>
								Are you sure you want to delete this item? <br> <strong
									id="iteamNameJson"></strong>
							</h3>
						</div>
						<div class="modal-footer">
							<input type=hidden name="deleteIdJson" id="deleteIdJs">
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--  ===============================================================================-->
<div class="modal fade" id="viewExamDetail" role="dialog">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Information</h4>
			</div>
			<div class="modal-body">
				<div style="overflow-x: auto;">
					<table class="tblThTd ">
						<tr>
							<Th>S.No :</Th>
							<td>1.</td>
						</tr>

						<tr>
							<Th>Subject :</Th>
							<td id="subjectJsonXXX"></td>
						</tr>
						<tr>
							<Th>Exam Type :</Th>
							<td id="examTypeJsonXXX"></td>
						</tr>
						<tr>
							<Th>Start Date :</Th>
							<td id="startDateJsonXXX"></td>
						</tr>
						<tr>
							<Th>End Date :</Th>
							<td id="endDateJsonXXX"></td>
						</tr>
						<tr>
							<Th>Start Time :</Th>
							<td id="startTimeJsonXXX"></td>
						</tr>
						<tr>
							<Th>End Time :</Th>
							<td id="endTimeJsonXXX"></td>
						</tr>
						<tr>
							<Th>Full Marks :</Th>
							<td id="fullMarksJsonXXX"></td>
						</tr>
						<tr>
							<Th>Pass Marks :</Th>
							<td id="passMarksJsonXXX"></td>
						</tr>
						<tr>
							<Th>Status :</Th>
							<td id="statusJsonXXX"></td>
						</tr>

						<tr>
							<Th>Faculty :</Th>
							<td id="facultyJsonXXX"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Muzi Budaa...yo chaii halna pardaina -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>

<script>
	function loadAdd() {
		document.getElementById("formOfInfo").reset();
		load_faculty();
		load_exam_type();
	}

	function load_faculty() {

		var id = document.getElementById("subject-box").value;
		var url = "../ajax_subject_load";
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var return_data = aj.responseText;
				document.getElementById("subject-box").innerHTML = return_data;
				document.getElementById("subject-boxx").innerHTML = return_data;

			}
		}
		aj.send(id);
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

				document.getElementById("examType-box").innerHTML = return_data;
				document.getElementById("examType-boxx").innerHTML = return_data;

			}
		}
		aj.send(id);
	}

	function loadUpdate() {
		document.getElementById("formOfInfo").reset();
		load_faculty();
		load_exam_type();

	}

	function viewExamDetailsOriginal(id) {
		var url = "../ajax_loadRequiredInfoFormJson_mangeExamInfo";
		var idSend = "value=" + id;
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var jSonObject = eval('(' + aj.responseText + ')');
				
				document.getElementById("subjectJsonXXX").innerHTML = jSonObject.subjectName;
				document.getElementById("examTypeJsonXXX").innerHTML = jSonObject.examTypeName;

				document.getElementById("startDateJsonXXX").innerHTML = jSonObject.examStartDate;
				document.getElementById("endDateJsonXXX").innerHTML = jSonObject.examEndDate;
				document.getElementById("startTimeJsonXXX").innerHTML = jSonObject.examStartTime;
				document.getElementById("endTimeJsonXXX").innerHTML = jSonObject.examEndTime;

				document.getElementById("fullMarksJsonXXX").innerHTML = jSonObject.fullmarks;
				document.getElementById("passMarksJsonXXX").innerHTML = jSonObject.passmarks;
				document.getElementById("statusJsonXXX").innerHTML = jSonObject.status;
				document.getElementById("facultyJsonXXX").innerHTML = "Science and Tech(No)";

			}
		}
		aj.send(idSend);
	}
	function viewExamDetails(id) {

		var url = "../ajax_loadRequiredInfoFormJson_mangeExamInfo";
		var idSend = "value=" + id;
		var aj = new XMLHttpRequest();
		aj.open("POST", url, true);
		aj
				.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
		aj.onreadystatechange = function() {
			if (aj.readyState == 4 && aj.status == 200) {
				var jSonObject = eval('(' + aj.responseText + ')');
				document.getElementById("exam_start_datee").value = jSonObject.examStartDate;
				document.getElementById("exam_end_datee").value = jSonObject.examEndDate;
				document.getElementById("exam_start_timee").value = jSonObject.examStartTime;
				document.getElementById("exam_end_timee").value = jSonObject.examEndTime;
				document.getElementById("exam_fullMarkss").value = jSonObject.fullmarks;
				document.getElementById("exam_passMarkss").value = jSonObject.passmarks;
				document.getElementById("deleteIdJs").value = jSonObject.examId;
				document.getElementById("iteamNameJson").innerHTML = jSonObject.examId;
				document.getElementById("hiddenValueToUpdate").value = jSonObject.examId;

				/* For selecting Selected subject automatically */
				var subjectid = jSonObject.subjectId;
				var temp = subjectid;
				var mySelect = document.getElementById('subject-boxx');
				for (var i, j = 0; i = mySelect.options[j]; j++) {
					if (i.value == temp) {
						mySelect.selectedIndex = j;
						break;
					}
				}

				/* For Selecting selected examType automatically */
				var examTypeId = jSonObject.examTypeId;
				var temp = examTypeId;
				var mySelect = document.getElementById('examType-boxx');
				for (var i, j = 0; i = mySelect.options[j]; j++) {
					if (i.value == temp) {
						mySelect.selectedIndex = j;
						break;
					}
				}

				/*For Selecting radio btn automatically  */
				var StatusId = jSonObject.status;
				var elements = document.getElementsByName('status');
				for (i = 0; i < elements.length; i++) {
					if (elements[i].value == StatusId) {
						elements[i].checked = true;
					}
				}
			}
		}
		aj.send(idSend);
	}
</script>


</body>
</html>

