var ready = function() {
	// Dropdown menu on hover
	$('.dropdown').mouseenter(function() {
		$(this).addClass("open");
	}).mouseleave(function() {
		$(this).removeClass("open");
	});
	// Dropdown menu min-width;
	var $dmenu = $('.dropdown-menu')
	$dmenu.css('min-width', $dmenu.prev().outerWidth() + 'px');
};

$(document).ready(ready);
$(document).on('page:load', ready);