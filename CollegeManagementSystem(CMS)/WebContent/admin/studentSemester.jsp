<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link href="../Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="../Resources/font-awesome/css/font-awesome.min.css">
<link href="../Resources/css/manageExam.css" rel="stylesheet"
	type="text/css">
	
	<jsp:include page="admin-header.jsp"/>


  <div class="container-fluid display-table">
    <div class="row display-table-row">

    <jsp:include page="admin-sidemenu.jsp"/>
     

      <!-- Content Area -->
      <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

       <ol class="breadcrumb">
        <li><a href="admin-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home</span></a></li>
        <li><a><span class="glyphicon glyphicon-education black"> Student Semester</span></a></li>
      </ol>

		<!-- ============= Main title content ============= -->
			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<button type="button" class="btn btn-info pull-right"
							data-toggle="modal" data-target=#add_student_semester id="modal-box" onClick="load_faculty(event);">Add
							Semester
						</button>
						<button type="button" class="btn btn-info pull-left" style="margin-left: -20px;"
							data-toggle="modal" data-target=#search_student_semester id="search-box" >
							<span class="glyphicon glyphicon-search"> Filter </span>
						</button>
					</h3>

				</div>
			</div>
			<!-- ============ main title content ends here ============= -->
			
	<!-- Search Modal Modal -->
	<div id="search_student_semester" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Filter</h4>
	      </div>
	      <div class="modal-body">
	        <div class="row">
    			<div  class="col-sm-6 form-group">
    				<label>Student id: <span class="astriek">*</span></label>
					<input type="number" class="form-control" placeholder="search student by Id" name="st_search" id="st_search">
				</div>
			</div>
			<div class="row">
				<div  class="col-sm-4 form-group">
					<label>Program Name: <span class="astriek">*</span></label>
					<input type="text" class="form-control" placeholder="search by program" name="pr_search" id="pr_search">
				</div>
				<div  class="col-sm-4 form-group">
					<label>Batch Year: <span class="astriek">*</span></label>
					<input type="text" class="form-control" placeholder="Batch Year" name="ba_search" id="ba_search">
				</div>
				<div  class="col-sm-4 form-group">
					<label>Semester no: <span class="astriek">*</span></label>
					<input type="text" class="form-control" placeholder="Semester" name="se_search" id="se_search">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Class Name:</label>
					<input type="text" class="form-control" placeholder="search by Class Name" name="cl_search" id="cl_search">
				</div>
				<div class="form-group col-sm-6">
				  	<label>Semester Status</label>
				  	<input type="radio" name="s-completed" value="1">Completed
					<input type="radio" name="s-completed" value="0">OnGoing
				</div>
  			</div>
		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							 <button class="btn btn-success" id="Search">Search</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	<!-- Search Modal ends here -->
    	
		
		<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">

						<div class="panel box box-default">
							<div class="box-header with-border">
								<br>
								<div class="table-responsive">
									<table id="mytable" class="table table-bordered table-condensed table-hover table-striped">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkall" /></th>
												<th>student_id</th>
												<th>semester_id</th>
												<th>is_completed</th>
												<th>class_id</th>
												<th>status</th>
												<th colspan="2">Options</th>

											</tr>
										</thead>
										<tbody id="table-body">
										
										</tbody>
										
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="pager_outer">
    					<ul class="pager">
    					</ul>
    				</div>
				</div>
										
    </div>
  </div>
