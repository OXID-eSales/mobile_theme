/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (C) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxbetanote.js 35529 2012-05-23 07:31:20Z tomas $
 */
( function ( $ ) {

    /**
     * Beta note handler
     */
    oxArticleList = {
        options: {
            listItem : "li.productData",
            excludeList : ".quantity, .dropdown, .persParam, .basketRemove",
            removeButton : ".basketRemove"
        },

        /**
         * Fix remove button
         *
         * @return integer
         */
        _create: function() {
            var self = this;

            $(self.options.removeButton, self.element).click(function(e) {
                $(this).find('input[type=hidden]').attr("value", 1);
                var form = $(this).parents('form');
                var input = $("<input>").attr("type", "hidden").attr("name", $(this).find('button').attr('name')).val("1");
                form.append($(input)).submit();
            });

            self.element.on("click", self.options.listItem, function(e) {
                if($(e.target).closest(self.options.excludeList).length != 0) {
                    return;
                }
                var link = $(this).find('a.poductListTitleLink').attr('href');
                window.location.href = link;
            });
        }
    };

    /**
     * BetaNote widget
     */
    $.widget("ui.oxArticleList", oxArticleList );

})( jQuery );
