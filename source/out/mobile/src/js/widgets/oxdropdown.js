/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxdropdown.js 35529 2011-05-23 07:31:20Z vilma $
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
