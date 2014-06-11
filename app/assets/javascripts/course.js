$(document).ready(function() {

	if(isSignedUpForCourse) {
		$('#show_description').click(function(e) {
			e.preventDefault();
			$('#course_description').animate({height:"toggle"});
			console.log( $('#course_description').css('display') );
		});
	} else {
		$('#course_description').show();
	}

});