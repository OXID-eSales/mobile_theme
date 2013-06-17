/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxpayment.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {
    oxPayment = {
        _create: function(){
            var self = this,
                options = self.options,
                el = self.element;

            $("dl dt input[type=radio]", el).click(function(){
                $("dd", el).hide();
                $(this).parents("dl").children("dd").toggle();
            });
        }
    }

    $.widget( "ui.oxPayment", oxPayment );

} )( jQuery );