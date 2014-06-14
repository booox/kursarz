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

var courselist = function() {
	// Image height

	$('.imageholder').each(function() {
		var width = $(this).width();
		var height = Math.floor(width / 1.3);
		$(this).height( height );
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

	// Imageholder course list
	courselist();

	// Search slide :)
	var mouseOnSearch = 0;
	var searchInput = $('#search-input');
	$('#search-form').mouseenter(function() {
		mouseOnSearch = 1;
		searchInput.animate({width: 146},function() {
			searchInput.find('input').first().focus();
		});
	}).mouseleave(function() {
		mouseOnSearch = 0;
		if( !searchInput.find('input').first().is(':focus') ) {
			searchInput.animate({width: 0});
		}
	});
	searchInput.find('input').first().blur(function() {
		if( !mouseOnSearch ) {
			searchInput.animate({width: 0});
		}
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

// window.resize
$(window).resize(function() {
	ytresize();
	courselist();
});