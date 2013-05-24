// adding swipe event to bootstrap carousel
$(document).on('swipe.carousel.data-api', '[data-slide], [data-slide-to]', function (e) {
    var $this = $(this), href
        , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
        , options = $.extend({}, $target.data(), $this.data())
        , slideIndex

    $target.carousel(options)

    if (slideIndex = $this.attr('data-slide-to')) {
        $target.data('carousel').pause().to(slideIndex).cycle()
    }

    e.preventDefault()
})
