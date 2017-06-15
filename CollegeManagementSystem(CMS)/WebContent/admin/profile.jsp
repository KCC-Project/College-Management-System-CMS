
<jsp:include page="admin-header.jsp"/>


  <div class="container-fluid display-table">
    <div class="row display-table-row">

    <jsp:include page="admin-sidemenu.jsp"/>
     

      <!-- Content Area -->
      <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

       <ol class="breadcrumb">
        <li><a href="admin-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home</span></a></li>
        <li><a><span class="glyphicon glyphicon-education black"> Profile</span></a></li>
      </ol>


        <div class="panel-group" id="first-one">   

          <div class="panel panel-default profile-panel">
            <div class="panel-heading main-color-bg">Profile</div>
            <div class="panel-body" id="">

              <div class="col-lg-4 col-sm-4 profile-info">
                <h4 class="text-center">FullName: Shrawan Adhikari</h4>               
                <div class="text-center" id="profile-image">
                  <img class="" src="me.jpg" alt="">
                </div>
                <h6 class="text-center">usertype: Administrator</h6>
              </div>

              <div class="col-lg-4 col-sm-4 profile-info">
                <p>Full Name: Shrawan Adhikari</p>
                <p>Address: Kathmandu, Nepal</p>
                <p>Email: shrawan.adhikari.31@gmail.com</p>
                <p>Mobile: </p>
                <p>DateJoined:</p>
              </div>

              <div class="col-lg-4 col-sm-4 profile-info">
                <span class="h4"><i class="icon_pin_alt"></i>Roles: Password Reset, error reporting</span>
                <p>username: @shrawan_adhikari</p>
                <p><i class="fa fa-twitter">email: shrawan.adhikari.31@gmail.com</i></p>

                <br><br>
                <p class="h4"><em>Bio: One of the developer of this college management system.</em></p>
              </div>

            </div>
          </div>
        </div>

        <!-- page start-->
        <div class="row">
         <div class="col-lg-12">
          <section class="panel profile-panel">
            <header class="panel-heading">
              <ul class="nav nav-tabs">
                <li class="active">
                  <a data-toggle="tab" href="#recent-activity">
                    <i class="glyphicon glyphicon-home"></i>
                    Daily Activity
                  </a>
                </li>
                <li>
                  <a data-toggle="tab" href="#profile">
                    <i class="glyphicon glyphicon-user"></i>
                    Profile
                  </a>
                </li>
                <li class="">
                  <a data-toggle="tab" href="#edit-profile">
                    <i class="icon-envelope"></i>
                    Edit Profile
                  </a>
                </li>
              </ul>
            </header>

            <div class="panel-body">
              <div class="tab-content">
                <div id="recent-activity" class="tab-pane active">
                  <div class="profile-activity">

                    <div class="event-info">
                      <ul>
                        <li>
                          <a href="#"><img class="event-uploader-image pull-left" src="me.jpg" alt=""></a>
                        </li>
                        <li>
                          <p class="small"><a href="#">{uloader name}</a> at {time, date} </p>
                        </li>
                        <li><p>All the UI design must be completed within, 2017/08/20</p></li>
                      </ul>
                    </div>
                    <div class="event-info">
                      <ul>
                        <li>
                          <a href="#"><img class="event-uploader-image pull-left" src="me.jpg" alt=""></a>
                        </li>
                        <li>
                          <p class="small"><a href="#">Shrawan Adhikari</a> at {10:05PM 2017/08/06} </p>
                        </li>
                        <li><p>All the UI design must be completed within, 2017/08/20</p></li>
                      </ul>
                    </div>


                  </div>
                </div>

                <!-- profile -->
                <div id="profile" class="tab-pane">
                  <section class="panel">
                    <div class="panel-body profile-panel">
                      <div class="table-responsive">
                        <table class="table table-default">
                          <thead>
                            <tr>
                              <th>FirstName: {first username}</th>
                              <th>MiddleName: {middle name} </th>
                              <th>LastName: {last name} </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>Address </td>
                              <td>Text</td>
                              <td>phone </td>
                            </tr>
                            <tr>
                              <td>Cell 3</td>
                              <td>Text</td>
                              <td>Cell 4</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </section>

                </div>
                <!-- edit-profile -->
                <div id="edit-profile" class="tab-pane">
                  <section class="panel">                                          
                    <div class="panel-body profile-panel">

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
