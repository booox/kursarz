var parallaxBg = function() {
	$('.home-table').css({
		'background-position': '0 ' + -$('body').scrollTop() * .2 + 'px'
	});
}

$(document).ready(function () {
	// Main page background scale
	skaluj($(window), $('.home-table'), 3000, 1979);

	// Parallax
	parallaxBg();

	// Slide to courselist
	$('#toCourses').click(function(e) {
		e.preventDefault();
		$('html, body').animate({
		    scrollTop: $("#courses").offset().top
		 }, 900);
	});
});

$(window).resize(function() {
	skaluj($(window), $('.home-table'), 3000, 1979);
});

$(window).scroll(function() {
	// Parallax
	parallaxBg();
});