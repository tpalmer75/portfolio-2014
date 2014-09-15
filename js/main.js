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


// ------ SAFARI SIZING FIX -------

// Detect Safari Browsers except for Chrome
if (navigator.userAgent.indexOf('Safari') != -1 && !navigator.userAgent.match(/(Chrome)|(Windows)/) ) { 

 
  // Safari Size Function
  var safariSize = function() {
       
    var page = $('#page');
   
    // Strip inline width
    page.css('width', '');
    
    // Find page width
    var pageWidth = $('#page').width();
    // Finding the nearest width divisible by 12, add 13 for gap
    var safariWidth = Math.floor(pageWidth / 12) * 12 + 13;

    // If the page is not divisible by 12, make new width
    page.css('width', safariWidth);
    
  };

  // Run function on resize
  $(window).resize(safariSize);
  // Trigger resize on load to run safariSize function
  $(window).trigger($.Event('resize'));
}



// Masonry

var $container = $('#page');
$container.masonry({
  columnWidth: '.grid-sizer',
  itemSelector: '.item'
});


// Menu button

$('#menu-button').click(function() {
  $('body').toggleClass('with-sidebar');
});