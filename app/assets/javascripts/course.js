$(document).ready(function() {
	$('#show_description').click(function() {
		console.log("dupa");
		//event.preventDefault();
		$('#course_description').animate({height:"toggle"});
	});
});
