

<jsp:include page="staff-header.jsp"/>


  <div class="container-fluid display-table">
    <div class="row display-table-row">

    <jsp:include page="staff-sidemenu.jsp"/>
     

      <!-- Content Area -->
      <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

       <ol class="breadcrumb">
        <li><a href="staff-dashboard.html"><span class="glyphicon glyphicon-home"> Home</span></a></li>
        <li><a><span class="glyphicon glyphicon-education black"> Settings</span></a></li>
      </ol>


      <div class="panel-group" id="first-one">   

        <div class="panel panel-default">
          <div class="panel-heading main-color-bg">
            <a href="settings.jsp" class="btn btn-active"> 
                  <b><span class="glyphicon glyphicon-pencil"> Settings </span></b>
                </a> 
          </div>
          <div class="panel-body">
            <p>Settings div</p>
          </div>
        </div>

      </div>


      
    </div>
    
    <!-- --------------------------------------------------------------- -->



  </div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/default.js"></script>
</body>
</html>
