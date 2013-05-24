
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxattribute.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {
    oxAttribute = {
        options : {
            blShowFilter : true
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

            $(".filterClose").on( "click", function() {
                self.closeFilter();
            });

            $(".dropdown").on( "click", ".dropDownOption", function() {
                $("#filterList input[name^='showFilter']").val("true");
                $("#filterList").submit();
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