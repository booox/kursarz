var skaluj = function() {
	var winX = $(window).width();
	var winY = $(window).height();
	var winS = winX/winY;

	var imgX = 3264
	var imgY = 2448;

	var newX = $(window).width();
	var newY = Math.ceil(3000*newX/4595);

	var newY1 = $(window).height();
	var newX1 = Math.ceil(4595*newY1/3000);

	if(newY < winY) $('body').css('background-size', newX1 + 'px ' + newY1 + 'px');
	else $('body').css('background-size', newX + 'px ' + newY + 'px');
}


$(document).ready(function () {
	// Dropdown menu on hover
	$('.dropdown').mouseenter(function() {
		$(this).addClass("open");
	}).mouseleave(function() {
		$(this).removeClass("open");
	});
	// Main page background scale
	skaluj();
});

$(window).resize(function() {
	skaluj();
});