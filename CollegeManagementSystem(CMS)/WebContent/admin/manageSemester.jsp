<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.util.DateUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Faculty_ProgramModel"%>
<%@page import="com.model.SemesterModel"%>
<%@page import="java.util.List"%>
<%@page import="com.service.Faculty_Program_Model_Service"%>
<%@page import="com.serviceimpl.Faculty_Program_Model_Service_Impl"%>
<%@page import="com.service.SemesterServiceInterface"%>
<%@page import="com.serviceimpl.SemesterServiceImpl"%>

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
							Semester</span></a></li>

			</ol>


			<!-- ============= Main title content ============= -->
			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<button type="button" class="btn btn-info pull-right"
							data-toggle="modal" data-target=#add_semester_modal-body>Add
							Semester</button>

					</h3>

				</div>
			</div>
			<!-- ============ main title content ends here ============= -->

			<!-- ============= Table =============  -->
			<div class="box box-primary with-border" style="margin-top: 10px;">
				<div class="row with-border" style="overflow: hidden;">
					<div class="col-lg-12 ">
						<h3 style="margin: 0px; padding-left: 20px; height: 35px;">
							<span class="hidden-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Manage Current Active Semester</span> <span
								class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Manage Semester</span>
						</h3>
					</div>
				</div>

				<%
				Faculty_Program_Model_Service facultyProgramServiceInterface = new Faculty_Program_Model_Service_Impl();
					List<Faculty_ProgramModel> list = facultyProgramServiceInterface.getAllRecord();
					int i = 0;
					for (Faculty_ProgramModel model : list) {
						i++;
						StringBuffer program_name = new StringBuffer(model.getFaculty_Programe_Name());
						StringBuffer programNameId = new StringBuffer(program_name.append(model.getID()));
				%>
				<!-- Regular exam -->
				<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">

						<div class="panel box box-default">
							<div class="box-header with-border">
								<h4 class="box-title" style="padding-left: 15px;">

									<%=i%>.<%=model.getFaculty_Programe_Name()%>

									<div class="pull-right" style="margin: 0px; padding: 0px; position: relative; margin-top: -6px;">
										<span class="btn btn-sm btn-info  hidden-xs"> <i
											class="fa fa-users"></i> Students &nbsp; <span class="badge">
												5 </span>
										</span> <span class="btn btn-sm btn-warning  hidden-xs"> <i
											class="fa fa-sitemap"></i> Classes &nbsp; <span class="badge">
												1 </span>
										</span> <a class="btn-sm btn btn-default" title="View Exam Details"
											data-toggle="modal" data-target=<%="#" + program_name%>><i
											class="fa fa-eye"></i></a> 
											
											<a class="btn-sm btn btn-default"
											data-toggle="modal" data-target=<%="#" + model.getID()%>
											title="Edit Course Details"><i
											class="fa fa-pencil-square-o"></i></a> <a
											class="btn-sm btn btn-default" data-toggle="modal"
											data-target=<%="#" + programNameId%> title="Delete"
											data-method="post"><i class="fa fa-trash-o"></i></a>
									</div>
								</h4>
							</div>
						</div>
					</div>
				</div>

				<%
					}
				%>
				<!-- ======================end of exam type============= -->

			</div>

			<!-- /.box-group -->
		</div>

		<!-- Semester Modal starts here -->
		<div id="add_semester_modal-body" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Semester</h4>
					</div>
					<form action="../Semester_Add_Controller" enctype="multipart/form-data" method="Post">
      <div class="modal-body">
        
						  <div class="form-group">
						    <label>Faculty: <span class="astriek">*</span></label>
						    <select required class="form-control" id="faculty-box" name="faculty_id" onChange="load_program();">
								
							</select>
						  </div>
						  <div class="form-group">
						    <label>Programme: <span class="astriek">*</span></label>
						    <select required class="form-control" id="program-box" name="program_id" onChange="load_batch_year();">
								<option value="" disabled selected>Select Programme</option>
							</select>
						  </div>
						  <div class="form-group">
						    <label>Batch: <span class="astriek">*</span></label>
						    <select required class="form-control" name="batch_id" id="batch-box">
								<option value="" disabled selected>Select Batch</option>
							</select>
						  </div>
						  <div class="form-group">
						    <label>Semester no.: <span class="astriek">*</span></label>
						    	<input type="number" id="sem-no" name="semester_no" required class="form-control" placeholder="Semester number">
						  </div>
						  <div class="form-group">
						    <label>Semester Start Date: </label>
						    	<input type="date" id="start_date" name="start_date" class="form-control" placeholder="yyyy/mm/dd">
						  </div>
						  <div class="form-group">
						    <label>Semester End Date: </label>
						    <input type="date" id="end_date" name="end_date" class="form-control" placeholder="yyyy/mm/dd">
						  </div>
						  <div class="form-group">
						  	<label>Semester</label>
						  	<input type="radio" name="status" required checked value="1">Active
							<input type="radio" name="status" value="0">Completed</label>
						</div>
						  
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				         <button type="submit" class="btn btn-success">Submit</button>
				      </div>
				      </form>
				</div>

			</div>
		</div>
		<!-- Semester Modal ends here -->
		
		<%
			SemesterServiceInterface semesterServiceInterface = new SemesterServiceImpl();
		%>
		
		<%
		for (Faculty_ProgramModel model : list) {
			int x=0;
			StringBuffer program_name = new StringBuffer(model.getFaculty_Programe_Name());
			StringBuffer programNameId = new StringBuffer(program_name.append(model.getID()));
			int program_id = model.getID();
		%>

		<div id="<%=model.getID()%>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Semester <%=program_name %></h4>
					</div>
					<form action="../update_semester" method="Post">
						<div class="modal-body">

							
						</div>
						<div class="modal-footer">
							<input type=hidden name="id" value="<%=program_id%>">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!--=========================================================================================  -->

		<!-- Modal -->

		<div id="<%=program_name%>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">program_name</h4>
					</div>
					<form action="#" method="Post">
						<div class="modal-body">
							<% List<SemesterModel> semModel = semesterServiceInterface.loadByProgramId(program_id); 
							for (SemesterModel semList : semModel) {
								int id = semList.getSemester_id();
								int program_id_i = semList.getProgram_id();
								int batch_year_id = semList.getBatch_year();
								int sem_no = semList.getSemester_no();
								String sem_start_date = DateUtil.convertToString(semList.getStart_date());
								String sem_date_date = DateUtil.convertToString(semList.getEnd_date());
								int Status = semList.getStatus();
							%>
							<p>
								<%=id %> <%=program_id_i %> <%=batch_year_id %> <%=sem_no %>
								<%=sem_start_date %> <%=sem_date_date %> <%=Status %>
							</p>
							
							<% } %>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>

		<!--=========================================================================================  -->


		<!-- Modal -->

		<div id="<%=programNameId%>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form action="../deleteProgramSem" method="Post">
						<div class="modal-body">
							<h3 >
								Are you sure you want to delete this Program all Semester?
								<br>
								<strong"><%= program_name %></strong></h3>
						</div>
						<div class="modal-footer">
							<input type=hidden  name="deleteId" value="<%= program_id %>">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit"  class="btn btn-success"
								>Delete</button>
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
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>


</body>
</html>
