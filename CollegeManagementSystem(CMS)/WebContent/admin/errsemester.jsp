
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
							data-toggle="modal" data-target=#add_sem_modal>Add
							Semester
						</button>

					</h3>

				</div>
			</div>
			<!-- ============ main title content ends here ============= -->
	
	
	<% for(int i=0;i<5;i++) { %>
	<div class="box-body " style="margin-bottom: 4px;">
		<div id="accordion" class="box-group">
		
			<div class="panel box box-default">
				<div class="box-header with-border">
					<h4 class="box-title" style="padding-left: 15px;">
						<span id="program_name">Program_name</span>
		
					<div class="pull-right" style="margin: 0px; padding: 0px; position: relative; margin-top: -6px;">
						<span class="btn btn-sm btn-info  hidden-xs"> 
							<i class="fa fa-users"></i> Students &nbsp; 
							<span class="badge" id="student_count">5 </span>
						</span> 
						<span class="btn btn-sm btn-warning  hidden-xs"> 
							<i class="fa fa-sitemap"></i> Classes &nbsp; 
							<span class="badge" id="class_count">1 </span>
						</span> 
						<a class="btn-sm btn btn-default" onClick=load_semester();>
							<i class="fa fa-eye"></i>
						</a> 
						<a class="btn-sm btn btn-default" onClick=edit_semester();>
							<i class="fa fa-pencil-square-o"></i>
						</a> 
						<a class="btn-sm btn btn-default" onClick=delete_semester();>
							<i class="fa fa-trash-o"></i>
						</a>
					</div>
					</h4>
				</div>
			</div>
		</div>
	</div>
<% } %>
    
    </div>
  </div>
  </div>
  
  <!-- Modal -->
<div id="add_sem_modal" class="modal fade" role="dialog">
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


<script>

window.addEventListener('load', function() {load_faculty(); }, false)

function load_faculty() {
	var id=document.getElementById("faculty-box").value;
	var url="../ajax_faculty_load";
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			document.getElementById("faculty-box").innerHTML=return_data;
		}
	}
	aj.send(id);
}

function load_program() {
	var id=document.getElementById("faculty-box").value;
	var url="../aja";
	var idSend="id="+id;
	var aj=new XMLHttpRequest();
	aj.open("POST", url, true);
	aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	aj.onreadystatechange=function(){
		if (aj.readyState==4&&aj.status==200) {
			var return_data=aj.responseText;
			document.getElementById("program-box").innerHTML=return_data;
		}
	}
	aj.send(idSend);
}

function load_batch_year() {
	var id=document.getElementById("program-box").value;
	var url="../ajax_year_load";
	var idSend="id=10";
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



</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>


</body>
</html>
