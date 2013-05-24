/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxinnerlabel.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxInnerLabel = {

        options: {
                sDefaultValue  : 'innerLabel',
                sReloadElement : ''
        },

        _create: function(){

            var self = this,
                options = self.options,
                input = self.element,
                label = $("label[for='"+input.attr('id')+"']");

            self._reload( input, label );

            input.focus(function() {
                label.hide();
            });

            input.blur(function() {
                if ( $.trim(input.val()) == ''){
                    label.show();
                }
            });

            if ($.trim(input.val()) != '') {
                label.hide();
            }
            input.delay(500).queue(function(){
                if ($.trim(input.val()) != '') {
                    label.hide();
                }
            });

            $(options.sReloadElement).click(function() {
                setTimeout(function(){ self._reload( self.element, label ); }, 100);
            });
       },
       
       _reload : function( input, label ){
           var pos = input.position();
           label.css( { "left": (pos.left) + "px", "top":(pos.top) + "px" } );
       }
    }

    $.widget( "ui.oxInnerLabel", oxInnerLabel );

} )( jQuery );