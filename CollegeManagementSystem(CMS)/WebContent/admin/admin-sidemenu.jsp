

<!-- Side Menu -->
    <div class="col-md-2 col-sm-1 display-table-cell hidden-xs valign" id="side-menu">
      <ul>
        <li class="link active">
          <a href="admin-dashboard.jsp" class="main-color-bg">
            <span class="glyphicon glyphicon-th" aria-hidden="true"></span>
            <span class="hidden-xs hidden-sm">Dashboard</span>
          </a>
        </li>

        <li class="link">
          <a href="#collapse-post" data-toggle="collapse"  aria-controls="collapse-post">
            <span class="glyphicon glyphicon-list-alt"></span>
            <span class="hidden-xs hidden-sm">Students</span>
            <span class="caret pull-right"></span>
          </a>
          <ul class="collapse collapseable" id="collapse-post">
            <li><a href="addstudents.jsp" id="add-student">Add New</a></li>
            <li><a href="managestudents.jsp" id="manage-student">Manage</a></li>
          </ul>
        </li>
        <li class="link">
          <a href="#collapse-comments" data-toggle="collapse"  aria-controls="collapse-comments">
            <span class="glyphicon glyphicon-pencil"></span>
            <span class="hidden-xs hidden-sm">Add Staff</span>
            <span class="caret pull-right"></span>
          </a>
          <ul class="collapse collapseable" id="collapse-comments">
            <li><a href="addstaffs.jsp" id="add-staff">Add New</a></li>
            <li><a href="managestaffs.jsp" id="manage-staff">manage</a></li>
          </ul>
        </li>

        <li class="link">
          <a href="managecourses.jsp" id="manage-courses">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <span class="hidden-xs hidden-sm">Manage Course</span>
          </a>
        </li>
          <li class="link">
          <a href="#collapse-notice" data-toggle="collapse"  aria-controls="collapse-notice">
            <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
            <span class="hidden-xs hidden-sm">Notices</span>
               <span class="caret pull-right"></span>
          </a>
           <ul class="collapse collapseable" id="collapse-notice">
            <li><a href="newnotice.jsp" id="add-staff">New Notice</a></li>
            <li><a href="managenotice.jsp" id="manage-staff">Manage Notice</a></li>
          </ul>
        </li>
        <li class="link settings-btn">
          <a href="settings.jsp">
            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            <span class="hidden-xs hidden-sm">Settings</span>
          </a>
        </li>

      </ul>
    </div>
    <!-- -------------------------------------------------- -->