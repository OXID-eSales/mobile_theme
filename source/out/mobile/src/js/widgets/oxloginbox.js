/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxloginbox.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxLoginBox = {

        _create: function(){

            var self = this,
                options = self.options,
                el      = self.element;

            el.click(function(){
                $("#loginBox").show();
                return false;
            });

            $(".altLoginBox .fb_button").on("click", function(){
                $("#loginBox").hide();
            });

            $(document).click( function( e ){
                if( ! $(e.target).parents("div").hasClass("loginBox") ){
                    $("#loginBox").hide();
                }
            });

            $(document).keydown( function( e ) {
               if( e.which == 27) {
                    $("#loginBox").hide();
               }
            });
        }
    }

    $.widget( "ui.oxLoginBox", oxLoginBox );

} )( jQuery );