</div>

	<!-- Semester Modal starts here -->
		<div class="modal fade" id="add_student_semester" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="modal-title">Student_Semester</h4>
					</div>
					<form action="../Add_Student_Semester" enctype="multipart/form-data" method="Post">
      <div class="modal-body">
        				
						  
						  <div class="form-group">
						    <label>Faculty: <span class="astriek">*</span></label>
						    <select required class="form-control" id="faculty-box" name="faculty_id">
								
							</select>
						  </div>
						  <div class="form-group">
						    <label>Programme: <span class="astriek">*</span></label>
						    <select required class="form-control" id="program-box" name="program_id">
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
						  	<label>Semester Status</label>
						  	<input type="radio" name="status" required checked value="1">Active
							<input type="radio" name="status" value="0">Completed
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
	
	
	<!-- Semester Modal starts here -->
		<div class="modal fade" id="edit_semester_modal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="e-title">Edit Semester</h4>
					</div>
					<form action="../Semester_update_Controller" enctype="multipart/form-data" method="Post">
      <div class="modal-body">
        				<div class="row">
						  <div class="form-group col-sm-6">
						    <label>Faculty: <span class="astriek">*</span></label>
						    <select required class="form-control" id="e-faculty-box" name="faculty_id">
								
							</select>
						  </div>
						  <div class="form-group col-sm-6">
						    <label>Programme: <span class="astriek">*</span></label>
						    <select required class="form-control" id="e-program-box" name="program_id">
								<option value="" disabled >Select Programme</option>
							</select>
						  </div>
						 </div>
						 <div class="row">
						  <div class="form-group col-sm-6">
						    <label>Batch: <span class="astriek">*</span></label>
						    <select required class="form-control" name="batch_id" id="e-batch-box">
								<option value="" disabled>Select Batch</option>
							</select>
						  </div>
						  <div class="form-group col-sm-6">
						    <label>Semester no.: <span class="astriek">*</span></label>
						    	<input type="number" id="e-sem-no" name="semester_no" required class="form-control" placeholder="Semester number">
						  </div>
						 </div>
						 <div class="row">
						  <div class="form-group col-sm-6">
						    <label>Semester Start Date: </label>
						    	<input type="date" id="e-start_date" name="start_date" class="form-control" placeholder="yyyy/mm/dd">
						  </div>
						  <div class="form-group col-sm-6">
						    <label>Semester End Date: </label>
						    <input type="date" id="e-end_date" name="end_date" class="form-control" placeholder="yyyy/mm/dd">
						  </div>
						  </div>
						  <div class="form-group">
						  	<label>Semester</label>
						  	<input type="radio" name="e-status" required value="1">Active
							<input type="radio" name="e-status" value="0">Completed
						</div>
						  
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				         <button type="submit" class="btn btn-success" id="e-submit">Update</button>
				      </div>
				      </form>
				</div>

			</div>
		</div>
	<!-- Semester Modal ends here -->
	
	<!-- Semester Delete modal -->
	<div class="modal fade" id="delete_semester_modal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
						<div class="modal-body">
							<h3 >
								Are you sure you want to delete this item?
								<br>
								<strong id="d-semester-id"></strong></h3>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit"  class="btn btn-danger">Delete</button>
						</div>
				</div>

			</div>
		</div>
	<!-- Semester Delete modal ends here -->


<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>


<script>

function load_faculty(e) {
	var id=document.getElementById("faculty-box").value;
	//alert("s"+e.target.id);
	var getid = e.target.id;
	var url="../ajax_faculty_load";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			if(getid=="modal-box" || getid=="faculty-box"){
				document.getElementById("faculty-box").innerHTML=return_data;	
			}else if(getid=="edit"){
				document.getElementById("e-faculty-box").innerHTML=return_data;
			}else {
				document.getElementById("p-faculty-box").innerHTML=return_data;
			}
			
		}
	}
	aj.send(id);
}

function load_program(e) {
	e = e || window.event;
	//var target = e.target || e.srcElement;
	var getid = e.target.id;
	//alert(getid);
	//var id = getid.value;
	//alert(id);
	
	if(getid=="faculty-box"){
		var id=document.getElementById("faculty-box").value;
	}else if(getid=="e-faculty-box"){
		var id=document.getElementById("e-faculty-box").value;
	}else {
		var id=document.getElementById("p-faculty-box").value;
	}
	var url="../aja";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			if(getid=="faculty-box"){
				document.getElementById("program-box").innerHTML=return_data;	
			}else if(getid=="e-faculty-box"){
				document.getElementById("e-program-box").innerHTML=return_data;	
			}else {
				document.getElementById("p-program-box").innerHTML=return_data;
			}
		}
	}
	aj.send(idSend);
}

function load_batch_year(e) {
	var getid = e.target.id;
	//alert(getid);
	if(getid=="program-box"){
		var id=document.getElementById("program-box").value;
	}else {
		var id=document.getElementById("e-program-box").value;
	}
	//var id=document.getElementById("program-box").value;
	var url="../ajax_year_load";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			if(getid=="program-box"){
				document.getElementById("batch-box").innerHTML=return_data;	
			}else {
				document.getElementById("e-batch-box").innerHTML=return_data;
			}
		}
	}
	aj.send(idSend);
}

