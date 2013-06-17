/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxagbcheck.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxAGBCheck = {

        _create: function(){

            var self = this,
                options = self.options,
                el      = self.element;

             el.closest('form').submit(function() {
                if( el.prop('checked') ){
                    return true;
                } else {
                    $("p[name='agbError']").show();
                    return false;
                }

            });

            el.click(function() {
                if( el.prop('checked') ){
                    el.prop('checked', true);
                    $("p[name='agbError']").hide();
                } else {
                    el.prop('checked', false);
                }
            });
        }
    }

    $.widget( "ui.oxAGBCheck", oxAGBCheck );

} )( jQuery );