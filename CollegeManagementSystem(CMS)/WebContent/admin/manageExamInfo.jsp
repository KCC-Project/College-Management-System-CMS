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

						<button type="button" class="btn btn-info pull-right" onclick="load_exam_type();"
							data-toggle="modal" data-target=#add_exam_modal-info>Add
							Exam info</button>

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
								<table class="table table-hover">
									<thead>
										<tr>
											<td>S.No</td>
											<td>Subject</td>
											<td>Exam Type</td>
											<td>Start Date</td>
											<td>End Date</td>
											<td>Start Time</td>
											<td>End Time</td>
											<td>Full Marks</td>
											<td>Pass Marks</td>
											<td>Status</td>
										
										</tr>
									</thead>
									<tbody>
									<% ExamInfoModelServiceInterface interfaceModel= new ExamInfoModelServiceImpl();
									List<ExamInfoModel> list=interfaceModel.getAllExamInfo();
									int i=0;
									for(ExamInfoModel model:list){
										 i++;
										 StringBuffer stringBuffer = new StringBuffer(model.getExamTypeName());
											StringBuffer updateExamDetail = new StringBuffer(stringBuffer.substring(0, 3));
											StringBuffer deleteExamType = new StringBuffer(stringBuffer.substring(0, 2));
											updateExamDetail.append("_termExam");
											deleteExamType.append("_examExam");
											System.out.println("id form jsp="+model.getExamId());
									%>
										<tr>
											<td><%=i%>.</td>
											<td><%=model.getSubjectName() %></td>
											<td><%=model.getExamTypeName() %></td>
											<td><%=model.getExamStartDate() %></td>
											<td><%=model.getExamEndDate() %></td>
											<td><%=model.getExamStartTime() %></td>
											<td><%=model.getExamEndTime() %></td>
											<td><%=model.getFullmarks() %></td>
											<td><%=model.getPassmarks() %></td>
											<td><%=model.getStatus() %></td>
											<td> 
											<span class="btn btn-sm btn-info  hidden-xs"> <i
											class="fa fa-users"></i> BE-computer &nbsp; <span class="badge">
												5 </span>
										</span>
											<a class="btn-sm btn btn-default" href="#?id=<%=model.getExamId() %>"
											data-toggle="modal" data-target=<%="#" + updateExamDetail%>
											title="Edit Course Details"><i
											class="fa fa-pencil-square-o"></i></a> <a href="#?id=<%=model.getExamId() %>"
											class="btn-sm btn btn-default" data-toggle="modal"
											data-target=<%="#" + deleteExamType%> title="Delete"
											data-method="post"><i class="fa fa-trash-o"></i></a></td>
										</tr>
										<%} %>
									</tbody>
								</table>
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
		<!-- Modal -->
		<div id="add_exam_modal-info" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Exam Information</h4>
					</div>
					<form action="../add_exam_info" method="Post">
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
	<%
			for (ExamInfoModel model : list) {
				i++;
				 StringBuffer stringBuffer = new StringBuffer(model.getExamTypeName());
					StringBuffer updateExamDetail = new StringBuffer(stringBuffer.substring(0, 3));
					StringBuffer deleteExamType = new StringBuffer(stringBuffer.substring(0, 2));
					updateExamDetail.append("_termExam");
					deleteExamType.append("_examExam");
					System.out.println("id form jsp="+model.getExamId());
		%>

<div id="<%=updateExamDetail %>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Exam Information</h4>
					</div>
					<form action="../add_exam" method="Post">
						<div class="modal-body">

							<div class="form-group">
								<label>Subject: <span class="astriek">*</span></label> <select
									required class="form-control" id="subject-box"
									name="subject_id"></select>
							</div>
							<div class="form-group">
								<label>Exam Type: <span class="astriek">*</span></label> <select
									required class="form-control" id="examType-box"
									name="examType_id"">
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
									name="status" value="0">Completed</label>
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

		<!--=========================================================================================  -->
	
	

		<div id="<%=deleteExamType%>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form action="../deleteExam" method="Post">
						<div class="modal-body">
							<h3 >
								Are you sure you want to delete this item?
								<br>
								<strong"><%=model.getExamTypeName()%></strong></h3>
						</div>
						<div class="modal-footer">
							<input type=hidden  name="deleteId" value="<%=model.getExamId()%>">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit"  class="btn btn-success"
								>Delete<%=model.getExamId() %></button>
						</div>
					</form>
				</div>

			</div>
		</div>
		<%
			}
		%>
		<!--=========================================================================================  -->


	</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Muzi Budaa...yo chaii halna pardaina -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>

<script>

window.addEventListener('load', function() {load_faculty(); }, false)

function load_faculty() {
	var id=document.getElementById("subject-box").value;
	var url="../ajax_subject_load";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			document.getElementById("subject-box").innerHTML=return_data;
		}
	}
	aj.send(id);
}


function load_exam_type(){
	var id=document.getElementById("examType-box").value;
	var url="../ajax_examType_load";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			document.getElementById("examType-box").innerHTML=return_data;
		}
	}
	aj.send(id);
}
</script>


</body>
</html>


</body>
</html>
