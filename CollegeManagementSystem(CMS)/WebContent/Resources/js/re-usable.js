	
	function load_faculty(e, target) {
		var url="../ajax_faculty_load";
		var aj=new XMLHttpRequest();
		aj.open("POST", url, true);
		aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		aj.onreadystatechange=function(){
			if (aj.readyState==4&&aj.status==200) {
				var return_data=aj.responseText;
				$('#' + target).html(return_data);
			}
		}
		aj.send();
	}
	function load_program(e, target) {
		var getid = e.target.id;
		var id = $('#'+getid).find(":selected").val();
		var url="../aja";
		var idSend="id="+id;
		var aj=new XMLHttpRequest();
		aj.open("POST", url, true);
		aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		aj.onreadystatechange=function(){
			if (aj.readyState==4&&aj.status==200) {
				var return_data=aj.responseText;
				$('#' + target).html(return_data);
			}
		}
		aj.send(idSend);
	}
	function load_batch_year(e, target) {
		var getid = e.target.id;
		var id = $('#'+getid).find(":selected").val();
		var url="../ajax_year_load";
		var idSend="id="+id;
		var aj=new XMLHttpRequest();
		aj.open("POST", url, true);
		aj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		aj.onreadystatechange=function(){
			if (aj.readyState==4&&aj.status==200) {
				var return_data=aj.responseText;
				$('#' + target).html(return_data);
			}
		}
		aj.send(idSend);
	}

	function makeEditable(target, selector,title, fieldType){
		$('#'+target).editable({
			container : 'body',
			selector : 'td.'+selector+'',
			title: title,
			validate : function(value) {
				if(fieldType == 'number'){
						if ($.trim(value) == '') {
							return 'This field is required';
						}
						var regex = /^[0-9]+$/;
						if (!regex.test(value)) {
							return 'Numbers only!';
						}
					}
				else if(fieldType=="string") {
						if ($.trim(value) == '') {
							return 'This field is required';
						}
						var regex = /^[A-z]+$/;
						if (!regex.test(value)) {
							return 'Numbers not allowed!';
						}
				}
				
				else {
						if ($.trim(value) == '') {
							return 'This field is required';
						}
				}
			}
		});
	}
	