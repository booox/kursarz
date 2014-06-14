$(document).ready(function () {
	// Main page background scale
	skaluj($(window), $('body'), 3264, 2448);
});

$(window).resize(function() {
	skaluj($(window), $('body'), 3264, 2448);
});