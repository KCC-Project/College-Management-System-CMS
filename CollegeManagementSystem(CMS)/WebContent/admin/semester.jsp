
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


        <div class="panel-group" id="first-one">   
        
          <div class="panel panel-default profile-panel">
            <div class="panel-heading main-color-bg">
            	<span class="btn btn-default">Semester</span>
            	<button type="button" class="btn btn-info pull-right" id="btn-addsem" data-toggle="modal" data-target="#myModal">Add Semester
				</button>
            </div>
            <div class="panel-body">
				
				 <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th> S.N </th>
                              <th> Program Name</th>
                              <th> Batch Year </th>
                              <th> Semester no. </th>
                              <th> Status </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td> 1 </td>
                              <td> BE Computer </td>
                              <td> 2013 </td>
                              <td> 7th </td>
                              <td> 1 </td>
                            </tr>
                            <tr>
                              <td> 2 </td>
                              <td> BE Computer </td>
                              <td> 2013 </td>
                              <td> 7th </td>
                              <td> 1 </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
				
			</div>
          </div>
        </div>


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
      <div class="modal-body">
        <form>
						  <div class="form-group">
						    <label>Faculty: <span class="astriek">*</span></label>
						    <select required class="form-control" id="faculty-box" onChange="load_program();">
								
							</select>
						  </div>
						  <div class="form-group">
						    <label>Programme: <span class="astriek">*</span></label>
						    <select required class="form-control" id="program-box" onChange="autoSelectBatch();">
									
							</select>
						  </div>
						  <div class="form-group">
						    <label>Batch: <span class="astriek">*</span></label>
						    <select required class="form-control" id="batch-box">
								<option value="" disabled selected>Select Batch</option>
							</select>
						  </div>
						 
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         <button type="submit" class="btn btn-success">Submit</button>
      </div>
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

</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
</body>
</html>


</body>
</html>
