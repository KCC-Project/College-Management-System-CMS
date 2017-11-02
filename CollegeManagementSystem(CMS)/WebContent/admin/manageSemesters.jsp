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
						<button type="button" class="btn btn-info pull-left" style="margin-left: -20px;"
							data-toggle="modal" data-target=#search_semester_modal id="filter-box" >
							<span class="glyphicon glyphicon-search"> Filter </span>
						</button>
					</h3>

				</div>
			</div>
			<!-- ============ main title content ends here ============= -->
			
			<!-- Semester Delete modal -->
	<div class="modal fade" id="search_semester_modal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
						<div class="modal-body">
					    		<div class="row">
					    			<div class="col-sm-6">
									    <label>Faculty: <span class="astriek">*</span></label>
									    <select required class="form-control" id="p-faculty-box" name="faculty_id" >
											
										</select>
								  	</div>
									  <div class="col-sm-6">
									    <label>Programme: <span class="astriek">*</span></label>
									    <select required class="form-control" id="p-program-box" name="program_id">
											<option value="" disabled selected>Select Programme</option>
										</select>
									  </div>
					    		</div>
					    		<div class="row">
					    			<div class="col-sm-6">
									    <label> <span class="astriek">Optional Fields: <i class="fa fa-angle-down" aria-hidden="true"></i></span></label>
								  	</div>
								</div>
					    		<div class="row">
									<div class="col-sm-4 form-group">
										<label>Semester no.: <span class="astriek"></span></label>
										<select required class="form-control" id="p-semester-no" name="semester_no">
											<option value="" disabled selected>Select Semester</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
										</select>										</div>
									<div  class="col-sm-4 form-group">
										<label>Batch: <span class="astriek"></span></label>
											    <select required class="form-control" name="batch_id" id="p-batch-box">
													<option value="" disabled selected>Select Batch</option>
												</select>
									</div>
									<div class="form-group col-sm-4">
									  	<label>Semester Status: </label>
									  	<div class="form-control">
									  	<input type="radio" name="s-semester" id="p-inactive" value="0" required>Inactive
										<input type="radio" name="s-semester" id="p-active" value="1" checked>Active
										</div>
									</div>
					    	</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							 <button class="btn btn-success" id="go">Go</button>
						</div>
				</div>

			</div>
		</div>
	<!-- Semester Delete modal ends here -->
    	
    	
		
		<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">

						<div class="panel box box-default">
							<div class="box-header with-border">
								<br>
								<div class="table-responsive">
									<table id="mytable" class="table table-bordered table-condensed table-hover table-striped">
										<thead id="table-head">
											<tr>
												<th><input type="checkbox" id="checkall" /></th>
												<th>Semester_id</th>
												<th>Batch_year</th>
												<th>Program_name</th>
												<th class="bg-info">Semester_no</th>
												<th>Sem_start_date</th>
												<th>Sem_end_date</th>
												<th class="bg-info">Status</th>
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
					<div class="pull-left col-sm-2" id="page-info">
						 <label>Limit: </label>
    					<select class="form-control" id="limit-box" name="limit">
								<option value="5" selected>5</option>
								<option value="10" >10</option>
								<option value="25" >25</option>
								<option value="50" >50</option>
						</select>
    				</div>
					<div class="pager_outer pull-right col-sm-10">
    					<ul class="pager" id="page-links">
    					</ul>
    					
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
						<h4 class="modal-title" id="modal-title">Add Semester</h4>
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
	
	
	<!-- Semester edit Modal starts here -->
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
						    <label>Semester Id: <span class="astriek">*</span></label>
						    <input class="form-control" type="text" id="semester_id" disabled>
						  </div>
						  <div class="form-group col-sm-6">
						    <label>Program: <span class="astriek">*</span></label>
						    <input class="form-control" type="text" id="program_name" disabled>
						  </div>
						 </div>
						 <div class="row">
						  <div class="form-group col-sm-6">
						    <label>Batch: <span class="astriek">*</span></label>
						    <select required class="form-control" name="batch_id" id="e-batch-box">
							</select>
						  </div>
						  <div class="form-group col-sm-6">
						    <label>Semester no.: <span class="astriek">*</span></label>
								<select required class="form-control" id="e-semester-no" name="semester_no">
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
<script src="../Resources/js/bootstrap-editable.min.js"></script>


<script>

