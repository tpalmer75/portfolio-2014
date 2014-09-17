// Detect touch screens and add class to HTML
    var is_touch_device = 'ontouchstart' in document.documentElement;

    if (is_touch_device) {
    	$('html').addClass('touch');
    } else {
    	$('html').addClass('no-touch');
    }


// SVG feature detection

!function () {
  function supportsSVG() { return !!document.createElementNS && !! document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect }
    if (supportsSVG()) document.documentElement.className += ' svg'
    else document.documentElement.className += ' no-svg'
}()

// Menu button

$('#menu-button').click(function() {
  $('body').toggleClass('with-sidebar');
});