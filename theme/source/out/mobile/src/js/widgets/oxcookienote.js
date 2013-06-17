/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxcookienote.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function ( $ ) {

    /**
     * Cookie note handler
     */
    oxCookieNote = {
        options: {
            closeButton : ".cookie-note-dismiss"
        },
        /**
         * Enable cookie note dismiss
         *
         * @return false
         */
        _create: function() {
            var self = this;
            if( !$.cookie("displayedCookiesNotification") ) {
                $.cookie("displayedCookiesNotification", 1, { path: '/', expires: 30 });
            } else {
                self.element.remove();
                return false;
            }
            $(self.options.closeButton, self.element).click(
                function(){
                    self.element.fadeOut('slow').remove();
                    return false;
                }
            );
        }
    };

    /**
     * CookieNote widget
     */
    $.widget("ui.oxCookieNote", oxCookieNote );

})( jQuery );