$(document).ready(function(){
	$("#filter-box").click(function(event){ load_faculty(event, "p-faculty-box"); });
	$("#modal-box").click(function(event){ load_faculty(event, "faculty-box"); });
	$("#p-faculty-box").change(function(event){ load_program(event, "p-program-box"); });
	$("#p-program-box").change(function(event){ load_batch_year(event, "p-batch-box"); });
	
	$("#faculty-box").change(function(event){ load_program(event, "program-box"); });
	$("#program-box").change(function(event){ load_batch_year(event, "batch-box"); });
	$("#e-faculty-box").change(function(event){ load_program(event, "e-program-box"); });
	$("#e-program-box").change(function(event){ load_batch_year(event, "e-batch-box"); });
	
	$("#go").click(function(event){ 
		var id = document.getElementById("p-program-box").value;
		var batch_id = document.getElementById("p-batch-box").value;
		var semester_no = document.getElementById("p-semester-no").value;
		var status_selected = $('input[name=s-semester]:checked').val();
		var data = "id=" + id;
		if(batch_id && !isNaN(batch_id)){ data+= "&batch_id=" + batch_id; }
		if(semester_no && !isNaN(semester_no)){ data+= "&semester_no=" + semester_no; }
		if(status_selected){ data+= "&semester_status=" + status_selected; }
		
		var arr = [data];
		alert(data);
		//var limit=document.getElementById("limit-box").value;
		load_semester(arr,1,5);
	});
	$("#page-info").hide();
});
	
function load_faculty(e, target) {
	var url="../ajax_faculty_load";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			alert('#' + target);
			$('#' + target).html(return_data);
		}
	}
	aj.send();
}

function load_program(e, target) {
	var getid = e.target.id;
	var id = $('#'+getid).find(":selected").val();
	var url="../aja";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			$('#' + target).html(return_data);
		}
	}
	aj.send(idSend);
}

function load_batch_year(e, target) {
	var getid = e.target.id;
	var id = $('#'+getid).find(":selected").val();
	var url="../ajax_year_load";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			$('#' + target).html(return_data);
		}
	}
	aj.send(idSend);
}


function load_semester(arr,page, limit){
	//var pageId = getParameterByName('pageId');
	//var pageId = $.urlParam('pageId');
	//if(pageId!=null){	
	//	var page = pageId; }
	//else {	
	//	var page = 1; }
	var data = arr[0];
	arr[0]+="&page="+ page + "&limit="+limit;
	//alert("page:"+pageId);
	//alert("data:"+arr[0]);
	var url="../ajax_semester_load";
	//alert(arr[0]);
	//var idSend='id=' + id + '&page=' + page;
	//var arr = [ url, send ];
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	aj.onreadystatechange = function() {
		if (aj.readyState == 4 && aj.status == 200) {
			var json = eval('(' + aj.responseText + ')');
	        var c = '';
	        if(json.tableData.length<1){
	        	$("#mytable").hide();
	        	$("#page-info").hide();
	        }else {
	        	$("#mytable").show();
	        	$("#page-info").show();
	            for (var i = 0; i < json.tableData.length; i++) {
	            	c += '<tr id=\"row'+json.tableData[i].semester_id+' \">';
	            	c += '<td><input type=\"checkbox\" class=\"checkthis\" /></td>';
		            c += '<td class="semester_id">' + json.tableData[i].semester_id + '</td>';
		            c += '<td class="batch_year">' + json.tableData[i].batch_year + '</td>';
		            c += '<td class="program_name">' + json.tableData[i].program_name + '</td>';
		            c += '<td class="semester_no">' + json.tableData[i].semester_no + '</td>';
		            c += '<td class="sem_start_date">' + json.tableData[i].sem_start_date + '</td>';
		            c += '<td class="sem_end_date">' + json.tableData[i].sem_end_date + '</td>';
		        	var status = json.tableData[i].status;
		        	var semester_status;
		            if (status === 0) {
						semester_status="Inactive";
					}else if(status === 1){
						semester_status="Active";
					}
		            c += '<td class="semester_status">' + semester_status + '</td>';
		            
		            c += '<td><button type=\"button\" class=\"btn btn-info pull-right\" data-toggle=\"modal\" data-target=#edit_semester_modal id=\"edit\" onClick=\"load_edit('+json.tableData[i].semester_id+');\">Edit <span class=\"glyphicon glyphicon-pencil\"></span></button></td>';
		            c += '<td><button type=\"button\" class=\"btn btn-danger pull-right\" data-toggle=\"modal\" data-target=#delete_semester_modal id=\"delete\" onClick=\"load_delete('+json.tableData[i].semester_id+');\">Delete <span class=\"glyphicon glyphicon-trash\"></span></button></td>';
		            c += '</tr>';
	            }
	            
	            $('#table-body').html(c); 
	            var total_pages = json.TotalPage;
	            pagination_view(data, total_pages, page);
	            editableInitialize();
	        }
	     }
	}
aj.send(arr);
}

