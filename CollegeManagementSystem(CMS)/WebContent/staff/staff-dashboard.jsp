

<jsp:include page="staff-header.jsp"/> 

<div class="container-fluid display-table">
  <div class="row display-table-row">

<jsp:include page="staff-sidemenu.jsp"/> 
    

    <!-- Content Area -->
    <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

    <ol class="breadcrumb">
        <li><a href="staff-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home</span></a></li>
        <li><a><span class="glyphicon glyphicon-blackboard black"> Dashboard</span></a></li>
    </ol>

     <div class="panel-group" id="first-one">   

      <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Overview</h3>
              </div>
              <div class="panel-body">
                <div class="col-md-6">
                  <div class="well dash-box">
                    <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h2>
                    <h4>Calendar</h4>
                  </div>
                </div>
                <div class="col-md-6">
                   <div class="event-info">
                      <ul>
                        <li>
                          <a href="#"><img class="event-uploader-image pull-left" src="images/me.jpg" alt=""></a>
                        </li>
                        <li>
                          <p class="small"><a href="#" class="black">{uloader name}</a> at {time, date} </p>
                        </li>
                        <li><p>All the UI design must be completed within, 2 weeks</p></li>
                      </ul>
                    </div>
                    <div class="event-info">
                      <ul>
                        <li>
                          <a href="#"><img class="event-uploader-image pull-left" src="images/me.jpg" alt=""></a>
                        </li>
                        <li>
                          <p class="small"><a href="#" class="black">Shrawan Adhikari</a> at {10:05PM 2017/08/06} </p>
                        </li>
                        <li><p>This is the next notice</p></li>
                      </ul>
                    </div>
                </div>
                </div>
              </div>


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
