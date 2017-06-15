
<jsp:include page="staff-header.jsp"/>


<div class="container-fluid display-table">
  <div class="row display-table-row">

    <jsp:include page="staff-sidemenu.jsp"/>
    

    <!-- Content Area -->
    <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

      <ol class="breadcrumb">
        <li><a href="staff-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home </span></a></li>
        <li><a><span class="glyphicon glyphicon-user black"> Attendance </span></a></li>
      </ol>


      <div class="panel-group">   

        <div class="panel panel-default profile-panel">
          <div class="panel-heading main-color-bg">
            <a href="staff-courses.jsp" class="btn btn-active"> 
              <b><span class="glyphicon glyphicon-plus"> Attendance </span></b>
            </a>
          </div>
          <div class="panel-body" id="stu">


            <div class="col-lg-12">
              <form class="" action="" enctype="multipart/form-data" method="post">
               <div class="col-lg-12 col-sm-12 col-xs-12 profile-info ">
                <table class="table tabel-responsive"> 
                  
                 <thead>
                  <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                
                <tbody>
                  <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                  <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
</body>
</html>
