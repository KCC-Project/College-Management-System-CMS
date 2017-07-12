$(document).ready(function() {
	var rowCount = $('#crud_table >tbody >tr').length;

	$('#save').click(function() {
		//alert("table row=" + rowCount);
		//alert("value="+$(".student_name").val());
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
			var currentValue=$(this).text();
			if (currentValue=='Present') {
				student_attendence.push(1);
			}else if(currentValue=='Absent'){
				student_attendence.push(0);
			}	
		});
		$('.student_passFail').each(function() {
			var currentValue=$(this).text();
			if (currentValue=='Pass') {
				student_passFail.push(1);
			}else if(currentValue=='Fail'){
				student_passFail.push(0);
			}	
		});

	alert("student id="+student_id);
	alert("att="+student_attendence);
	alert("student_passFail ="+student_passFail);
	alert("exam_marks="+exam_marks);
	alert("student_examid="+student_examid);
		   
	
		$.ajax({
			url : "../ajax_add_result",
			method : "POST",
			cache : false,

			data : {
				student_id : student_id,
				student_examid : student_examid,
				exam_marks : exam_marks,
				student_attendence : student_attendence,
				student_passFail : student_passFail
			},
			success : function(data) {
				alert(data);
				$("td[contentEditable='true']").text("");
				for (var i = 2; i <= rowCount; i++) {
					$('tr#' + i + '').remove();
				}
				// fetch_item_data();
			},
			error : function() {
				alert('error');
			}
		});
		
		
	});

	/*$('#employee_data').editable({
		container : 'body',
		selector : 'td.student_name',
		title : 'Student Name',
		type : "POST",
		validate : function(value) {
			if ($.trim(value) == '') {
				return 'This field is required';
			}
		}
	});*/
	 $('#employee_data').editable({
		  container: 'body',
		  selector: 'span.student_passFail',
		  title: 'Pass/Fail',
		  type: "POST",
		 source: [{value: 1, text: "Pass"}, {value: 0, text: "Fail"}],
		  validate: function(value){
		   if($.trim(value) == '')
		   {
		    return 'This field is required';
		   }
		  }
		 });
	 
	 $('#employee_data').editable({
		  container: 'body',
		  selector: 'td.student_attendence',
		  title: 'Attendence',
		  source: [{value: 1, text: "Present"}, {value: 0, text: "Absent"}],
		  validate: function(value){
		   if($.trim(value) == '')
		   {
		    return 'This field is required';
		   }
		  }
		 });
	 
	 $('#employee_data').editable({
		  container: 'body',
		  selector: 'td.student_score',
		  title: 'Marks',
		 
		  
		  validate: function(value){
			   if($.trim(value) == '')
			   {
			    return 'This field is required';
			   }
			   var regex = /^[0-9]+$/;
			   if(! regex.test(value))
			   {
			    return 'Numbers only!';
			   }
			  }
		 });

});
