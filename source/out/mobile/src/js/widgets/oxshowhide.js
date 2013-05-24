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
            blockTruncated : ".descriptionTrunc",
            blockFull : ".descriptionFull"
        },

        _create: function() {
            var oDescTrunc = $(this.options.blockTruncated, this.element);
            var oDescFull = $(this.options.blockFull, this.element);
            var iSpeed = 350;
            oDescTrunc.on("click", function() {
                // TODO: animate
                oDescTrunc.addClass("hidden");
                oDescFull.removeClass("hidden");
            });
            oDescFull.on("click", function() {
                oDescFull.addClass("hidden");
                oDescTrunc.removeClass("hidden");
            });
        }
};

$.widget("ui.oxShowHide", oxShowHide );

})( jQuery );