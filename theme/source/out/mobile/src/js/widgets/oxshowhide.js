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

    oxShowHide = {
        options: {
            content:          ".product-description",
            moreBtn:          ".product-description-container > i",
            maxHeight:        80,
            hideSpeed:        350
        },
        fullHeight: 0,
        truncatedHeight: 0,
        truncated: false,

        _create: function() {
            var $this = this;
            var oBlock = $($this.options.content, $(this.element));
            var moreBtn = $($this.options.moreBtn);

            $this.fullHeight = oBlock.outerHeight(true);
            $this.truncatedHeight = ($this.options.maxHeight != 0)? $this.countFullHeight($("> *:first", oBlock), $this.options.maxHeight) : 0;

            oBlock.height($this.truncatedHeight);
            $this.truncated = true;

            $(this.element).on("click", function() {
                var newHeight = $this.truncated? $this.fullHeight : $this.truncatedHeight;
                oBlock.animate({height: newHeight}, $this.options.hideSpeed);
                if ($this.truncated) {
                    moreBtn.removeClass(moreBtn.data("toggle-down")).addClass(moreBtn.data("toggle-up"));
                } else {
                    moreBtn.removeClass(moreBtn.data("toggle-up")).addClass(moreBtn.data("toggle-down"));
                }
                $this.truncated = !$this.truncated;
            });
        },

        countFullHeight: function(element, maxHeight) {
            var $this = this,
                elementHeight = element.height();
            var height = parseInt(element.css("padding-top")) + parseInt(element.css("margin-top"));

            var children = element.children(":not(br):first");
            if (children.length > 0) {
                height += $this.countFullHeight(children, maxHeight);
                return height;
            }
            if (elementHeight <= maxHeight) {
                return height + elementHeight;
            }
            var lineHeight = parseInt(element.css('line-height'));
            var lines = Math.floor(maxHeight / lineHeight);
            return height + (lineHeight * (lines? lines : 1));
        }
};

$.widget("ui.oxShowHide", oxShowHide );

})( jQuery );