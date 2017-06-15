
<jsp:include page="student-header.jsp"/>


<div class="container-fluid display-table">
  <div class="row display-table-row">

    <jsp:include page="student-sidemenu.jsp"/>
    

    <!-- Content Area -->
    <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

      <ol class="breadcrumb">
        <li><a href="student-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home </span></a></li>
        <li><a><span class="glyphicon glyphicon-user black"> Exams </span></a></li>
      </ol>


      <div class="panel-group">   

        <div class="panel panel-default profile-panel">
          <div class="panel-heading main-color-bg">
            <a href="student-exams.jsp" class="btn btn-active"> 
              <b><span class="glyphicon glyphicon-plus"> Exams </span></b>
            </a>
          </div>
          <div class="panel-body" id="stu">


            <div class="col-lg-12">
              <form class="" action="" enctype="multipart/form-data" method="post">
               <div class="col-lg-12 col-sm-12 col-xs-12 profile-info ">
                <table class="table tabel-responsive"> 
                  
                 <thead>
                  <tr>
                    <th>S.No</th>
                    <th>Subject_code</th>
                    <th>Subject_name</th>
                    <th>Exam_date</th>
                    <th>Start_time</th>
                    <th>End_time</th>
                    <th>FM</th>
                    <th>PM</th>
                    <th>Marks</th>
                    <th>Review</th>
                  </tr>
                </thead>
                
                <tbody>
                  <tr>
                    <th>1</th>
                    <th>BEG471CO</th>
                    <th>Artificial Intelligence</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>40</th>
                    <th>16</th>
                    <th></th>
                    <th></th>
                  </tr>
                  <tr>
                    <th>2</th>
                    <th>BEG490MS</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>40</th>
                    <th>16</th>
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
