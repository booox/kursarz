var skaluj = function(pattern, node, imgX, imgY) {
	var winX = pattern.width();
	var winY = pattern.height();
	var winS = winX/winY;

	var newX = pattern.width();
	var newY = Math.ceil(imgY*newX/imgX);

	var newY1 = pattern.height();
	var newX1 = Math.ceil(imgX*newY1/imgY);

	if(newY < winY) node.css('background-size', newX1 + 'px ' + newY1 + 'px');
	else node.css('background-size', newX + 'px ' + newY + 'px');
}

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
	// Imageholder height
	$('.imageholder').each(function() {
		var width = $(this).width();
		var height = Math.floor(width / 2);
		$(this).height( height );
	});

	// Image scale
	$('.imageholder').find('img').each(function() {
		var src = $(this).attr('src');
		$(this).parent().one().css('background-image','url('+src+')');
		var imgX = $(this).width();
		var imgY = $(this).height();
		skaluj($(this).parent(), $(this).parent(), imgX, imgY);
		$(this).css('visibility', 'hidden');
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

$(window).load(function() {
	courselist();
});

// window.resize
$(window).resize(function() {
	ytresize();
	courselist();
});