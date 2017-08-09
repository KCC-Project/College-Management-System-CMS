<%@page import="com.model.ExamInfoModel"%>
<%@page import="com.serviceimpl.ExamInfoModelServiceImpl"%>
<%@page import="com.service.ExamInfoModelServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ExamModel"%>
<%@page import="java.util.List"%>
<%@page import="com.serviceimpl.ExamModelServiceImpl"%>
<%@page import="com.service.ExamModelServiceInterface"%>
<link href="../Resources/css/w3school.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="../Resources/font-awesome/css/font-awesome.min.css">
<link href="../Resources/css/manageExam.css" rel="stylesheet"
	type="text/css">
<link href="../Resources/css/bootstrap-editable.css" rel="stylesheet" />
<!-- select2 css -->
<link href="../Resources/css/select2.min.css" rel="stylesheet" />
<link href="../Resources/css/select2-bootstrap.min.css" rel="stylesheet" />
<jsp:include page="admin-header.jsp" />
<div class="container-fluid display-table">
	<div class="row display-table-row">
		<jsp:include page="admin-sidemenu.jsp" />
		<!-- Content Area -->
		<div class="col-md-10 col-sm-11 display-table-cell" id="content-area">
			<ol class="breadcrumb">
				<li><a href="admin-dashboard.jsp"><span
						class="glyphicon glyphicon-home"> Home</span></a></li>
				<li><a><span class="glyphicon glyphicon-education black">
							Account</span></a></li>
				<li><a><span class="glyphicon glyphicon-education black">
							Add Account</span></a></li>
			</ol>
			<!--=============================================Main Containt===============================  -->
			<div class="box box-default with-border">
				<div>
					<div style="margin: 0px; padding-left: 20px; height: 35px;">
						<a><button type="button" class="btn btn-info pull-right"
								data-toggle="modal" data-target="#addAccountModal"
								id="modal-box">Account</button></a>
						<div class="col-xs-3"
							style="margin-left: -34px; /* border: 2px solid black; */ height: 37px;">
							<div class="form-group">
								<div class="input-group">
									<select class="form-control" id="sel1"></select> <span
										class="input-group-addon"> <i class="fa fa-search"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="col-xs-7 " id="sembtn"></div>
					</div>
				</div>
			</div>
			<!--====================================================Table==================================================================  -->
			<div class="box box-primary with-border" style="margin-top: 10px;">
				<div class="row with-border" style="overflow: hidden;">
					<div class="col-lg-12 ">
						<h3 style="margin: 0px; padding-left: 20px; height: 35px;">
							<span class="hidden-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Manage Account</span> <span
								class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i> Exam Account</span>

							<button
								class="btn-sm btn btn-default pull-right viewAccountDetail"
								style="margin-top: 5px; margin-right: 10px;"
								title="View Account Details" data-toggle="modal"
								data-target="#viewAccountDetail" id="#viewAccountDetail">
								<i class="fa fa-eye"></i>
							</button>
						</h3>
					</div>
				</div>
				<!-- Regular exam -->
				<div class="box-body " style="margin-bottom: 4px;">
					<div id="accordion" class="box-group">
						<div class="panel box box-default">
							<div class="box-header with-border">
								<br>
								<div class="table-responsive">
									<table class="table table-bordered" id="tblAccount">
										<thead>
											<tr>
												<td>S.No</td>
												<td>Name</td>
												<td>Semester</td>
												<!-- <td class="hidden-xs">Batch</td>
												<td class="hidden-xs">Faculty</td>
												<td class="hidden-xs">Program</td> -->
												<td>Due Amount</td>
											</tr>
										</thead>
										<tbody id="account_data">
										</tbody>
									</table>
									<div align="center">
										<button type="button" name="save" id="save"
											class="btn btn-info hidden">Save</button>
										<button type="button" name="update" id="update"
											class="btn btn-info hidden">Update</button>
									</div>
								</div>
								<div class="loader" id="loader" hidden style="margin-left: 40%;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--=========================================================================================  -->
			<div class="modal fade" id="addAccountModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Student Account</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3">
										<div class="form-group " style="margin-bottom: 0px;">
											<select required class="form-control" id="p-faculty-box"
												name="faculty_id">
											</select>
										</div>
									</div>
									<div class="form-group col-sm-3" style="margin-bottom: 0px;">
										<select required class="form-control" id="p-program-box"
											name="program_id">
											<option value="" disabled selected>Select Programme</option>
										</select>
									</div>
									<div class="form-group col-sm-3" style="margin-bottom: 0px;">
										<select required class="form-control" name="batch_id"
											id="batch-box">
											<option value="" disabled selected>Select Batch</option>
										</select>
									</div>
									<div class="form-group col-sm-3" id="semester-batch"
										style="margin-bottom: 0px;">
										<select required class="form-control" id="Semester_box"
											name="Semester_box">
											<option value="" disabled selected>Select Semester</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
										</select>
									</div>
								</div>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success"
									id="searchbtnClicked" data-dismiss="modal">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--=========================================================================================  -->
			<div class="modal fade" id="sucessfulDialog" role="dialog">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Sucessfull</h4>
						</div>
						<div class="modal-body">
							<p>Information has sucessfully saved into database.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="errorDialog" role="dialog">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Error</h4>
						</div>
						<div class="modal-body">
							<p>Error in saving information,Either data was already
								inserted or some fields empty.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- ========================================================================================= -->
			<div class="modal fade" id="viewAccountDetail" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Account Summary</h4>
						</div>
						<div class="modal-body">
							<div class="table-responsive">
								<table class="table" id="accountUpdateInfo">
									<thead>
										<tr>
											<th>#</th>
											<th>Total Amount</th>
											<th>Bill No</th>
											<th>Paid Date</th>
											<th>Paid Amount</th>
											<th>Due Amount</th>
										</tr>
									</thead>
									<tbody id="accountUpdateDisplayArea"></tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default pull-left"
								id="stname"></button>
							<button type="button" class="btn btn-default pull-left"
								id="stSem"></button>
							<button type="button" class="btn btn-default pull-left"
								id="stTot"></button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- ========================================================================================= -->
			<div class="modal fade" id="conformationModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Conformation</h4>
						</div>
						<div class="modal-body">
							<h4>Do you really wanna update...?</h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" id="conformation" class="btn btn-success"
								data-dismiss="modal">Update</button>
						</div>
					</div>

				</div>
			</div>
			<!--=========================================================================================  -->
		</div>
	</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../Resources/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/default.js"></script>
