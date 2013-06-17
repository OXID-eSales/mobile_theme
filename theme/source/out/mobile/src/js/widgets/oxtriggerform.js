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
                var oTargetForm = self.getForm( self );
                oTargetForm.submit();
                return false;
            });
        },

        getTargetForm: function( ) {
            var oForm = this.element.closest( 'form' );
            return oForm;
        },

        getReferenceForm: function( ) {
            var sForm = this.element.attr( 'data-form' );
            return ( sForm ? $( 'form#' + sForm ) : undefined );
        },

        getForm: function( oObj ) {
            var oForm = oObj.getReferenceForm();
            return ( oForm ? oForm : oObj.getTargetForm() );
        }
    }

    $.widget( 'ui.oxFormTrigger', oxFormTrigger );

} )( jQuery );