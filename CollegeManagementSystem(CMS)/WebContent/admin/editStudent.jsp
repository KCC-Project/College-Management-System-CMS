<%@page import="com.serviceimpl.StudentServiceImpl"%>
<%@page import="com.model.StudentModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<jsp:include page="admin-header.jsp" />


<div class="container-fluid display-table">
	<div class="row display-table-row">


		<jsp:include page="admin-sidemenu.jsp" />
<%
		Integer id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		StudentModel model= new StudentServiceImpl().readId(id);
	%>
		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

			<ol class="breadcrumb">
				<li><a href="admin-dashboard.jsp"><span
						class="glyphicon glyphicon-home"> Home </span></a></li>
				<li><a><span class="glyphicon glyphicon-user black">
							Edit/Update-Students </span></a></li>
			</ol>


			<div class="panel-group">

				<div class="panel panel-default profile-panel">
					<div class="panel-heading main-color-bg">
						<h3>Edit Student</h3>
					</div>
					<div class="panel-body" id="stu">


						<div class="col-lg-12">
							<form class="" action="../updateStudent" enctype="multipart/form-data"
								method="Post">
								<div class="col-lg-4 col-sm-4 col-xs-12 profile-info ">
									<table class="table tabel-responsive">
										<tr>
											<td>
												<div class="text-center" id="profile-image">
													<img src="me.jpg" alt="image upload">
												</div>
											</td>
										</tr>
										<tr>
											<td><input type="file" id="inputfile" name="filepath"
												class="form-control"></td>
										</tr>
										<tr>
											<td><h3 class="text-center">
													<i><b>Students</b></i>
												</h3></td>
										</tr>
									</table>
								</div>

								<div class="col-lg-4 col-sm-4 col-xs-12 profile-info">
									<table class="tabel tabel-responsive">
										<tr>
											<td>Firstname: <span class="astriek">*</span>
											</td>
											<td><input type="text" value="<%= model.getFirstname()%>"
												class="form-control" required name="student_firstname"></td>
										</tr>
										<tr>
											<td>Middle Name:</td>
											<td><input type="text" value="<%= model.getMiddlename()%>"
												class="form-control" name="student_middlename"></td>
										</tr>
										<tr>
											<td>LastName: <span class="astriek">*</span>
											</td>
											<td><input type="text"  value="<%= model.getLastname()%>"
												class="form-control" required name="student_Lastname"></td>
										</tr>
										<tr>
											<td>Gender: <span class="astriek">*</span>
											</td>
											<td><label class="radio-inline"><input
													type="radio" name="gender" required value="male">Male</label>
												<label class="radio-inline"><input type="radio"
													name="gender" value="female">Female</label></td>
										</tr>
										<tr>
											<td>ID:</td>
											<td><input type="text" placeholder="ID"
												class="form-control" required name="id"></td>
										</tr>
										<tr>
											<td>Phone:</td>
											<td><input type="number" value="<%= model.getMobileNo()%>"
												class="form-control" name="Mobile"></td>
										</tr>
										<tr>
											<td>Address:</td>
											<td><input type="text" value="<%= model.getAddress()%>"
												class="form-control" name="Address"></td>
										</tr>
										
										<tr>
											<td>Email:</td>
											<td><input type="email" value="<%= model.getEmail()%>"
												class="form-control" name="email"></td>
										</tr>
									</table>
								</div>


								<div class="col-lg-4 col-sm-4 col-xs-12 profile-info">
									<table class="tabel tabel-responsive">
									
											<tr>
											<td>Faculty: <span class="astriek">*</span>
											</td>
											<td><select required class="form-control" id="sel1">
													<option value="" disabled selected>Select
														Faculty</option>
													<option>Science and texh</option>
													<option>Management</option>
													
											</select></td>
										</tr>
										
										<tr>
											<td>Programme: <span class="astriek">*</span>
											</td>
											<td><select required class="form-control" id="sel1">
													<option value="" disabled selected>Select
														Programme</option>
													<option>BE Computer</option>
													<option>BE Electronics</option>
													<option>BE Civil</option>
													<option>BIT</option>
													<option>BCA</option>
													<option>BBA</option>
													<option>Other</option>
											</select></td>
										</tr>
											<tr>
											<td>Batch: <span class="astriek">*</span>
											</td>
											<td><select required class="form-control" id="sel1">
													<option value="" disabled selected>Select Batch</option>
													<option>2010</option>
													<option>2012</option>
													<option>2013</option>
													<option>2014</option>
													<option>2015</option>
											</select></td>
										</tr>
										
										<tr>
											<td>Section:</td>
											<td><select class="form-control" id="sel1">
													<option value="" disabled selected>Select Section
													</option>
													<option>B01</option>
													<option>B02</option>
											</select></td>
										</tr>
										<tr>
											<td>Username:</td>
											<td><input type="text"  value="<%= model.getUsername()%>"
												class="form-control" name="student_username"></td>
										</tr>
										<tr>
											<td>Password:</td>
											<td><input type="password" class="form-control"
												name="password" value="<%= model.getPassword()%>"></td>
												
												
										</tr>
										
										<tr>
											<td>Confirm Password:</td>
											<td><input type="password" class="form-control"
												name="confirm_password" value="<%= model.getPassword()%>"></td>
										</tr>
										<tr>
											<td>Status: <span class="astriek">*</span>
											</td>
											<td><label class="radio-inline"><input
													type="radio" name="status" required checked value="active">Active</label>
												<label class="radio-inline"><input type="radio"
													name="status" value="inactive">Inactive</label></td>
										</tr>
										<tr>
											<td colspan="2"><input type="submit"
												class="btn btn-success btn-block" value="Submit"></td>
										</tr>
									</table>
								</div>

							</form>
						</div>



					</div>
				</div>



			</div>

			<!-- --------------------------------------------------------------- -->



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
