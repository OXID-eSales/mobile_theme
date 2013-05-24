/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxinfopopup.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxInfoPopup = {
            options: {
                width         : 300,
                resizable     : true,
                zIndex         : 10000,
                target         : '#popup'
            },

            _create: function() {

                var self = this,
                options = self.options,
                el      = self.element;

                var position = el.position();

                el.click(function(){

                    self.openDialog(options.target, options, position);

                    return false;
                });
            },

             openDialog: function (target, options, position) {

                $(target).dialog({

                        width         : options.width,
                        modal         : false,
                        resizable     : options.resizable,
                        zIndex         : options.zIndex,
                        position     : [position.left + 30, position.top - 30],

                        open: function(event, ui) {

                        $('div.ui-dialog-titlebar').css("visibility", "hidden");
                    }
                });
             }
    };

    $.widget("ui.oxInfoPopup", oxInfoPopup );

} )( jQuery );