
  <jsp:include page="admin-header.jsp"/>


    <div class="container-fluid display-table">
      <div class="row display-table-row">

      <jsp:include page="admin-sidemenu.jsp"/>
        

        <!-- Content Area -->
        <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

          <ol class="breadcrumb">
            <li><a href="admin-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home </span></a></li>
            <li><a><span class="glyphicon glyphicon-user black"> Add-Staffs </span></a></li>
          </ol>


          <div class="panel-group">   

            <div class="panel panel-default profile-panel">
              <div class="panel-heading main-color-bg">
                <a href="addstaffs.jsp" class="btn btn-active"> 
                  <b><span class="glyphicon glyphicon-plus"> Add Staffs </span></b>
                </a> |
                <a href="managestaffs.jsp" class="btn btn-inactive"> 
                  <span class="glyphicon glyphicon-pencil"> Manage Staffs </span> 
                </a>
              </div>
              <div class="panel-body" id="stu">


                <div class="col-lg-12">
                  <form class="" action="" enctype="multipart/form-data" method="post">
                   <div class="col-lg-4 col-sm-4 col-xs-12 profile-info ">
                    <table class="table tabel-responsive"> 
                     <tr><td>
                      <div class="text-center" id="profile-image">
                       <img src="me.jpg" alt="image upload"/>
                     </div></td>
                   </tr>
                   <tr>
                    <td><input type="file" id="inputfile" name="filepath" class="form-control"></td>
                  </tr>
                  <tr><td><h3 class="text-center"><i><b>Staff</b></i></h3></td></tr>
                </table>               
              </div>

              <div class="col-lg-4 col-sm-4 col-xs-12 profile-info">
                <table class="tabel tabel-responsive">
                 <tr>
                  <td>Firstname: <span class="astriek">*</span> </td>
                  <td><input type="text" placeholder="Firstname" class="form-control" required name="fname"></td>
                </tr>
                <tr>
                  <td>Middle Name: </td>
                  <td><input type="text" placeholder="Middlename" class="form-control" name="mname"></td>
                </tr>
                <tr>
                  <td>LastName: <span class="astriek">*</span> </td>
                  <td><input type="text" placeholder="Lastname" class="form-control" required name="lname"></td>
                </tr>
                <tr>
                  <td>Gender: <span class="astriek">*</span> </td>
                  <td>
                    <label class="radio-inline"><input type="radio" name="gender" required value="male">Male</label>
                    <label class="radio-inline"><input type="radio" name="gender" value="female">Female</label>
                  </td>
                </tr>
                <tr>
                  <td>Staff ID: </td>
                  <td><input type="text" placeholder="ID" class="form-control" required name="id"></td>
                </tr>
                <tr>
                  <td>Phone: </td>
                  <td><input type="number" placeholder="Phone" class="form-control" name="phone"></td>
                </tr>
                <tr><td>Email: </td>
                  <td><input type="email" placeholder="email" class="form-control" name="email"></td>
                </tr>
              </table>
            </div>


            <div class="col-lg-4 col-sm-4 col-xs-12 profile-info">
              <table class="tabel tabel-responsive">
               <tr>
                <td>Post: <span class="astriek">*</span> </td>
                <td>
                  <select required class="form-control" id="sel1">
                    <option value="" disabled selected> Select Post </option>
                    <option>Management</option>
                    <option>Accountant</option>
                    <option>Librarian</option>
                    <option>Lab Assistant</option>
                    <option>Other</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td>Salary: </td>
                <td>
                  <input type="number" placeholder="salary" class="form-control" name="salary">
                </td>
              </tr>
              <tr>
                <td>Address: </td>
                <td>
                 <input type="text" placeholder="address" class="form-control" name="address">
               </td>
             </tr>
             <tr>
              <td>Username: </td>
              <td><input type="text" placeholder="username" class="form-control" name="username"></td>
            </tr>
            <tr><td>Password: </td>
              <td><input type="password" class="form-control" name="password"></td>
            </tr>
            <tr>
              <td>Time: <span class="astriek">*</span> </td>
              <td>
                <label class="radio-inline"><input type="radio" name="status" required checked value="fulltime">Full-time</label>
                <label class="radio-inline"><input type="radio" name="status" value="parttime">Part-time</label>
              </td>
            </tr>
            <tr>
              <td colspan="2"><input type="submit" class="btn btn-success btn-block" value="Submit"></td>
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
