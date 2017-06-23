<%@page import="java.util.List"%>
<%@page import="SERVICE.Impl.Faculty_Program_Model_Service_Impl"%>
<%@page import="SERVICE.Faculty_Program_Model_Service"%>
<%@page import="Model.Faculty_ProgramModel"%>
<jsp:include page="admin-header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<div class="container-fluid display-table">
	<div class="row display-table-row">
		<jsp:include page="admin-sidemenu.jsp" />
		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">
			<ol class="breadcrumb">
				<li><a href="admin-dashboard.jsp"><span
				class="glyphicon glyphicon-home"> Home </span></a></li>
				<li><a><span class="glyphicon glyphicon-user black">
				Add-Students </span></a></li>
			</ol>
			<div class="panel-group">
				<div class="panel panel-default profile-panel">
					<div class="panel-heading main-color-bg">
						<!-- <a href="addstudents.jsp" class="btn btn-active"> <b><span
								class="glyphicon glyphicon-plus"> Add Students </span></b>
					</a> | <a href="managestudents.jsp" class="btn btn-inactive"> <span
					class="glyphicon glyphicon-pencil"> Manage Students </span>
			</a> -->
		</div>
		<div class="panel-body" id="stu">
			<div class="col-lg-12">
				<form class="" action="../addStudent"
					enctype="multipart/form-data" method="Post">
					<div class="col-lg-4 col-sm-2 col-xs-12 profile-info ">
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
					<div class="col-lg-4 col-sm-5 col-xs-12 profile-info">
						<table class="tabel tabel-responsive">
							<tr>
								<td>Firstname: <span class="astriek">*</span>
							</td>
							<td><input type="text" placeholder="Firstname"
							class="form-control" required name="student_firstname"></td>
						</tr>
						<tr>
							<td>Middle Name:</td>
							<td><input type="text" placeholder="Middlename"
							class="form-control" name="student_middlename"></td>
						</tr>
						<tr>
							<td>LastName: <span class="astriek">*</span>
						</td>
						<td><input type="text" placeholder="Lastname"
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
					<td ><input type="text" placeholder="ID"
					class="form-control" required name="id" id="studentID" onblur="validate();" onkeyup="autoUserPass();" >
						</td>
						<td><span id="Error_ID" class="glyphicon glyphicon-remove-circle" style="visibility:hidden; "></span>
				</td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><input type="number" placeholder="Phone"
					class="form-control" name="Mobile"></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input type="text" placeholder="Address"
					class="form-control" name="Address" id="address_ID"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" placeholder="email"
					class="form-control" name="email"></td>
				</tr>
				<tr>
					<td>Enroll Date:</td>
					<td><input type="date" id="date"
					class="form-control" name="date"></td>
				</tr>
			</table>
		</div>
		<div class="col-lg-4 col-sm-5 col-xs-12 profile-info">
			<table class="tabel tabel-responsive">
				<tr>
					<td>Faculty: <span class="astriek">*</span>
				</td>
				<td><select required class="form-control" id="sel1" onChange="select_faculty();">
					<option value="0" disabled selected>Select Faculty</option>
					<%
					Faculty_Program_Model_Service service = new Faculty_Program_Model_Service_Impl();
					List<Faculty_ProgramModel> mo = service.getAllRecord();
					for (Faculty_ProgramModel model : mo) {
					%>
					<option value="<%=model.getID() %>">
						<%=model.getFaculty_Programe_Name()%>
					</option>
					<%
					}
					%>
				</select></td>
			</tr>
			
					<tr>
		<td>Programme: <span class="astriek">*</span> </td>
		<td><select required class="form-control" id="sel2" onChange="autoSelectBatch();">
			<option value="" disabled selected>Select Programme</option>	
			</select></td>
		</tr>
		
		<tr>
			<td>Batch: <span class="astriek">*</span>
		</td>
		<td><select required class="form-control" id="batchID">
			<option value="" disabled selected>Select Batch</option>
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
		<td><input type="text" placeholder="username"
		class="form-control" name="student_username" id="student_username1"></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="password" class="form-control"
		name="password" placeholder="Password" id="Password1"></td>
	</tr>
	<tr>
		<td>Confirm Password:</td>
		<td><input type="password" class="form-control"
		name="confirm_password" placeholder="Confirm Password" id="confirm_password"></td>
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
<script>
function validate(){
	var userID=document.getElementById("studentID").value;
var Error="userID="+userID;
var url ="../ajax_getUserId_Or_Email";
var aj=new XMLHttpRequest();
aj.open("POST", url, true);
aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
aj.onreadystatechange=function(){
	if (aj.readyState==4&&aj.status==200) {
		var return_data=aj.responseText;
		if (return_data.match('Match_Found')) {
			document.getElementById("Error_ID").style.visibility = "visible";
			return_data=null;
		}else{
			document.getElementById("Error_ID").style.visibility = "hidden";
			return_data=null;
		}
		
	}
	}
aj.send(Error);
}
function select_faculty() {
	var id=document.getElementById("sel1").value;
	var url="../aja";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			document.getElementById("sel2").innerHTML=return_data;
		}
		}
	aj.send(idSend);
}

function autoSelectBatch(){
var date=document.getElementById("date").value;
var program=document.getElementById("sel2").value;

var url="../ajax_Batch";
var idSend="date="+date+"&program="+program;
var aj=new XMLHttpRequest();
aj.open("POST", url, true);
aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
aj.onreadystatechange=function(){
	if (aj.readyState==4&&aj.status==200) {
		var return_data=aj.responseText;
		document.getElementById("batchID").innerHTML=return_data;
	}
	}
aj.send(idSend);

}

function autoUserPass(){
	
	var id=document.getElementById("studentID").value;

	var url="../ajax_user_password_autofill";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			//alert("from ajax:"+return_data);
			document.getElementById("student_username1").value=return_data;
			document.getElementById("Password1").value=return_data;
			document.getElementById("confirm_password").value=return_data;
		}
		}
	aj.send(idSend);
	
}
</script>
</body>
</html>