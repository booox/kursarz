var ytresize = function() {
	var pW = $('#main-page').width();
	$('iframe').load().each(function() {
		var iW = $(this).attr('width');
		var iH = $(this).attr('height');
		$(this).attr({
			'width': pW,
			'height': pW * iH / iW
		});
	});
}

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

	// YT resize
	ytresize();
};

$(document).ready(ready);
$(document).on('page:load', ready);

// window.resize
$(window).resize(function() {
	ytresize();
});