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

( function ( $ ) {

    /**
     * Placeholder fallback widget.
     */
    oxPlaceholderFallback = {

        /**
         * Checks if browser supports placeholder, if not - adds fallback.
         * @private
         */
        _create: function() {
            if( typeof Modernizr === "undefined" || !Modernizr.input.placeholder ) {
                var $this = this,
                    form = $this.element,
                    formInputs = $('input[placeholder]', form);

                formInputs.each($this.addLabel)
                          .focus($this.removeLabel)
                          .blur($this.addLabel);

                form.submit(function() {
                    formInputs.each($this.removeLabel);
                });
            }
        },

        /**
         * Removes label from the input
         */
        removeLabel: function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        },

        /**
         * Adds label to the input
         */
        addLabel: function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }
    };

    /**
     * placeholder fallback widget
     */
    $.widget("ui.oxPlaceholderFallback", oxPlaceholderFallback );

})( jQuery );
