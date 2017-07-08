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
        <li><a><span class="glyphicon glyphicon-education black"> Semester</span></a></li>
      </ol>

		<!-- ============= Main title content ============= -->
			<div class="box box-default with-border">
				<div style="position: relative;">
					<h3 style="margin: 0px; padding-left: 20px; height: 35px;">

						<button type="button" class="btn btn-info pull-right"
							data-toggle="modal" data-target=#add_semester_modal id="modal-box" >Add
							Semester
						</button>

					</h3>

				</div>
			</div>
			<!-- ============ main title content ends here ============= -->
    	
    	<div class="row">
    	<div id="faculty">
    			<div class="form-group col-sm-4">
			    <label>Faculty: <span class="astriek">*</span></label>
			    <select required class="form-control" id="p-faculty-box" name="faculty_id" >
					
				</select>
			  </div>
				  <div class="form-group col-sm-4">
				    <label>Programme: <span class="astriek">*</span></label>
				    <select required class="form-control" id="p-program-box" name="program_id">
						<option value="" disabled selected>Select Programme</option>
					</select>
				  </div>
				  <div class="form-group col-sm-4">
				    <button class="btn btn-success" id="go">Go</button>
				  </div>
    	</div>
    	</div>
		
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
												<th>semester_id</th>
												<th>semester_no</th>
												<th>program_id</th>
												<th>batch_year_id</th>
												<th>sem_start_date</th>
												<th>sem_end_date</th>
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
							
										
    </div>
  </div>
</div>

	<!-- Semester Modal starts here -->
		<div class="modal fade" id="add_semester_modal" role="dialog">
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
	
	
	
	<!-- edit semester model start here -->
	
	<div class="modal fade" id="edit_semester_modal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Semester</h4>
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
<!-- ------- edit semester model ends here --------- -->


<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>

<script>

window.addEventListener("load", function() {load_faculty(event); }, false)

// event listener for modal-box, to load faculty
var modalbtn = document.getElementById("modal-box");
if (modalbtn.addEventListener) {                    // For all major browsers, except IE 8 and earlier
	//modalbtn.addEventListener("click", load_program(event));
	modalbtn.addEventListener("click", function(){load_faculty(event)}, false);
} else if (modalbtn.attachEvent) {                  // For IE 8 and earlier versions
	modalbtn.attachEvent("onclick", load_faculty(event));
}

// event listener for p-faculty-box to load program of selected faculty
var pfacultybtn = document.getElementById("p-faculty-box");
if (pfacultybtn.addEventListener) {                    // For all major browsers, except IE 8 and earlier
    //facultybtn.addEventListener("click", load_program(event));
	pfacultybtn.addEventListener("change", function(){load_program(event)}, false);
} else if (pfacultybtn.attachEvent) {                  // For IE 8 and earlier versions
	pfacultybtn.attachEvent("onchange", load_program(event));
}

var facultybtn = document.getElementById("faculty-box");
if (facultybtn.addEventListener) {                    // For all major browsers, except IE 8 and earlier
    //facultybtn.addEventListener("click", load_program(event));
	facultybtn.addEventListener("change", function(){load_program(event)}, false);
} else if (facultybtn.attachEvent) {                  // For IE 8 and earlier versions
	facultybtn.attachEvent("onchange", load_program(event));
}

var programbtn = document.getElementById("program-box");
if (programbtn.addEventListener) {                    // For all major browsers, except IE 8 and earlier
    //programbtn.addEventListener("click", load_program(event));
	programbtn.addEventListener("change", function(){load_batch_year()}, false);
} else if (programbtn.attachEvent) {                  // For IE 8 and earlier versions
	programbtn.attachEvent("onchange", load_batch_year());
}

var gobtn = document.getElementById("go");
if (gobtn.addEventListener) {                    // For all major browsers, except IE 8 and earlier
	//gobtn.addEventListener("click", load_program(event));
	gobtn.addEventListener("click", function(){load_semester()}, false);
} else if (gobtn.attachEvent) {                  // For IE 8 and earlier versions
	gobtn.attachEvent("onclick", load_semester());
}

function load_faculty(e) {
	var id=document.getElementById("faculty-box").value;
	alert("s"+e.target.id);
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
	if(getid=="faculty-box"){
		var id=document.getElementById("faculty-box").value;
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
			}else {
				document.getElementById("p-program-box").innerHTML=return_data;
			}
		}
	}
	aj.send(idSend);
}

function load_batch_year() {
	var id=document.getElementById("program-box").value;
	var url="../ajax_year_load";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			document.getElementById("batch-box").innerHTML=return_data;
		}
	}
	aj.send(idSend);
}

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
	        var content = '';
	        
	        if(json.length<1){
	        	$("#mytable").hide();
	        }else {
	        	$("#mytable").show();
	            for (var i = 0; i < json.length; i++) {
	            	content += '<tr>';
	            	content += '<td> <input type="\checkbox"\ class="\checkthis"\ /> </td>';
		            content += '<td>' + json[i].semester_id + '</td>';
		            content += '<td>' + json[i].semester_no + '</td>';
		            content += '<td>' + json[i].program_id + '</td>';
		            content += '<td>' + json[i].batch_year + '</td>';
		            content += '<td>' + json[i].start_date + '</td>';
		            content += '<td>' + json[i].end_date + '</td>';
		            content += '<td>' + json[i].status + '</td>';
		            
		            content += '<td><a href="?id='+json[i].semester_id+'" class="btn btn-primary" data-placement="top" data-toggle="tooltip" title="Edit"> \
			            <span class="glyphicon glyphicon-pencil"></span></a></td>';
		            
		            content += '<td><a href="#" class="btn btn-danger" data-placement="top" data-toggle="tooltip" title="Delete"> \
		            <span class="glyphicon glyphicon-trash"></span></a></td>';
		            
		            content += '</tr>';
	            }
	        }
	          
	             $('#table-body').html(content);  
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