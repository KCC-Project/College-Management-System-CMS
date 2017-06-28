
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
            <div class="panel-heading main-color-bg">Profile</div>
          </div>
        </div>

        <!-- page start-->
        <div class="row">
         <div class="col-lg-12">
          <section class="panel semester-panel">
            <header class="panel-heading">
              <ul class="nav nav-tabs">
                <li class="active">
                  <a data-toggle="tab" href="#add-semester">
                    <i class="glyphicon glyphicon-home"></i>
                    Add Semester
                  </a>
                </li>
                <li>
                  <a data-toggle="tab" href="#view-semester">
                    <i class="glyphicon glyphicon-user"></i>
                    View Semester
                  </a>
                </li>
              </ul>
            </header>

            <div class="panel-body">
              <div class="tab-content">
                <div id="add-semester" class="tab-pane active">
                  <div class="profile-activity">

                    <div class="event-info">
                      <ul>
                        
                      </ul>
                    </div>
                    <div class="event-info">
                      <ul>
                        
                      </ul>
                    </div>


                  </div>
                </div>

                <!-- profile -->
                <div id="view-semester" class="tab-pane">
                  <section class="panel">
                    <div class="panel-body profile-panel">
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
                  </section>
                </div>

              </div>
            </div>
          </section>
        </div>
      </div>


    </div>
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


</body>
</html>
