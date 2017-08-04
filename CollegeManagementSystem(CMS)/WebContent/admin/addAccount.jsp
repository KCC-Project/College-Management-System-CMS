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
							Account</span></a></li>
				<li><a><span class="glyphicon glyphicon-education black">
							Add Account</span></a></li>
			</ol>
			<!--=============================================Main Containt===============================  -->
			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<a><button type="button" class="btn btn-info pull-right"
								data-toggle="modal" data-target="#addAccountModal" id="modal-box">Account</button></a>
						<button type="button" class="btn btn-info"
							style="float: left; margin-left: -20px;">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
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
								class="fa fa-graduation-cap"></i> Manage Account</span> <span
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
									<table class="table table-bordered" id="tblAccount">
										<thead>
											<tr>
												<td>S.No</td>
												<td>Name</td>
												<td>Semester</td>
												<!-- <td class="hidden-xs">Batch</td>
												<td class="hidden-xs">Faculty</td>
												<td class="hidden-xs">Program</td> -->
												<td>Amount</td>
											</tr>
										</thead>
										<tbody id="account_data">
										</tbody>
									</table>
								</div>
								<div class="loader" id="loader" hidden style="margin-left: 40%;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--=========================================================================================  -->
			<div class="modal fade" id="addAccountModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Student Account</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<div class="form-group " style="margin-bottom: 0px;">
											<select required class="form-control" id="p-faculty-box"
												name="faculty_id">
											</select>
										</div>
									</div>
									<div class="form-group col-sm-3" style="margin-bottom: 0px;">
										<select required class="form-control" id="p-program-box"
											name="program_id">
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
										</select>
									</div>
								</div>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success"
									id="searchbtnClicked"  data-dismiss="modal">Search</button>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!--=========================================================================================  -->
		</div>
	</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>
<script src="../Resources/js/re-usable.js"></script>
<script src="../Resources/js/bootstrap-editable.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#modal-box").click(function(event){ load_faculty(event, "p-faculty-box"); });
	$("#p-faculty-box").change(function(event){ load_program(event, "p-program-box"); });
	$("#p-program-box").change(function(event){ load_batch_year(event, "batch-box"); });
	$("#searchbtnClicked").click(function(event){ loadStudent(event,"account_data"); });
	
	function loadStudent(e,target) {

	var programId = document.getElementById("p-program-box").value;
	var batchNo = document.getElementById("batch-box").value;
	var  semesterNo= document.getElementById("Semester_box").value;

	var url = "../ajax_account_student";
	var idSend = "programId=" + programId
			+ "&batchNo=" + batchNo + "&semesterNo=" + semesterNo;
	var aj = new XMLHttpRequest();
	aj.open("POST", url, true);
	aj
			.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
	aj.onreadystatechange = function() {
		if (aj.readyState == 4 && aj.status == 200) {
			var jSonObject = eval('(' + aj.responseText + ')');
			$("#tblAccount").show();
			var content = '';
			for (var i = 0; i < jSonObject.length; i++) {
				content += '<tr>';
				content += '<td>' + (i + 1) + '</td>';
				content += "<td>"+ jSonObject[i].StudentName + "</td>";
				content += '<td   data-type="text" class="student_semester" ></td>';
				content += '<td  data-type="text" " class="student_amount"  ></td>';	
				makeEditable("account_data","student_amount","Amount","number");
				makeEditable("account_data","student_semester","Semester","number");
				content += '<tr>';
			}
			$('#'+ target).html(content);
		}
	}
	aj.send(idSend);
}
});
</script>
</body>
</html>
</body>
</html>