$('#st_search').click(function() {
	var id = $('#st_search').val();
	alert(id);
	var url="../ajax_student_search";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	aj.onreadystatechange = function() {
		if (aj.readyState == 4 && aj.status == 200) {
			var json = eval('(' + aj.responseText + ')');
		}
	}
	aj.send(idSend);
});



function load_semester(){
	var id=document.getElementById("p-program-box").value;
	var url="../ajax_semester_load";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	aj.onreadystatechange = function() {
		if (aj.readyState == 4 && aj.status == 200) {
			var json = eval('(' + aj.responseText + ')');
	        var c = '';
	        alert(json.tableData[0].batch_year);
	        alert("total row="+json.TotalRowCount);
	        if(json.tableData.length<1){
	        	//$("#mytable").hide();
	        }else {
	        	$("#mytable").show();
	            for (var i = 0; i < json.tableData.length; i++) {
	            	c += '<tr id=\"row'+json.tableData[i].semester_id+' \">';
	            	c += '<td><input type=\"checkbox\" class=\"checkthis\" /></td>';
		            c += '<td>' + json.tableData[i].semester_id + '</td>';
		            c += '<td>' + json.tableData[i].semester_no + '</td>';
		            c += '<td>' + json.tableData[i].program_id + '</td>';
		            c += '<td>' + json.tableData[i].batch_year + '</td>';
		            c += '<td>' + json.tableData[i].start_date + '</td>';
		            c += '<td>' + json.tableData[i].end_date + '</td>';
		            c += '<td>' + json.tableData[i].status + '</td>';
		            
		            c += '<td><button type=\"button\" class=\"btn btn-info pull-right\" data-toggle=\"modal\" data-target=#edit_semester_modal id=\"edit\" onClick=\"load_edit('+json.tableData[i].semester_id+');\">Edit <span class=\"glyphicon glyphicon-pencil\"></span></button></td>';
		            c += '<td><button type=\"button\" class=\"btn btn-danger pull-right\" data-toggle=\"modal\" data-target=#delete_semester_modal id=\"delete\" onClick=\"load_delete('+json.tableData[i].semester_id+');\">Delete <span class=\"glyphicon glyphicon-trash\"></span></button></td>';
		            c += '</tr>';
	            }
	            $('#table-body').html(c); 
	            
	        }
	     }
	}
aj.send(idSend);
}
function load_edit(id){
	//alert(x);
	document.getElementById("e-title").innerHTML="Lets Update this";	
	load_faculty(event);
	var url="../ajax_semester_load";
	var idSend="semester_id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	aj.onreadystatechange = function() {
		if (aj.readyState == 4 && aj.status == 200) {
			
			var json = eval('(' + aj.responseText + ')');
	        
	        if(json.length<1){
	        }else {
	            for (var i = 0; i < json.length; i++) {
	            	
	            	//document.getElementById("e-faculty-box").value=1;
	            	//document.getElementById("e-faculty-box").change();
	            	//document.getElementById("e-program-box").value=json[i].program_id;
	            	//document.getElementById("e-batch-box").value=json[i].batch_year;
	            	document.getElementById("e-sem-no").value=json[i].semester_no;
	            	document.getElementById("e-start_date").value=json[i].start_date;
	            	document.getElementById("e-end_date").value=json[i].end_date;
	            	//document.getElementById("e-status").value=json[i].status;
		            
	            }
	        }
	     }
	}
	aj.send(idSend);
	
}

function load_delete(id){
	document.getElementById("d-semester-id").innerHTML="semester_id: "+id;
	var idSend="semester_id="+id;
	var url="../semester_delete";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	aj.onreadystatechange = function() {
		if (aj.readyState == 4 && aj.status == 200) {
			//$('#"\ row'+json[i].semester_id+'"\ ').hide();
	     }
	}
	aj.send(idSend);
}



// for table
$(document).ready(function(){
	$("#mytable").hide();
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});


</script>

</body>
</html>