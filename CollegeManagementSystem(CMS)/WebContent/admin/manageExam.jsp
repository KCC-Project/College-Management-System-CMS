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
							Exam</span></a></li>

			</ol>


			<!--=============================================Main Containt===============================  -->

			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<button type="button" class="btn btn-info pull-right"
							data-toggle="modal" data-target=#add_exam_modal-body>Add
							Exam</button>

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
								class="fa fa-graduation-cap"></i> Manage Current Active Exam</span>
						</h3>
					</div>
				</div>


				<!-- Regular exam -->
				<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">

						<div class="panel box box-default">
							<div class="box-header with-border">
								<h4 class="box-title" style="padding-left: 15px;">
									1. Regular

									<div class="pull-right"
										style="margin: 0px; padding: 0px; position: relative; margin-top: -6px;">
										<span class="btn btn-sm btn-info disp-count"> <i
											class="fa fa-users"></i> Students &nbsp; <span class="badge">
												5 </span>
										</span> <span class="btn btn-sm btn-warning disp-count"> <i
											class="fa fa-sitemap"></i> Batches &nbsp; <span class="badge">
												1 </span>
										</span> <a class="btn-sm btn btn-default" title="View Exam Details"
											data-toggle="modal" data-target=#View_Exam_Details><i
											class="fa fa-eye"></i></a> <a class="btn-sm btn btn-default" data-toggle="modal" data-target=#update_exam_modal-body
											 title="Edit Course Details"><i
											class="fa fa-pencil-square-o"></i></a> <a
											class="btn-sm btn btn-default" data-toggle="modal"
											data-target=#delete_Exam_Details title="Delete"
											data-method="post"><i class="fa fa-trash-o"></i></a>
									</div>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<!-- ======================end of exam type============= -->


			</div>

			<!-- /.box-group -->
		</div>
		<!-- ============================================================================================================================ -->
		<!-- Modal -->
		<div id="add_exam_modal-body" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Exam</h4>
					</div>
					<form action="#"
						enctype="multipart/form-data" method="Post">
						<div class="modal-body">

							<div class="form-group">
								<label>Exam Type : <span class="astriek">&nbsp;*</span></label>
								<input type="text" required class="form-control"
									id="add_exam_type" name="add_exam_type">
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
<!-- Modal -->
		<div id="update_exam_modal-body" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Exam</h4>
					</div>
					<form action="#"
						enctype="multipart/form-data" method="Post">
						<div class="modal-body">

							<div class="form-group">
								<label>Exam Type : <span class="astriek">&nbsp;*</span></label>
								<input type="text" required class="form-control"
									id="add_exam_type" name="add_exam_type">
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

		<!-- Modal -->
		<div id="View_Exam_Details" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Summary</h4>
					</div>
					<form action="#" enctype="multipart/form-data" method="Post">
						<div class="modal-body">
							<h3>
								<strong>This a Regular exam.</strong> When this exam is held all
								student must participate.Otherwise consequences will should be
								handle by student him/herslef.
							</h3>
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
		<div id="delete_Exam_Details" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form action="#" method="Post">
						<div class="modal-body">
							<h3>Are you sure you want to delete this item?</h3>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-success"
								data-dismiss="modal">Submit</button>
						</div>
					</form>
				</div>

			</div>
		</div>

		<!--=========================================================================================  -->




	</div>
</div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Semester</h4>
			</div>
			<form action="../Semester_Add_Controller"
				enctype="multipart/form-data" method="Post">
				<div class="modal-body">

					<div class="form-group">
						<label>Faculty: <span class="astriek">*</span></label> <select
							required class="form-control" id="faculty-box" name="faculty_id"
							onChange="load_program();">

						</select>
					</div>
					<div class="form-group">
						<label>Programme: <span class="astriek">*</span></label> <select
							required class="form-control" id="program-box" name="program_id"
							onChange="load_batch_year();">
							<option value="" disabled selected>Select Programme</option>
						</select>
					</div>
					<div class="form-group">
						<label>Batch: <span class="astriek">*</span></label> <select
							required class="form-control" name="batch_id" id="batch-box">
							<option value="" disabled selected>Select Batch</option>
						</select>
					</div>
					<div class="form-group">
						<label>Semester no.: <span class="astriek">*</span></label> <input
							type="number" id="sem-no" name="semester_no" required
							class="form-control" placeholder="Semester number">
					</div>
					<div class="form-group">
						<label>Semester Start Date: </label> <input type="date"
							id="start_date" name="start_date" class="form-control"
							placeholder="mm/dd/yyyy">
					</div>
					<div class="form-group">
						<label>Semester End Date: </label> <input type="date"
							id="end_date" name="end_date" class="form-control"
							placeholder="mm/dd/yyyy">
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




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
</body>
</html>


</body>
</html>
