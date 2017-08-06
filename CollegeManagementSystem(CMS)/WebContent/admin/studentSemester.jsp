<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link href="../Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="../Resources/font-awesome/css/font-awesome.min.css">
<link href="../Resources/css/manageExam.css" rel="stylesheet"
	type="text/css">
	
<link href="../Resources/css/select2.min.css" rel="stylesheet" />
<link href="../Resources/css/select2-bootstrap.min.css" rel="stylesheet" />
	
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

						<button type="button" class="btn btn-info pull-left" style="margin-left: -20px;"
							data-toggle="modal" data-target=#search_student_semester id="filter-box" >
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
			
			<div class="row">
	   			<div class="col-sm-6">
				    <label> <span class="astriek">Student Select Options: <i class="fa fa-angle-down" aria-hidden="true"></i></span></label>
			  	</div>
			</div>    	
	        <div class="row">
    			<div  class="col-sm-6 form-group">
    				<label>Student id or Student Name: <span class="astriek">*</span></label>
    				<input class="form-control" name="student_field" id="p-student-field">
				</div>
				<div  class="col-sm-6 form-group">
    				<label>Class: <span class="astriek">*</span></label>
					<input type="text" class="form-control" placeholder="search student by Class" name="class_name" id="p-student-name">
				</div>
			</div>
		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							 <button class="btn btn-success" id="go">Search</button>
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
										<thead id="table-head">
											<tr>

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
	


<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/js/re-usable.js"></script>

<script src="../Resources/js/select2.min.js"></script>

<script>
$(document).ready(function(){
	$("#filter-box").click(function(event){ load_faculty(event, "p-faculty-box"); });
	$("#p-faculty-box").change(function(event){ load_program(event, "p-program-box"); });
	$("#p-program-box").change(function(event){ load_batch_year(event, "p-batch-box"); });
	
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
	
	$( "select" ).select2({
	    theme: "bootstrap",
	    width: "auto"
	});
});


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
	        	loadingSemesterOnly(json);
	        	$("#mytable").show();
	        	$("#page-info").show();
	            for (var i = 0; i < json.tableData.length; i++) {
	            	c += '<tr id=\"row'+json.tableData[i].semester_id+' \">';
	            	c += '<td><input type=\"checkbox\" class=\"checkthis\" /></td>';
		            c += '<td class="semester_id">' + json.tableData[i].semester_id + '</td>';
		            c += '<td class="batch_year">' + json.tableData[i].batch_year + '</td>';
		            c += '<td class="program_name">' + json.tableData[i].program_name + '</td>';
		            c += '<td class="semester_no">' + json.tableData[i].semester_no + '</td>';
		        	var status = json.tableData[i].status;
		        	var semester_status;
		            if (status === 0) {
						semester_status="Inactive";
					}else if(status === 1){
						semester_status="Active";
					}
		            c += '<td class="semester_status">' + semester_status + '</td>';
		            
		            c += '<td><button type=\"button\" class=\"btn btn-success pull-right\" id=\"edit\" onClick=\"next_semester('+json.tableData[i].semester_id+');\">Send to Next Semester <i class=\"fa fa-arrow-circle-right\"></i></button></td>';
		            c += '<td><button type=\"button\" class=\"btn btn-danger pull-right\" id=\"roll_back\" onClick=\"roll_back_semester('+json.tableData[i].semester_id+');\">Roll Back Semester <i class=\"fa fa-arrow-circle-left\"></i></button></td>';
		            c += '</tr>';
	            }
	            
	            $('#table-body').html(c); 
	            var total_pages = json.TotalPage;
	            pagination_view(data, total_pages, page);
	            //editableInitialize();
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

function loadingSemesterOnly(){
	$('#table-head tr').remove();
	var c = '';
    	c += '<tr>';
     	c += '<th><input type="checkbox" id="checkall" /></th>';
        c += '<th> Semester id </th>';
        c += '<th> Batch year </th>';
        c += '<th> Program Name </th>';
        c += '<th> Semester No</th>';
        c += '<th> Semester Status </th>';
        c += '<th colspan=\"2\"> Next Semester </th>';
        c += '</tr>';
     
     $('#table-head').html(c);
     
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
}

function next_semester(semester_id){
	if (confirm("All student of semester_id: "+semester_id+" will go into next semester") == true) {
		alert("semester_id: "+semester_id+" all students were promoted");
    } else {
    	alert("The process wasn't performed ");
    }
}

function roll_back_semester(semester_id){
	 var stat = prompt("Please enter semester_id to roll_back:", "Re-enter Semester_id to confirm");
	    if (stat == semester_id) {
	    	alert("this semester has been rolled back");
	    }
	    else {
	    	alert("Roll back wasn't performed");
	    }
}

</script>



</body>
</html>