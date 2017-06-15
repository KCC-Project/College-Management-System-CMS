<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>MIS</title>

  <!-- Bootstrap core CSS -->
  <link href="../Resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="../Resources/css/style.css" rel="stylesheet">
  <link href="../Resources/css/style-responsive.css" rel="stylesheet">
  <link href="../Resources/css/profile.css" rel="stylesheet">


  <link href="../Resources/plugins/summernote/dist/summernote.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../Resources/plugins/chosen/chosen.min.css">
  <link rel="stylesheet" type="text/css" href="../Resources/css/new-article.css">

</head>
<body>
  <!-- --------------------------------------  -->


<!-- Black Dashboard below the top-navigation-bar -->
<div class="container-fluid dashboard-container">
  <div class="row">
    <header id="dashboard-header">

    <!-- Side-bar toggler -->
      <div class=" pull-left" id="toggler">
        <nav class="navbar-default ">
          <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="side-menu">
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
          </button>
        </nav>
      </div>

      <!-- Dash info display -->
      <div class="hidden-xs pull-left" id="dash-info">
        <h4><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small>Manage</small></h4>
      </div>

      <!-- Dashboard search bar -->
      <div class="search-field pull-left">
        <input type="text" placeholder="search" class="form-control">
      </div>

      <!-- Dashboard, notificcation and messages -->
     <div class="" id="notification">
       <ul>
        <li class="fixed-width hidden-xs">
          <a href="#" data-toggle="tooltip" title="Notification">
            <span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
            <span class="label label-warning">3</span>
          </a>
        </li>
        <li class="fixed-width hidden-xs">
          <a href="#" data-toggle="tooltip" title="Messages">
            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
            <span class="label label-info">3</span>
          </a>
        </li>
        </ul>
        </div>

        <!--- Profile Dropdown -->
        <div class="dropdown pull-right" id="dash-profile">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
          <span class="dash-image">
              <img alt="" src="me.jpg">
          </span>
            <span class="username hidden-xs">{userName}</span>
            <span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" id="profile-menu">
            <li><a href="profile.jsp">My Profile</a></li>
            <li><a href="#">Notices</a></li>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout </a></li>
        </ul>
        </div>
         


  </header>
</div>
</div>
<!-- ------------------------------------------ -->
