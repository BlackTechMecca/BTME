// preloader
Royal_Preloader.config({
    mode:           'number',
    showProgress:   false,
    background:     '#ffffff'
});

// image zoom
$(document).ready(function() {
    $('.image-zoom-link').magnificPopup({
        type: 'image',
        mainClass: 'mfp-fade',
        fixedContentPos: false
    });
});

// gallery zoom
$('.popup-gallery').each(function() {
     $(this).magnificPopup({ 
        delegate: '.gallery-zoom',
        type:'image',
        gallery: {
            enabled: true
        }
    });
});

// video zoom
$(document).ready(function() {
    $('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
        disableOn: 700,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
    });
});

//responsive video
$(document).ready(function() {
    $(document.body).fitVids();
});

// scroll to top action
$('.scroll-top').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({
        scrollTop: 0
    }, 'slow');
});

// run mixitup portfolio
$(function() {
    $('#myPortfolio').mixitup({
        targetSelector: '.item',
        transitionSpeed: 600
    });
});

// pagination fix
$(function() {
    $(".dropdown-menu > li > a.trigger").on("click", function(e) {
        var current = $(this).next();
        current.toggle();
        e.stopPropagation();
    });
});

//side-navbar
jQuery("li.list-toggle").bind("click", function() {
    jQuery(this).toggleClass("active");
});

//tooltips and popovers
$(function() {
    $("[data-toggle='tooltip']").tooltip();
});
$(function() {
    $("[data-toggle='popover']").popover();
});

//activate skrollr.js
skrollr.init({
    forceHeight: false,
    smoothScrolling: true,
    smoothScrollingDuration: 1500,
        mobileCheck: function() {
        //hack - forces mobile version to be off
        return false;
    }
});

//carousel subnav slider
$(document).ready(function() {
    var clickEvent = false;
    $('#carouselSubnav').on('click', '.nav a', function() {
        clickEvent = true;
        $('#carouselSubnav .nav li').removeClass('active');
        $(this).parent().addClass('active');
    }).on('slid.bs.carousel', function(e) {
        if (!clickEvent) {
            var count = $('#carouselSubnav .nav').children().length - 1;
            var current = $('#carouselSubnav .nav li.active');
            current.removeClass('active').next().addClass('active');
            var id = parseInt(current.data('slide-to'));
            if (count == id) {
                $('#carouselSubnav .nav li').first().addClass('active');
            }
        }
        clickEvent = false;
    });
});

//owl carousel thumbnail caption slider
$('#owl-carousel-product').owlCarousel({
    loop: true,
    margin: 30,
    nav: true,
    dots: true,
    navText: ["<span><</span>", "<span>></span>"],
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 1
        },
        1000: {
            items: 1
        }
    }
})

//owl carousel thumbnail caption slider
$('#owl-carousel-thumb').owlCarousel({
    loop: true,
    margin: 30,
    nav: true,
    dots: false,
    navContainer: '#customNav',
    navText: ["<span><</span>", "<span>></span>"],
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 4
        }
    }
})

//carousel animation fix
function animateElement(obj, anim_) {
    obj.addClass(anim_ + ' animated').one(
        'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        function() {
            $(this).removeClass();
        });
}
$('#carouselHome, #carouselSubnav').on('slide.bs.carousel', function(e) {
    var current = $('.item').eq(parseInt($(e.relatedTarget).index()));
    $('[data-animation]').removeClass();
    $('[data-animation]', current).each(function() {
        var $this = $(this);
        var anim_ = $this.data('animation');
        animateElement($this, anim_);
    });
});

$('.navbar li a').click(function() {
    $('.navbar li a').removeClass('active');
    $(this).addClass('active');
});

//progress bar
$(document).ready(function(){
    var percent = 0, bar = $('.transition-timer-carousel-progress-bar'), crsl = $('#carouselHome');
    function progressBarCarousel() {
      bar.css({width:percent+'%'});
     percent = percent +0.5;
      if (percent>100) {
          percent=0;
          crsl.carousel('next');
      }      
    }
    crsl.carousel({
        interval: false,
        pause: true
    }).on('slide.bs.carousel', function () {percent=0;});var barInterval = setInterval(progressBarCarousel, 30);
    crsl.hover(
        function(){
            clearInterval(barInterval);
        },
        function(){
            barInterval = setInterval(progressBarCarousel, 30);
        })
});

$('#fixed-navbar').affix({
    offset: {
        top: $('.top-bar').height()
    }   
});