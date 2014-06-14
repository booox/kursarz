$(document).ready(function () {
	// Main page background scale
	skaluj($(window), $('body'), 3264, 2448);

	// Slide to courselist
	$('#toCourses').click(function(e) {
		e.preventDefault();
		$('html, body').animate({
		    scrollTop: $("#courses").offset().top
		 }, 900);
	});
});

$(window).resize(function() {
	skaluj($(window), $('body'), 3264, 2448);
});