function pagination_view(data, total_pages, current_page) {
	//var pageId = getParameterByName('pageId');
	//var pageId = $.urlParam('pageId');
	if(current_page!=null){	
		var pageNo = current_page; }
	else {	
		var pageNo = 1; }
	//$('#page-info').html(json.tableData.length+" out of "+json.TotalRow+" results");
    var p ='';
    if(pageNo>1)
    {
        //show previous, if its in page 1 then it is inactive
        p+= "<li><a href='#' data-page='" + (pageNo-1) + "' class='button'>PREVIOUS</a></li>";
    }
       

    //show all the page link with page number. 
            for(var x=1;x<=total_pages;x++)
            {
                if(x==pageNo) { p+= "<li><a href='#' data-page='" + (pageNo-1) + "' class='active'>"+ x +"</li>"; }
                
                else { p+= "<li><a href='#' data-page='"+x+"'>"+ x +"</a></li>"; }
            }


    if(pageNo!=total_pages)
    {
        //Go to previous page to show next 10 items.
        p+= "<li align='right'><a href='#' data-page='" + (Number(pageNo)+1) + "' class='button'>NEXT</a></li>";
    }
    $('#page-links').html(p);
    $('#page-links a[href]').click(function(e) {
    	e.preventDefault();
    	var arr = [data];
    	var page = $(this).attr("data-page");
		alert(page);
		var limit=document.getElementById("limit-box").value;
		alert("page:"+page+"limit: "+ limit);
    	load_semester(arr, page,limit); 
    });
    $('#limit-box').change(function(e){
    	var arr = [data];
		var limit=document.getElementById("limit-box").value;
    	load_semester(arr, 1,limit);
    });
}

function load_edit(id){
	//alert(x);
	document.getElementById("e-title").innerHTML="Lets Update this";	
	//load_faculty(event);
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
	        	alert(aj.responseText);
	            for (var i = 0; i < json.length; i++) {
	            	
	            	//document.getElementById("e-faculty-box").change();
	            	
	            	document.getElementById("semester_id").placeholder=json[i].semester_id;
	            	document.getElementById("program_name").placeholder=json[i].program_id;
	            	var jsony = year_load();
	            	alert(jsony);
	            	
	            	var option_results = "";
	            	for (var i=0; i<year_json.length; i++){
		            	//option_results+= '<option value='+json[i][0]+'>'+json[i][1]+'>';
	            	}
	            	//$('#e-batch-box').append(option_results);
	            	document.getElementById("e-batch-box").value=json[i].batch_year;
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

function year_load() {
	var idSend=1;
	var url="../year_load";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			alert(return_data);
			return return_data;
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

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
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

function editableInitialize(){
		
	// call makeEditable function (target-id, (td)selector-class, number-string-any )
	makeEditable("table-body", "semester_no", "number", "text", "");
	
	$('td.semester_no').on('save', function(e, params) {
	    //alert('Saved value: ' + params.newValue);
	    var value = params.newValue;
	    var semester_id = $(this).closest('tr').find('.semester_id').text(); 
	    //var semester_id = 9;
	    
	    $.ajax({
			url : "../update_semester_no",
			method : "POST",
			cache : true,

			data : {
				semester_id : semester_id,
				semester_no : value
			},
			success : function(data) {
				$(this).addClass("tdsucess");
				//$('td.semester_no').delay(1000).fadeOut('slow');
			},
			error : function() {
				$(this).addClass("tderror");
				//$('td.semester_no').delay(1000).fadeOut('slow');
			}
		});
	});
	
	var semester_status_source  = [{"value":"1","text":"Active"},{"value":"0","text":"Inactive"}];
	makeEditable("table-body", "semester_status", "number", "select", semester_status_source);
	
	$('td.semester_status').on('shown', function(e, editable) {
		var semester_status = $(this).closest('tr').find('.semester_status').text(); 
		if (semester_status == "Active"){
			 editable.input.$input.val(1);
		}
		else {
			 editable.input.$input.val(0);
		}
	});
	
	$('td.semester_status').on('save', function(e, params) {
	    //alert('Saved value: ' + params.newValue);
	    var value = params.newValue;
	    alert("the val is: "+value)
	    var semester_id = $(this).closest('tr').find('.semester_id').text(); 
	    //var semester_id = 9;
	    
	    $.ajax({
			url : "../supdate_semester_no",
			method : "POST",
			cache : true,

			data : {
				semester_id : semester_id,
				semester_status : value
			},
			success : function(data) {
				$(this).addClass("tdsucess");
				//$('td.semester_no').delay(1000).fadeOut('slow');
			},
			error : function() {
				$(this).addClass("tderror");
				//$('td.semester_no').delay(1000).fadeOut('slow');
			}
		});
	});
}
	
	
	
	
	
	function makeEditable(target, selector, fieldType, type, source){
		$('#'+target).editable({
			container : 'body',
			selector : 'td.'+selector+'',
			title: selector,
			type: type,
			source: source,
			validate : function(value) {
				if(fieldType == 'number'){
						if ($.trim(value) == '') {
							return 'This field is required';
						}
						var regex = /^[0-9]+$/;
						if (!regex.test(value)) {
							return 'Numbers only!';
						}
						
					}
				else if(fieldType=="string") {
						if ($.trim(value) == '') {
							return 'This field is required';
						}
						var regex = /^[A-z]+$/;
						if (!regex.test(value)) {
							return 'Numbers not allowed!';
						}
				}
				else {
						if ($.trim(value) == '') {
							return 'This field is required';
						}
				}
			}
		
		
		});
	}

</script>

</body>
</html>