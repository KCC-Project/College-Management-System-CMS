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
							Add Fee</span></a></li>
			</ol>
			<!--=============================================Main Containt===============================  -->
			<div class="box box-default with-border">
				<div>
					<div style="margin: 0px; padding-left: 20px; height: 35px;">
						<a><button type="button" class="btn btn-info pull-right"
								data-toggle="modal" data-target="#addAccountModal"
								id="modal-box">Add Fee</button></a>
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
								class="fa fa-graduation-cap"></i> Semester Fee</span> <span
								class="visible-xs"
								style="position: absolute; margin-top: 5px; color: #3c8dbc"><i
								class="fa fa-graduation-cap"></i>Sem Fee </span>
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
												<td>#</td>
												<td>Name</td>
												<td>Fee Amount</td>
											</tr>
										</thead>
										<tbody id="fee_amount">
										</tbody>
									</table>
									<div align="center">
										<button type="button" name="save" id="save"
											class="btn btn-info hidden">Save</button>
										


									
										<button id="option" type="button" class="btn btn-success btn-md hidden option"
											title=" Selection Option" data-container="body"
											data-toggle="popover" data-placement="bottom"
											data-content='<button type="button" id="save_option"  class="btn btn-primary">Save</button>&nbsp;&nbsp;<button type="button" id="update_option" class="btn btn-primary">Update</button>'
											data-html='true'>OPTION</button>

									</div>
								</div>
								<div class="loader hidden" id="loader" style="margin-left: 40%;"></div>
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
			<div class="modal fade" id="conformationModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Conformation</h4>
						</div>
						<div class="modal-body">
							<h4>Do you really wanna save...?</h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" id="conformation" class="btn btn-success"
								data-dismiss="modal">save</button>
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

			//For popover///////////////////////////////////////////////////////////////////////////
			$(document).on("click", "#update_option", function(e) {
			    $('[data-toggle="popover"]').trigger('click');//for closing when clicked
			    update_Account();
			   
			});
			$(document).on("click", "#save_option", function(e) {
			   // $('[data-toggle="popover"]').trigger('click');
			    save_Account("save");
			});
			$('[data-toggle="popover"]').popover();
			////////////////////////////////////////////////////////////////////////////////////////////
			
			$("#modal-box").click(function(event) {
			    load_faculty(event, "p-faculty-box");
			    $("#save").show();
			    $("#save").removeClass("hidden");
			    $('#option').addClass("hidden");
			    
			});
			$("#p-faculty-box").change(function(event) {
			    load_program(event, "p-program-box");
			});
			$("#p-program-box").change(function(event) {
			    load_batch_year(event, "batch-box");
			});
			$("#searchbtnClicked").click(function(event) {
			    loadStudent(event, "fee_amount");
			});
			$("#save").click(function(event) {
			    save_Account("save");
			});
			$("#model-search").click(function(event) {
			    $("#save").addClass("hidden");
			  
			});
			
			$("#conformation").click(function(event) {
			    update_Account();
			});
		
			function loadStudent(e, target) {
			    $('#loader').removeClass('hidden');
			    var programId = document
				    .getElementById("p-program-box").value;
			    var batchNo = document.getElementById("batch-box").value;
			    var semesterNo = document
				    .getElementById("Semester_box").value;
			    var url = "../ajax_diplayStudent_forNewResult";
			    var idSend = "programId=" + programId + "&batchNo="
				    + batchNo + "&semesterNo=" + semesterNo
				    + "&examId=0";
			    var aj = new XMLHttpRequest();
			    aj.open("POST", url, true);
			    aj.setRequestHeader("Content-type",
				    "application/x-www-form-urlencoded");
			    aj.onreadystatechange = function() {
				if (aj.readyState == 4 && aj.status == 200) {
				    $('#loader').addClass('hidden');
				    $("#save").removeClass("hidden");
				    var jSonObject = eval('(' + aj.responseText
					    + ')');

				    alert("length="
					    + jSonObject.StudentInfo[0].Name);
				    $("#tblAccount").show();
				    var content = '';
				    for (var i = 0; i < jSonObject.StudentInfo.length; i++) {

					content += '<tr>';
					content += '<td>' + (i + 1) + '</td>';
					content += '<td class="student_id" value='+jSonObject.StudentInfo[i].studentId+'>'
						+ jSonObject.StudentInfo[i].Name
						+ '</td>';

					content += '<td  data-type="text" " class="student_amount" ></td>';

					makeEditable("fee_amount",
						"student_amount", "Amount",
						"number");
					content += '<tr>';
				    }
				    $('#' + target).html(content);
				    $('#option').removeClass("hidden");
				    //console.log(content);
				}
			    }
			    aj.send(idSend);
			}
			function save_Account(status) {
			    //console.log("Status of saving or updating== "+status);
			    $('#loader').removeClass('hidden');
			    var student_id = [];
			    var amount = [];

			    var error = 0;
			    $('.student_id').each(function() {
				student_id.push($(this).attr('value'));
			    });
			    $('.student_amount').each(function() {
				if ($(this).text() < 0) {
				    error = 1;
				} else {
				    amount.push($(this).text());
				}
			    });

			    var urls;
			    if (status == "save") {
				urls = "../ajax_save_student_fee_amount";
			    }
			    if (error === 0) {
				$
					.ajax({
					    url : urls,
					    method : "POST",
					    cache : true,
					    data : {
						student_id : student_id,
						amount : amount

					    },
					    success : function(data) {
						//alert(data);
						$('#loader').addClass('hidden');

						if (data == 1) {

						    $(
							    '#tblAccount tr:not(:first)')
							    .remove();
						    $('#sucessfulDialog')
							    .modal('show');
						    $("#save").hide();
						} else {
						    alert("Student cannot have duplicate data ");
						}

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
			    $('#loader').removeClass('hidden');
			    var student_id = [];
			    var amount = [];

			    var error_update=0;
			    $('.student_id').each(function() {
				student_id.push($(this).attr('value'));
			    });
			    $('.student_amount').each(function() {
				if ($(this).text() < 0) {
				    error_update = 1;
				} else {
				    amount.push($(this).text());
				}
			    });


			    if (error_update === 0) {
				//alert("masuamn");
				$.ajax({
				    url : "../ajax_update_feeAmount_account",
				    method : "POST",
				    cache : true,
				    data : {
					student_id : student_id,
					amount : amount
				    },
				    success : function(data) {
					$('#loader').addClass('hidden');
					//alert(data);
				
					if (data==1) {
					    $('.option').addClass('hidden');
						$('#tblAccount tr:not(:first)').remove();
						$('#sucessfulDialog').modal('show');
						
					}else{
					    $('#errorDialog').modal('show');
					}
				    },
				    error : function() {
					$('#errorDialog').modal('show');
				    }
				});
			    } else {
				$('#errorDialog').modal('show');
			    }
			}

		    });
    $("select").select2({
	theme : "bootstrap",
	width : "auto"
    });
    $("#sel1").select2({
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
		console.log("params=" + params.term);
		//console.log("params="+params.page);
		return {
		    val : params.term,
		    page : params.page
		};
	    },
	    processResults : function(data, params) {
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
	var student_id = selected_element.val();
	//alert("name="+ selectedValues[select_val]);
	//console.log("Student Id=" + student_id);

	var data = $('#sel1').select2('data')
	var temp_student_name = data[0].name;

	if (student_id > 0) {
	    loadParticularStudentSemesterFee(student_id, temp_student_name);
	}

    });
    function formatRepo(repo) {
	if (repo.loading)
	    return repo.text;
	var markup = '<option value='+repo.id+'>' + repo.name + '</option>';
	console.log("repo.text=" + repo.name);
	return markup;
    }
    function formatRepoSelection(repo) {
	return repo.name || repo.text;
    }

    function loadParticularStudentSemesterFee(student_id, temp_student_name) {
	$('#loader').removeClass('hidden');
	$
		.ajax({
		    url : "../ajax_load_particular_student_Semfee",
		    method : "POST",
		    cache : true,
		    data : {
			student_id : student_id,
		    },
		    success : function(data) {
			$('#loader').addClass('hidden');
			//alert(data);
			//$('#tblAccount tr:not(:first)').remove();
			//$('#update').hide();
			//$('#sucessfulDialog').modal('show');

			var jSonObject = eval('(' + data + ')');
			//alert(jSonObject);
			// alert("length="+jSonObject[0].semFeeAmount);
			$("#tblAccount").show();
			var content = '';
			for (var i = 0; i < jSonObject.length; i++) {

			    content += '<tr>';
			    content += '<td>' + (i + 1) + '</td>';
			    content += '<td class="student_id" value='+jSonObject[0].studentid+'>'
				    + temp_student_name + '</td>';

			    content += '<td  data-type="text" " class="student_amount" >'
				    + jSonObject[0].semFeeAmount + '</td>';

			    makeEditable("fee_amount", "student_amount",
				    "Amount", "number");
			    content += '<tr>';
			}
			$('#fee_amount').html(content);

			$("#option").removeClass('hidden');

		    },
		    error : function() {
			$('#errorDialog').modal('show');
		    }
		});

    }
</script>
</body>
</html>