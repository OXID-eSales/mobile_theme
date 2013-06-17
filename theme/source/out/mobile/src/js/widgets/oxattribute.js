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
    oxAttribute = {
        options : {
            blShowFilter : true,
            dropdownItems    : '.dropdown-option'
        },

        _create: function(){
            var self = this;

            if (this.options.blShowFilter ) {
                self.showFilter();
            } else {
                self.hideFilter();
            }

            $("#filterBoxClosed").on( "click", function() {
                self.showFilter();
            });

            $(".filter-close").on( "click", function() {
                self.closeFilter();
            });

            $(".dropdown").on( "click", self.options.dropdownItems, function() {
                if ( !$(this).hasClass( 'no-submit' ) ) {
                    $("#filterList input[name^='showFilter']").val("true");
                    $("#filterList").submit();
                }
            });
        },

        /**
         * Show filter box
         */
        showFilter: function()
        {
            $("#filterBoxOpened").show();
            $("#filterBoxClosed").hide();
        },

        /**
         * Hide filter box
         */
        hideFilter: function()
        {
            $("#filterBoxOpened").hide();
            $("#filterBoxClosed").show();
        },

        /**
         * Closes filter box and resets filter
         */
        closeFilter: function()
        {
            var hasFilter = false;
            $("#filterBoxOpened input[name^='attrfilter']").each( function(){
                if('' != $(this).attr('value') ) {
                    hasFilter = true;
                }
            });
            if (hasFilter) {
                $(".dropdown").find("input").attr("value", "");
                $("#filterList").submit();
            } else {
                this.hideFilter();
            }
        }
    }

    $.widget( "ui.oxAttribute", oxAttribute );

} )( jQuery );