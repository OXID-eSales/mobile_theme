/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxlistremovebutton.js 35529 2011-05-23 07:31:20Z vilma $
 */

( function( $ ) {

    oxFormTrigger = {

        _create: function() {

            var self = this;
            var el   = self.element;

            el.click(function() {
                var targetForm = $(this).data("form");
                $("#"+targetForm).submit();
                return false;
            });
        }
    }

    $.widget( "ui.oxFormTrigger", oxFormTrigger );

} )( jQuery );