/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 */
( function ( $ ) {

    oxShowHide = {
        options: {
            content:          ".product-description",
            maxHeight:        80,
            hideSpeed:        350
        },
        fullHeight: 0,
        truncatedHeight: 0,
        truncated: false,

        _create: function() {
            var $this = this;
            var oBlock = $($this.options.content, $(this.element));

            $this.fullHeight = oBlock.outerHeight(true);
            $this.truncatedHeight = $this.countFullHeight($("> *:first", oBlock), $this.options.maxHeight);

            oBlock.height($this.truncatedHeight);
            $this.truncated = true;

            $(this.element).on("click", function() {
                var newHeight = $this.truncated? $this.fullHeight : $this.truncatedHeight;
                oBlock.animate({height: newHeight}, $this.options.hideSpeed);
                $this.truncated = !$this.truncated;
            });
        },

        countFullHeight: function(element, maxHeight) {
            var $this = this,
                elementHeight = element.height();
            var height = parseInt(element.css("padding-top")) + parseInt(element.css("margin-top"));

            var children = element.children(":not(br):first");
            if (children.length > 0) {
                height += $this.countFullHeight(children, maxHeight);
                return height;
            }
            if (elementHeight <= maxHeight) {
                return height + elementHeight;
            }
            var lineHeight = parseInt(element.css('line-height'));
            var lines = Math.floor(maxHeight / lineHeight);
            return height + (lineHeight * (lines? lines : 1));
        }
};

$.widget("ui.oxShowHide", oxShowHide );

})( jQuery );