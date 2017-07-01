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
								class="fa fa-graduation-cap"></i> Manage Current Active Exam Type</span> <span
								class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Manage Exam</span>
						</h3>
					</div>
				</div>

				<%
					ExamModelServiceInterface examModelInterface = new ExamModelServiceImpl();
					List<ExamModel> list = examModelInterface.getAllExamType();
					int i = 0;
				
					for (ExamModel model : list) {
						i++;
						StringBuffer stringBuffer = new StringBuffer(model.getExamTypeName());
						StringBuffer viewExamDetail = new StringBuffer(stringBuffer.substring(0, 3));
						StringBuffer deleteExamType = new StringBuffer(stringBuffer.substring(0, 2));
						viewExamDetail.append("_term");
						deleteExamType.append("_exam");
					
						
				%>
				<!-- Regular exam -->
				<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">

						<div class="panel box box-default">
							<div class="box-header with-border">
								<h4 class="box-title" style="padding-left: 15px;">

									<%=i%>.<%=model.getExamTypeName()%>

									<div class="pull-right"
										style="margin: 0px; padding: 0px; position: relative; margin-top: -6px;">
										<span class="btn btn-sm btn-info  hidden-xs"> <i
											class="fa fa-users"></i> Students &nbsp; <span class="badge">
												5 </span>
										</span> <span class="btn btn-sm btn-warning  hidden-xs"> <i
											class="fa fa-sitemap"></i> Faculty &nbsp; <span class="badge">
												1 </span>
										</span> <a class="btn-sm btn btn-default" title="View Exam Details" onclick="setId(<%=model.getExamId()%>);"
											data-toggle="modal" data-target=<%="#" + viewExamDetail%>><i
											class="fa fa-eye" ></i></a> <a class="btn-sm btn btn-default"
											data-toggle="modal" data-target=<%="#" + model.getExamId()%>
											title="Edit Course Details"><i
											class="fa fa-pencil-square-o"></i></a> <a href="#?id=<%=model.getExamId() %>" onclick="setId(<%=model.getExamId()%>);"
											class="btn-sm btn btn-default" data-toggle="modal"
											data-target=<%="#" + deleteExamType%> title="Delete"
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
					<form action="../add_exam" method="Post">
						<div class="modal-body">

							<div class="form-group">
								<label>Exam Type : <span class="astriek">&nbsp;*</span></label>
								<input type="text" required class="form-control"
									id="add_exam_type" name="add_exam_type" onkeyup="checkIfExit();"
									placeholder="Enter Exam Type">
							</div>
							<!--=================summary form================  -->
							<div class="form-group">
								<label class="sr-only ">Article</label>
								<textarea class="form-control summernote" placeholder="Summary"
									name="summary">
                      
                      </textarea>
							</div>
							<!-- ============================================== -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" id="submitBtn" class="btn btn-success">Submit</button>
						</div>
					</form>
				</div>

			</div>
		</div>

		<!--=========================================================================================  -->
		<!-- Modal -->
		<%
			for (ExamModel model : list) {
				i++;
				StringBuffer stringBuffer = new StringBuffer(model.getExamTypeName());
				StringBuffer viewExamDetail = new StringBuffer(stringBuffer.substring(0, 3));
				StringBuffer deleteExamType = new StringBuffer(stringBuffer.substring(0, 2));
				viewExamDetail.append("_term");
				deleteExamType.append("_exam");
		%>

		<div id="<%=model.getExamId()%>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Exam</h4>
					</div>
					<form action="../update_exam" method="Post">
						<div class="modal-body">

							<div class="form-group">
								<label>Exam Type : <span class="astriek">&nbsp;*</span></label>
								<input type="text" required class="form-control"
									id="update_exam_type" name="update_exam_type"
									value="<%=model.getExamTypeName()%>">
							</div>
						</div>
						<div class="modal-footer">
							<input type=hidden name="id" value="<%=model.getExamId()%>">
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

		<div id="<%=viewExamDetail %>" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Summary</h4>
					</div>
					<form action="#" method="Post">
						<div class="modal-body">

							<h3>
								<%=model.getSummary()%>
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
							<input type=hidden  name="deleteId" id="deleteId12">
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
<!-- Muzi Budaa...yo chaii halna pardaina -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>
<script type="text/javascript">
	$('.summernote').summernote({
		height : 200

	});
	
	function setId(id) {
		document.getElementById("deleteId12").value=id;

	}
	
	function checkIfExit() {
		var value=document.getElementById("add_exam_type").value;
		var url="../ajax_checkIf_ExamType_exit";
		var idSend="value="+value;
		var aj=new XMLHttpRequest();
		aj.open("POST", url, true);
		aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		aj.onreadystatechange=function(){
			if (aj.readyState==4&&aj.status==200) {
				var return_data=aj.responseText;
				alert(return_date);
				document.getElementById("submitBtn").disable=true;
			}
		}
		aj.send(idSend);
	}
</script>
</body>
</html>


</body>
</html>