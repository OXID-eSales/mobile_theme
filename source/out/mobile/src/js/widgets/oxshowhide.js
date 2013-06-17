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

            $this.fullHeight = oBlock.outerHeight();
            var firstElement = $("*:first-child", oBlock);
            $this.truncatedHeight = firstElement.outerHeight();
            if ($this.truncatedHeight > $this.options.maxHeight) {
                $this.truncatedHeight = parseInt(firstElement.css("line-height"));
            }
            oBlock.height($this.truncatedHeight);
            $this.truncated = true;

            $(this.element).on("click", function() {
                var newHeight = $this.truncated? $this.fullHeight : $this.truncatedHeight;
                oBlock.animate({height: newHeight}, $this.options.hideSpeed);
                $this.truncated = !$this.truncated;
            });
        }
};

$.widget("ui.oxShowHide", oxShowHide );

})( jQuery );