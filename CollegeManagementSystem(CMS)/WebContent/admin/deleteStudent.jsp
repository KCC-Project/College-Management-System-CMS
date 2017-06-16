
<jsp:include page="admin-header.jsp" />


<div class="container-fluid display-table">
	<div class="row display-table-row">


		<jsp:include page="admin-sidemenu.jsp" />

		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">

			<div class="row">
				<h1>Are you sure you want to delete</h1>
				<form action="../deleteStudent" method="post">
					<input type="hidden" name="txtID"
						value="<%=request.getParameter("id")%>"> <input
						type="submit" value="Yes" name="deleteConfirm"
						class="btn btn-alert"> <a href="viewStudent.jsp"
						class="btn btn-primary">No</a>
				</form>
			</div>
		</div>



		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="../Resources/js/bootstrap.min.js"></script>
		<script src="../Resources/js/default.js"></script>
		</body>
		</html>