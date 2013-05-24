/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxenterpassword.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {
    /**
     * Show password field if email will be changed
     */
    oxEnterPassword = {
        options: {
            metodEnterPasswd      : "oxValidate_enterPass"
        },

        _create: function()
        {
            var self    = this,
            options = self.options,
            el      = self.element;

            el.bind ( "keyup", function() {
                self.showInput( el, el.val() != el.prop( "defaultValue" ), options.metodEnterPasswd );
            });
        },

        /**
         * Shows/hides given element
         */
        showInput: function( oSource, blShow, sClass )
        {
            var oRegexp  = new RegExp( sClass + "Target\\[(.+)\\]", "g" );
            var sClasses = oRegexp.exec( oSource.attr( "class" ) );
            if ( sClasses && sClasses.length ) {
                var aClasses = sClasses[1].split(",");

                for (var i = 0; i < aClasses.length; i++) {
                    if (blShow) {
                        $("." + aClasses[i]).show();
                    }
                    else {
                        $("." + aClasses[i]).hide();
                    }
                }
            }
        }

    }

    $.widget( "ui.oxEnterPassword", oxEnterPassword );

} )( jQuery );