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
     * Beta note handler
     */
    oxArticleList = {
        options: {
            listItem : ".media",
            linkItem : ".media-heading-link",
            excludeList : ".quantity, .dropdown, .persParam, .article-list-remove, .add-to-basket",
            removeButton : ".article-list-remove"
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
                var link = $(this).find(self.options.linkItem).attr('href');
                window.location.href = link;
            });
        }
    };

    /**
     * BetaNote widget
     */
    $.widget("ui.oxArticleList", oxArticleList );

})( jQuery );
