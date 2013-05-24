/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (C) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxbetanote.js 35529 2012-05-23 07:31:20Z tomas $
 */
( function ( $ ) {

    /**
     * Beta note handler
     */
    oxBetaNote = {
        options: {
            cookieName  : "hideBetaNote",
            closeButton : ".dismiss"
        },

        /**
         * Enable beta note dismiss and set cookie to keep it hidden on next pages
         *
         * @return integer
         */
        _create: function() {
            
            var self = this;
            $(self.options.closeButton, self.element).click(
                function(){
                    self.element.fadeOut('slow').remove();
                    $.cookie(self.options.cookieName,1,{path: '/'});
                    
                    if(  $('#cookieNote:visible') ) {
                        $('#cookieNote').animate({ "top": "-=40px" }, 500);
                    }
                    
                    return false;
                }
            );
            
            if( !$.cookie("hideBetaNote") ) {
                $('#betaNote').show();
            } 
            
            if(  $('#cookieNote:visible') ) {
                $('#cookieNote').css('top', '40px');
            }
            
        }
    };

    /**
     * BetaNote widget
     */
    $.widget("ui.oxBetaNote", oxBetaNote );

})( jQuery );
