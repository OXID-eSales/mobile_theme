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

    oxDropDown = {

        options: {
            label            : '.dropdown-toggle span',
            input            : 'input',
            dropdownItems    : '.dropdown-option',
            form             : false
        },

         _create: function() {

            var self = this;
            this.head               = this.element;
            this.selectedValueLabel = $( self.options.label, this.head );
            this.selectedValue      = $( self.options.input, this.head );
            this.dropDownOptions    = $( self.options.dropdownItems, this.head );

            // when rendering if selected value is set
            var selectedValue = this.selectedValue.val();
            if (selectedValue) {
                var selectedOption = this.dropDownOptions.find( 'a[data-selection-id="'+selectedValue+'"]');
                // set selected option text to drop down
                this.selectedValueLabel.html( this.getTitle(selectedOption) );
                // add class 'selected' to selectio option
                selectedOption.parent().addClass('selected');
            }

            $(this.head).on("click", self.options.dropdownItems, function() {
                if ( !$(this).hasClass( 'no-submit' ) ) {
                    self.select($(this));
                }
            });
        },

        /**
         * set selected value
         *
         * @return null
         */
        select : function( oSelectLink ) {
            if (oSelectLink.href && oSelectLink.href != "#") {
                window.location = oSelectLink.href;
            }
            this.selectedValueLabel.html(this.getTitle(oSelectLink));
            this.selectedValue.val( $("a", oSelectLink).data('selection-id')).trigger( 'change' );
            this.dropDownOptions.removeClass('selected');
            oSelectLink.addClass('selected');

            if (this.options.form) {
                $(this.options.form).submit();
            }
        },

        /**
         * Returns given item title
         * @param oItem
         * @returns string
         */
        getTitle : function( oItem ) {
            var title = $(oItem).data("title");
            if (!title) {
                title = $(oItem).text();
            }
            return title;
        }
    }

   $.widget("ui.oxDropDown", oxDropDown );

})( jQuery );
