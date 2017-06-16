
<%@page import="Model.StudentModel"%>
<%@page import="java.util.List"%>
<%@page import="SERVICE.Impl.StudentServiceImpl"%>
<%@page import="SERVICE.StudentServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="admin-header.jsp" />


<div class="container-fluid display-table">
	<div class="row display-table-row">


		<jsp:include page="admin-sidemenu.jsp" />

		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

			<ol class="breadcrumb">
				<li><a href="admin-dashboard.jsp"><span
						class="glyphicon glyphicon-home"> Home</span></a></li>
				<li><a><span class="glyphicon glyphicon-user black">
							Manage-Students</span></a></li>
			</ol>

			<div class="panel-group" id="first-one">

				<div class="panel panel-default">
					<div class="panel-heading main-color-bg">
						<p>All student</p>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>S.No</th>
											<th>Firstname</th>
											<th>Middlename</th>
											<th>Lastname</th>
											<th>Email</th>
											<!-- <th> View || Edit || Delete</th>-->
										</tr>
									</thead>
									<tbody>
										<%
											StudentServiceInterface student = new StudentServiceImpl();
											List<StudentModel> mo = student.getAllRecord();
											int i = 0;
											for (StudentModel model : mo) {
												i++;
										%>
										<tr>
											<td><%=i%></td>

											<td><%=model.getFirstname()%></td>
											<td><%=model.getMiddlename()%></td>
											<td><%=model.getLastname()%></td>
											<td><%=model.getEmail()%></td>
											<td>
											<a
												href="ViewStudent.jsp?id=<%=model.getStudentID()%>"><input
													type="button" class="btn btn-info" value="View"></a>
											<a
												href="editStudent.jsp?id=<%=model.getStudentID()%>"><input
													type="button" class="btn btn-success" value="Edit"></a>
												<a href="deleteStudent.jsp?id=<%=model.getStudentID()%>"><input
													type="button" class="btn btn-danger" value="Delete"></a>
											</td>


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

				<div class="panel panel-default" id="second-one">
					<div class="panel-heading main-color-bg">Second Content</div>
					<div class="panel-body">
						<p>Manage Student Second part</p>
					</div>
				</div>
			</div>







		</div>

		<!-- --------------------------------------------------------------- -->



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
