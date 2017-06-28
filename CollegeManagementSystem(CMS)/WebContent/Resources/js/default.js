
var panelView = $('.panel-group.responsive').is(':visible');    
$( window ).resize( function () {
    if ( $('.panel-group.responsive').is(':visible') != panelView ) {
        $('.footable').removeClass('footable-loaded').footable();
        panelView = $('.panel-group.responsive').is(':visible');
    }
} );




$(document).ready(function() {
	$('[data-toggle="offcanvas"]').click(function() {
		$('#side-menu').toggleClass('hidden-xs');
	});
});


$(document).ready(function(){
	 $("#add-student").on("click", function() {
        $("#content-area").load("content/addStudents.html");
	});

	$("#manage-student").on("click", function() {
    	$("#content-area").load("content/manageStudent.html");
	});

	$("#add-staff").on("click", function() {
        $("#content-area").load("content/addStaff.html");
	});
	$("#manage-staff").on("click", function() {
        $("#content-area").load("content/manageStaff.html");
	});

	$("#manage-courses").on("click", function() {
    	$("#content-area").load("content/manageCourses.html");
	});

});