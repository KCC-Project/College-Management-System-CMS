

  <jsp:include page="admin-header.jsp"/>


  <div class="container-fluid display-table">
    <div class="row display-table-row">

    <jsp:include page="admin-sidemenu.jsp"/>
     

      <!-- Content Area -->
      <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">


        <ol class="breadcrumb">
          <li><a href="iadmin-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home</span></a></li>
          <li><a><span class="glyphicon glyphicon-user black"> Manage-Staff</span></a></li>
        </ol>

        <div class="panel-group" id="first-one">   

          <div class="panel panel-default">
            <div class="panel-heading main-color-bg">
              <a href="managestaffs.jsp" class="btn btn-active"> 
                  <b><span class="glyphicon glyphicon-plus"> Manage Staffs </span></b>
                </a> |
                <a href="addstaffs.jsp" class="btn btn-inactive"> 
                  <span class="glyphicon glyphicon-pencil"> Add Staffs </span> 
                </a>
            </div>
            <div class="panel-body">
              <p>Manage Staff goes here</p>
            </div>
          </div>

          <div class="panel panel-default" id="second-one">
            <div class="panel-heading main-color-bg">Second Content</div>
            <div class="panel-body">
              <p>Second part ......... Manage Staff</p>
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
  <script src="../Resources/js/bootstrap.min.js"></script>
  <script src="../Resources/js/default.js"></script>
</body>
</html>