<script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>
<script src="../Resources/js/re-usable.js"></script>
<script src="../Resources/js/bootstrap-editable.min.js"></script>
<script src="../Resources/js/select2.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var temp_student_id;
						var temp_studentName;
						var temp_totalAmount
						var temp_semesterNo;

						$("#modal-box").click(function(event) {
							load_faculty(event, "p-faculty-box");
							$("#save").removeClass("hidden");
							$("#update").addClass("hidden");
						});
						$("#p-faculty-box").change(function(event) {
							load_program(event, "p-program-box");
						});
						$("#p-program-box").change(function(event) {
							load_batch_year(event, "batch-box");
						});
						$("#searchbtnClicked").click(function(event) {
							loadStudent(event, "account_data");
						});
						$("#save").click(function(event) {
							save_Account("save");
						});
						$("#searchbtnClicked").click(function(event) {
							loadStudent(event, "account_data");
						});
						$("#model-search").click(function(event) {
							$("#save").addClass("hidden");
							$("#update").removeClass("hidden");
						});
						$("#update").click(function(event) {
							$('#conformationModal').modal('show');

						});
						$("#conformation").click(function(event) {
							update_Account();
						});
						$(".viewAccountDetail").click(function(event) {
							var id = $('.viewAccountDetail').attr('value');
							view_all_account_updated_info(id);
						});

						//load particular student all account summary of particular semester
						function view_all_account_updated_info(id) {
							console.log("id==" + id);
							$
									.ajax({
										url : "../ajax_getall_accountUpdate",
										method : "POST",
										cache : true,
										data : {
											fee_id : id,
											student_id : temp_student_id

										},
										success : function(data) {
											var jSonObject = JSON.parse(data);
											console.log(jSonObject);
											if (jSonObject.length > 0) {

												$("#accountUpdateInfo").show();
												var conttent = '';
												var t;
												var count = 1;
												for (var i = 0; i < jSonObject.length; i++) {
													temp_totalAmount = jSonObject[i].totalFeeAmount;

													conttent += '<tr>';
													conttent += '<td>'
															+ (i + 1) + '</td>';
													if (count == 1) {
														conttent += '<td>'
																+ temp_totalAmount
																+ '</td>';
														count++;
														//alert("h");
													} else {
														conttent += '<td>' + t
																+ '</td>';
														count++;
													}

													conttent += '<td>'
															+ jSonObject[i].billNo
															+ '</td>';
													conttent += '<td>'
															+ jSonObject[i].paidDate
															+ '</td>';
													conttent += '<td>'
															+ jSonObject[i].amount_paid
															+ '</td>';
													if (count == 2) {
														conttent += '<td>'
																+ (jSonObject[i].totalFeeAmount - jSonObject[i].amount_paid)
																+ '</td>';
													} else {
														conttent += '<td>'
																+ (t - jSonObject[i].amount_paid)
																+ '</td>';
													}
													if (count == 2) {
														t = jSonObject[i].totalFeeAmount
																- jSonObject[i].amount_paid;
													} else {
														t = t
																- jSonObject[i].amount_paid;
													}
													//alert("value of t=" + t);
													conttent += '</tr>';

												}
												$('#accountUpdateDisplayArea')
														.html(conttent);
												$('#stname').text(
														temp_studentName);
												$('#stSem').text(
														temp_semesterNo);
												$('#stTot')
														.text(
																"Total Fee Amount : "
																		+ temp_totalAmount);

											} else {
												alert("Enter some data fist and come later....!!");
											}
										},
										error : function() {
											alert("Error...!!!");
										}
									});
						}

						function loadStudent(e, target) {
							var programId = document
									.getElementById("p-program-box").value;
							var batchNo = document.getElementById("batch-box").value;
							var semesterNo = document
									.getElementById("Semester_box").value;
							var url = "../ajax_account_student";
							var idSend = "programId=" + programId + "&batchNo="
									+ batchNo + "&semesterNo=" + semesterNo;
							var aj = new XMLHttpRequest();
							aj.open("POST", url, true);
							aj.setRequestHeader("Content-type",
									"application/x-www-form-urlencoded");
							aj.onreadystatechange = function() {
								if (aj.readyState == 4 && aj.status == 200) {
									var jSonObject = eval('(' + aj.responseText
											+ ')');
									$("#tblAccount").show();
									var content = '';
									for (var i = 0; i < jSonObject.length; i++) {

										content += '<tr>';
										content += '<td>' + (i + 1) + '</td>';
										content += '<td class="student_id" value='+jSonObject[i].student_id+'>'
												+ jSonObject[i].StudentName
												+ '</td>';
										content += '<td   data-type="text" class="student_semester" ></td>';
										content += '<td  data-type="text" " class="student_amount" value="'+jSonObject[i].studentFeeAmountId+'" >'
												+ jSonObject[i].amount
												+ '</td>';

										makeEditable("account_data",
												"student_amount", "Amount",
												"number");
										makeEditable("account_data",
												"student_semester", "Semester",
												"number");
										content += '<tr>';
									}
									$('#' + target).html(content);

								}
							}
							aj.send(idSend);
						}
						function save_Account(status) {
							//console.log("Status of saving or updating== "+status);
							var student_fee_amount_id = [];
							var amount = [];
							var section_number = [];
							var error = 0;
							$('.student_amount').each(
									function() {
										student_fee_amount_id.push($(this)
												.attr('value'));
									});
							$('.student_amount').each(function() {
								if ($(this).text() < 0) {
									error = 1;
								} else {
									amount.push($(this).text());
								}
							});
							$('.student_semester')
									.each(
											function() {
												if ($(this).text() >= 9
														|| $(this).text() <= 0) {
													error = 1
												} else {
													section_number.push($(this)
															.text());
												}
											});
							console.log(student_fee_amount_id + " " + amount
									+ " " + section_number);
							var urls;
							if (status == "save") {
								urls = "../ajax_save_account";
							} else if (status == "update") {
								urls = "../ajax_update_account";
							}
							if (error === 0) {
								$.ajax({
									url : urls,
									method : "POST",
									cache : true,
									data : {
										student_id : student_fee_amount_id,
										amount : amount,
										section_number : section_number
									},
									success : function(data) {
										alert(data);
										$('#tblAccount tr:not(:first)')
												.remove();
										$('#sucessfulDialog').modal('show');
									},
									error : function() {
										$('#errorDialog').modal('show');
									}
								});
							} else {
								$('#errorDialog').modal('show');
							}
						}

						function update_Account() {

							var student_fee_amount_id = [];
							var amount = [];//due amount
							var section_number = [];
							var amount_paid = [];
							//var bill_no=[];

							var error_update = 0;
							$('.student_amount').each(
									function() {
										student_fee_amount_id.push($(this)
												.attr('value'));
									});
							$('.remaining_amount').each(function() {
								if ($(this).text() < 0) {
									error_update = 1;

								} else {
									amount.push($(this).text());
								}
							});
							$('.pay_amount').each(function() {
								if ($(this).text() <= 0) {
									error_update = 1;
								} else {
									amount_paid.push($(this).text());
								}
							});

							$('.student_semester')
									.each(
											function() {
												if ($(this).text() >= 9
														|| $(this).text() <= 0) {
													error = 1
												} else {
													section_number.push($(this)
															.text());
												}
											});

							if (error_update === 0) {
								//salert("masuamn");
								$.ajax({
									url : "../ajax_update_account",
									method : "POST",
									cache : true,
									data : {
										student_id : student_fee_amount_id,
										amount : amount,
										section_number : section_number,
										amount_paid : amount_paid
									},
									success : function(data) {
										alert(data);
										$('#tblAccount tr:not(:first)')
												.remove();
										$('#update').hide();
										//$('#sucessfulDialog').modal('show');
									},
									error : function() {
										$('#errorDialog').modal('show');
									}
								});
							} else {
								$('#errorDialog').modal('show');
							}
						}

						$("select").select2({
							theme : "bootstrap",
							width : "auto"
						});
						var data = [ {
							id : 0,
							text : 'enhancement'
						}, {
							id : 1,
							text : 'bug'
						}, {
							id : 2,
							text : 'duplicate'
						}, {
							id : 3,
							text : 'invalid'
						}, {
							id : 4,
							text : 'wontfix'
						} ];
						$("#sel1")
								.select2(
										{
											theme : "bootstrap",
											width : "210px",
											//width:auto,
											height : "10px",
											minimumInputLength : 3,
											placeholder : "Search for a student",
											ajax : {
												url : "../ajax_search_student_for_account",
												dataType : 'json',
												type : "POST",
												delay : 250,
												data : function(params) {
													console.log("params="
															+ params.term);
													//console.log("params="+params.page);
													return {
														val : params.term,
														page : params.page
													};
												},
												processResults : function(data,
														params) {
													//console.log("data=" + data);
													params.page = params.page || 1;
													return {
														results : data,
														pagination : {
															more : (params.page * 30) < data.total_count
														}
													};
												},
												cache : true
											},
											escapeMarkup : function(markup) {
												return markup;
											},
											templateResult : formatRepo,
											templateSelection : formatRepoSelection
										}).on("change", function(e) {
									var selected_element = $(e.currentTarget);
									var select_val = selected_element.val();
									//alert("name="+ selectedValues[select_val]);
									console.log("Student Id=" + select_val);
									gettingPreviousAccount(select_val);
								});
						function formatRepo(repo) {
							if (repo.loading)
								return repo.text;
							var markup = '<option value='+repo.id+'>'
									+ repo.name + '</option>';
							console.log("repo.text=" + repo.text);
							return markup;
						}
						function formatRepoSelection(repo) {
							return repo.name || repo.text;
						}
						//Function for getting all previous semester account and selecting desired account
						function gettingPreviousAccount(val) {

							$
									.ajax({
										url : "../ajax_get_all_semester_account",
										method : "POST",
										cache : true,
										data : {
											student_id : val
										},
										success : function(data) {
											var obj = JSON.parse(data);
											console.log("json size="
													+ obj.length);
											console.log("sem no="
													+ data.Semester_no);
											if (obj.length > 0) {
												$("#sembtn").empty();
												var content = '';
												for (var i = 0; i < obj.length; i++) {

													content += '<input type="button" id="'+obj[i].fee_id+'" class="btn btn-default btnSelected" values='
															+ obj[i].fee_id
															+ ' value='
															+ obj[i].Semester_no
															+ '>';
												}

												$("#sembtn").append(content);

												$("input")
														.click(
																function(event) {
																	var idClicked = event.target.id;

																	getInfo(
																			idClicked,
																			val);
																	$("#save")
																			.addClass(
																					"hidden");
																	$("#update")
																			.removeClass(
																					"hidden");
																	$('#update')
																			.show();
																	$(
																			'.viewAccountDetail')
																			.val(
																					idClicked);

																});
											} else {
												$("#sembtn").empty();
												alert("Enter some data fist and come later....!!");
											}
										},
										error : function() {
											alert("Error...!!!");
										}
									});
						}
						function getInfo(fee_id, student_id) {
							//alert("fee_id="+fee_id+"  student_id="+student_id);
							temp_student_id = student_id;
							$
									.ajax({
										url : "../ajax_get_dataOf_semester_account",
										method : "POST",
										cache : true,
										data : {
											fee_id : fee_id,
											student_id : student_id
										},
										success : function(data) {
											var jSonObject = JSON.parse(data);
											console.log("json size mmm="
													+ jSonObject.length);
											console.log("sem no="
													+ data.Semester_no);
											if (jSonObject.length > 0) {

												$("#tblAccount").show();
												var content = '';
												for (var i = 0; i < jSonObject.length; i++) {
													content += '<tr>';
													content += '<td>' + (i + 1)
															+ '</td>';
													content += '<td class="student_id" value='+student_id+'>'
															+ jSonObject[i].StudentName
															+ '</td>';
													content += '<td   data-type="text" class="student_semester" >'
															+ jSonObject[i].semester_no
															+ '</td>';
													content += '<td  data-type="text" " class="student_amount" value="'+jSonObject[i].studentFeeAmountId+'" >'
															+ jSonObject[i].amount
															+ '</td>';
													content += '</tr>';
													content += '<tr>';
													content += '<th colspan="3" style="text-align: right;" >Pay Amount :</th>';
													content += '<td class="pay_amount" data-type="text">0</td>';
													content += '</tr>';
													content += '<tr>';
													content += '<th colspan="3" style="text-align: right;">Remaining Amount :</th>';
													content += '<td class="remaining_amount">'
															+ jSonObject[i].amount
															+ '</td>';
													makeEditable(
															"account_data",
															"pay_amount",
															"Amount", "number");

													//makeEditable("account_data","student_semester", "Semester","number");
													content += '</tr>';

													temp_studentName = jSonObject[i].StudentName;
													temp_semesterNo = jSonObject[i].semester_no;

													//alert("temp_studentName="+temp_studentName +"  temp_semesterNo="+temp_semesterNo+" temp_totalAmount="+temp_totalAmount);
												}
												$('#account_data')
														.html(content);
												$(".pay_amount").on("keyup",
														function(event) {
															alert("mausam");
														});
												$('td.pay_amount')
														.on(
																'save',
																function(e,
																		params) {
																	var value = params.newValue;
																	var previousAmount = $(
																			'.student_amount')
																			.text();
																	var newDueAmount = previousAmount
																			- value;
																	$(
																			'.remaining_amount')
																			.text(
																					newDueAmount);

																});
												//$(".pay_amount").blur(function(event){alert("mausam");});
											} else {

												alert("Enter some data fist and come later....!!");
											}
										},
										error : function() {
											alert("Error...!!!");
										}
									});
						}

					});
</script>
</body>
</html>