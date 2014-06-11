$(document).ready(function() {

	if(isSignedUpForCourse) {
		$('#show_description').click(function(e) {
			e.preventDefault();
			$('#course_description').animate({height:"toggle"},function(){
				if( $('#course_description').css('display') == 'none' ) {
					$('#show_description').html('View details');
				} else {
					$('#show_description').html('Hide details');
				}
			});
			
		});
	} else {
		$('#course_description').show();
	}

});