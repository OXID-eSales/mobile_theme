/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxreview.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxReview = {
        options: {
            reviewButton : "#writeNewReview",
            reviewForm   : "#writeReview"
        },

        _create: function() {

            var self    = this;
            var options = self.options;
            var el      = self.element;

            $( options.reviewButton ).click(function(){
                $( options.reviewForm ).slideToggle();
                $( options.reviewButton ).hide();
                return false;
            });
        }
    };

    /**
     * Review widget
     */
    $.widget("ui.oxReview", oxReview );


} )( jQuery );