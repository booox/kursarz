$(document).ready(function () {
	// Dropdown menu on hover
	$('.dropdown').mouseenter(function() {
		$(this).addClass("open");
	}).mouseleave(function() {
		$(this).removeClass("open");
	});
});