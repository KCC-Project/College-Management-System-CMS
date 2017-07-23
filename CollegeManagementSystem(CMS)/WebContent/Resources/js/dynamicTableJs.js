$(document).ready(
		function() {

			$('#save').click(function() {
				var student_id = [];
				var student_examid = [];
				var exam_marks = [];
				var student_attendence = [];
				var student_passFail = [];

				$('.student_name').each(function() {
					student_id.push($(this).attr('value'));
				});
				$('.exam_id').each(function() {
					student_examid.push($(this).attr('value'));
				});
				$('.student_score').each(function() {
					exam_marks.push($(this).text());
				});
				$('.student_attendence').each(function() {
					var currentValue = $(this).text();
					if (currentValue == 'Present') {
						student_attendence.push(1);
					} else if (currentValue == 'Absent') {
						student_attendence.push(0);
					}
				});
				$('.student_passFail').each(function() {
					var currentValue = $(this).text();
					if (currentValue == 'Pass') {
						student_passFail.push(1);
					} else if (currentValue == 'Fail') {
						student_passFail.push(0);
					}
				});

				$.ajax({
					url : "../ajax_add_result",
					method : "POST",
					cache : true,

					data : {
						student_id : student_id,
						student_examid : student_examid,
						exam_marks : exam_marks,
						student_attendence : student_attendence,
						student_passFail : student_passFail
					},
					success : function(data) {
						// alert(data);
						$('#crud_table tr:not(:first)').remove();
						$('#sucessfulDialog').modal('show');
					},
					error : function() {
						$('#errorDialog').modal('show');
					}
				});

			});

			/*
			 * $('#result_data').editable({ container : 'body', selector :
			 * 'td.student_name', title : 'Student Name', type : "POST",
			 * validate : function(value) { alert("done"); if ($.trim(value) ==
			 * '') { return 'This field is required'; } }
			 * 
			 * });
			 */

			$('#employee_data').editable({
				container : 'body',
				selector : 'span.student_passFail',
				title : 'Pass/Fail',
				type : "POST",
				source : [ {
					value : 1,
					text : "Pass"
				}, {
					value : 0,
					text : "Fail"
				} ],
				validate : function(value) {
					if ($.trim(value) == '') {
						return 'This field is required';
					}
				}
			});

			$('#employee_data').editable({
				container : 'body',
				selector : 'td.student_attendence',
				title : 'Attendence',
				source : [ {
					value : 1,
					text : "Present"
				}, {
					value : 0,
					text : "Absent"
				} ],
				validate : function(value) {
					if ($.trim(value) == '') {
						return 'This field is required';
					}
				}
			});

			$('#employee_data').editable({
				container : 'body',
				selector : 'td.student_score',
				title : 'Marks',
				validate : function(value) {
					if ($.trim(value) == '') {
						return 'This field is required';
					}
					var regex = /^[0-9]+$/;
					if (!regex.test(value)) {
						return 'Numbers only!';
					}
				}

			});

			// for update result
			$('#result_data').editable({
				container : 'body',
				selector : 'td.student_score',
				title : 'Marks',
				validate : function(value) {
					var regex = /^[0-9]+$/;
					if ($.trim(value) == '') {
						return 'This field is required';
					}

					else if (!regex.test(value)) {
						return 'Numbers only!';
					} else {
						var examScore = $.trim(value);
						var student_id;
						var exam_id;
						var is_attended;
						var passFailStat;
						var $row = $(this).closest("tr"), // Finds the closest
															// row
						// <tr>
						$tds = $row.find("td:nth-child(1)"); // Finds the 1nd
																// <td>
						// element

						$td = $row.find("td:nth-child(2)");
						$isAttended = $row.find("td:nth-child(8)");
						$passFail = $row.find("td:nth-child(9)");
						$.each($tds, function() { // Visits every single <td>
													// element
							student_id = $(this).attr('value'); // Prints out
																// the text
							// within the <td>
						});
						$.each($td, function() {
							exam_id = $(this).attr('value');
						});

						$.each($isAttended, function() {
							is_attended = $(this).attr('value');
						});
						$.each($passFail, function() {
							passFailStat = $(this).attr('value');
						});

						$.ajax({
							url : "../update_result",
							method : "POST",
							cache : true,

							data : {
								student_id : student_id,
								exam_id : exam_id,
								examScore : examScore,
								is_attended : is_attended,
								passFailStatus : passFailStat
							},
							success : function(data) {
								alert("from ajax=" + data);
							},
							error : function() {
								alert("from ajax=" + data);
							}
						});
					}
				}
			});
			$('#result_data').editable(
					{

						container : 'body',
						selector : 'span.student_passFail',
						title : 'Pass/Fail',
						type : "POST",
						source : [ {
							value : 1,
							text : "Pass"
						}, {
							value : 0,
							text : "Fail"
						} ],
						validate : function(value) {
							if ($.trim(value) == '') {
								return 'This field is required';
							} else {
								var examScore;
								var student_id;
								var exam_id;
								var is_attended;
								var passFailStat=$.trim(value);
								var $row = $(this).closest("tr"), // Finds the
																	// closest
																	// row
								// <tr>
								$tds = $row.find("td:nth-child(1)"); // Finds
																		// the
																		// 1nd
																		// <td>
								// element

								$td = $row.find("td:nth-child(2)");
								$score = $row.find("td:nth-child(7)");
								$isAttended = $row.find("td:nth-child(8)");

								$.each($tds, function() { // Visits every
															// single <td>
															// element
									student_id = $(this).attr('value'); // Prints
																		// out
																		// the
																		// text
									// within the <td>
								});
								$.each($td, function() {
									exam_id = $(this).attr('value');
								});

								$.each($isAttended, function() {
									is_attended = $(this).attr('value');
								});

								
								$.each($score, function() {
									examScore = $(this).text();
								});
								alert("examScore=" + examScore
										+ " passFailStat=" + passFailStat
										+ " is_attended=" + is_attended);
								$.ajax({
									url : "../update_result",
									method : "POST",
									cache : true,

									data : {
										student_id : student_id,
										exam_id : exam_id,
										examScore : examScore,
										is_attended : is_attended,
										passFailStatus : passFailStat
									},
									success : function(data) {
										alert("from ajax=" + data);
									},
									error : function() {
										alert("from ajax=" + data);
									}
								});
							}
						}
					});

			$('#result_data').editable({
				container : 'body',
				selector : 'td.student_attendence',
				title : 'Attendence',
				source : [ {
					value : 1,
					text : "Present"
				}, {
					value : 0,
					text : "Absent"
				} ],
				validate : function(value) {
					if ($.trim(value) == '') {
						return 'This field is required';
					}else{
						var examScore;
						var student_id;
						var exam_id;
						var is_attended=$.trim(value);
						var passFailStat;
						var $row = $(this).closest("tr"), // Finds the closest
															// row
						// <tr>
						$tds = $row.find("td:nth-child(1)"); // Finds the 1nd
																// <td>
						// element

						$td = $row.find("td:nth-child(2)");
						$score = $row.find("td:nth-child(7)");
						$passFail = $row.find("td:nth-child(9)");
						$.each($tds, function() { // Visits every single <td>
													// element
							student_id = $(this).attr('value'); // Prints out
																// the text
							// within the <td>
						});
						$.each($td, function() {
							exam_id = $(this).attr('value');
						});
						$.each($score, function() {
							examScore = $(this).text();
						});
						
						$.each($passFail, function() {
							passFailStat = $(this).attr('value');
						});

						$.ajax({
							url : "../update_result",
							method : "POST",
							cache : true,

							data : {
								student_id : student_id,
								exam_id : exam_id,
								examScore : examScore,
								is_attended : is_attended,
								passFailStatus : passFailStat
							},
							success : function(data) {
								alert("from ajax=" + data);
							},
							error : function() {
								alert("from ajax=" + data);
							}
						});
					}
				}
			});
		});
