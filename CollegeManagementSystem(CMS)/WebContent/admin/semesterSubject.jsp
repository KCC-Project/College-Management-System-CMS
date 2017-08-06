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
							data-toggle="modal" data-target=#search_semester_subject id="filter-box" >
							<span class="glyphicon glyphicon-search"> Filter </span>
						</button>
					</h3>

				</div>
			</div>
			<!-- ============ main title content ends here ============= -->
			
	<div class="ui-widget">
  				<label>Tags: </label>
  				<input id="students">
			</div>
    	
		
		
										
    </div>
  </div>
</div>
	


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/js/re-usable.js"></script>

<script src="../Resources/js/select2.min.js"></script>

<script>
$(document).ready(function(){
	$( "select" ).select2({
	    theme: "bootstrap",
	    width: "auto"
	});
	
});




</script>



</body>
</html>