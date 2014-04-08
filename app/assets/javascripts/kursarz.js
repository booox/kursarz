$(document).ready(function () {

	$('.dropdown').mouseenter(function() {
		$(this).addClass("open");
	}).mouseleave(function() {
		$(this).removeClass("open");
	});

});