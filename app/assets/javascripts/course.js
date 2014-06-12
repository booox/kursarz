$(document).ready(function() {

	var courseDesc = 'span#course_description';
	var courseDescBtn = 'a#show_description';

	if(isSignedUpForCourse) {
		$(courseDescBtn).click(function(e) {
			e.preventDefault();
			$(courseDesc).animate({height:"toggle"},function(){
				if( $(courseDesc).css('display') == 'none' ) {
					$(courseDescBtn).html('View details');
				} else {
					$(courseDescBtn).html('Hide details');
				}
			});
			
		});
	} else {
		$(courseDesc).show();
	}

});