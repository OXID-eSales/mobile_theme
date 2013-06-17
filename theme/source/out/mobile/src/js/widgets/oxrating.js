/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxrating.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxRating = {
        options: {
            reviewButton         : "writeNewReview",
            articleRatingValue   : "productRating",
            listManiaRatingValue : "recommListRating",
            currentRating        : "reviewCurrentRating",
            reviewForm           : "writeReview",
            reviewDiv            : "review",
            hideReviewButton     : true,
            openReviewForm       : true,
            ratingElement        : "a.ox-write-review"
        },

        _create: function() {

            var self     = this;
            var options = self.options;
            var el      = self.element;

            $( options.ratingElement, el ).each( function(i){

                $(this).click(function(){

                    self.setRatingValue( $('#' + options.articleRatingValue), i + 1 );

                    self.setRatingValue( $('#' + options.listManiaRatingValue), i + 1 );

                    self.setCurrentRating( $('#' + options.currentRating), ( ( i + 1 ) * 20) + '%' );

                    if ( options.openReviewForm ){
                        self.openReviewForm( $("#" + options.reviewForm) );
                    }

                    if ( options.hideReviewButton ){
                        self.hideReviewButton( $('#' + options.reviewButton) );
                    }
                    return false;
                });
            });
        },

        /**
         * set rating value on form element
         *
         * @return object
         */
        setRatingValue: function( oElement, value )
        {
            oElement.val(value);
            return oElement;
        },

        /**
         * set rating value on stars
         *
         * @return object
         */
        setCurrentRating: function( oElement, value )
        {
            oElement.width( value );
            return oElement;
        },


        /**
         * hide review button
         *
         * @return object
         */
        hideReviewButton: function( oButton )
        {
            oButton.hide();
            return oButton;
        },

        /**
         * open review form
         *
         * @return object
         */
        openReviewForm: function( oForm )
        {
            $( "html,body" ).animate( {
                scrollTop: $( "#" + this.options.reviewDiv ).offset().top
            }, 1000, function(){
                oForm.slideDown();
            } );

            return oForm;
        }

    };

    /**
     * Rating widget
     */
    $.widget("ui.oxRating", oxRating );


} )( jQuery );
