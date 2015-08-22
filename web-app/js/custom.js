j$ = jQuery.noConflict();

(function (j$) {

	new WOW().init();

	jQuery(window).load(function() { 
		jQuery("#preloader").delay(100).fadeOut("slow");
		jQuery("#load").delay(100).fadeOut("slow");
	});

	//jQuery to collapse the navbar on scroll
	j$(window).scroll(function() {
		if (j$(".navbar").offset().top > 50) {
			j$(".navbar-fixed-top").addClass("top-nav-collapse");
		} else {
			j$(".navbar-fixed-top").removeClass("top-nav-collapse");
		}
	});

	//jQuery for page scrolling feature - requires jQuery Easing plugin
	j$(function() {
		j$('.navbar-nav li a').bind('click', function(event) {
			var j$anchor = j$(this);
			j$('html, body').stop().animate({
				scrollTop: j$(j$anchor.attr('href')).offset().top
			}, 1500, 'easeInOutExpo');
			event.preventDefault();
		});
		j$('.page-scroll a').bind('click', function(event) {
			var j$anchor = j$(this);
			j$('html, body').stop().animate({
				scrollTop: j$(j$anchor.attr('href')).offset().top
			}, 1500, 'easeInOutExpo');
			event.preventDefault();
		});
	});
})(jQuery);
