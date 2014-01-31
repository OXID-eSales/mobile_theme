/**
 * This file is part of OXID eSales mobile theme.
 *
 * OXID eSales mobile theme is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales mobile theme is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales mobile theme.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
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