/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link         http://www.oxid-esales.com
 * @package      out
 * @copyright    (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @description  Details page wishlist control
 */
( function ( $ ) {

    oxWishlistControl = {
        options: {
            oWishlistLogin  : $('.wishlistLogin'),
            sLoginLink      : $('.wishlistLogin').attr('href'),

            oWishlistAdder  : $('.wishlistAdder'),
            sAddLink        : $('.wishlistAdder').attr('href'),

            oWishlistRemover : $('.removeFromWishList > .btn'),

            oAlert          : $('.wishlistAlert'),
            oAlertMsgBox    : $('.wishlistAlert').find('span'),
            oAlertClose     : $('.wishlistAlert').find('.close'),

            sHidden         : 'hidden',
            sActiveLink     :  '',

            sCookieVar      :  'oxid-mobile-wishlisted',

            iRedirectionTime: 3000
        },
        _create: function() {
            var $this = this,
                aWishlisted = $.cookie(this.options.sCookieVar),
                sItemId = $(this.element).data("anid");

            this.options.oWishlistRemover.on('click', function() {
                sItemId = this.data("anid");
                $this._deleteCookie(sItemId);
            });

            if ( $(this).hasClass('wishlistStar') ) {
                if ( aWishlisted != null) {
                    if ( this._cookieExists(aWishlisted,sItemId) ) {
                        this._addWishlisted();
                    }
                }
            }

            this.options.oAlertClose.on('click', function() {
                $this._hide($this.options.oAlert);
            });

            this.options.oWishlistLogin.on('click', function() {
                $this._hide($this.options.oAlert);
                $this.options.oAlertMsgBox.text("You must login first!");
                $this._show($this.options.oAlert);

                $this.options.sActiveLink = $this.options.sLoginLink;
                $this._redirect($this.options.iRedirectionTime);

                return false;
            });

            this.options.oWishlistAdder.on("click", function() {
                if ( !$(this).hasClass('disabled') ) {
                    $this._hide($this.options.oAlert);
                    $this.options.oAlertMsgBox.text("Adding to wishlist!");
                    $this._show($this.options.oAlert);

                    $this._add();
                }
                return false;
            });

            this.options.oWishlistRemover.on("click", function(){
                $this._deleteCookie();
            });
        },
        _hide: function(obj) {
            obj.addClass(this.options.sHidden);
        },
        _show: function(obj) {
            obj.removeClass(this.options.sHidden);
        },
        _disable: function(obj) {
            obj.addClass('disabled');
        },
        _redirect: function(iTime) {
            var $this = this;
            setTimeout( function(){
                window.location = $this.options.sActiveLink;
            }, iTime );
        },
        _add: function() {
            var $this = this;
            $.ajax({
                url: $this.options.sAddLink
            }).done(function() {
                $this.options.oAlertMsgBox.text("Done.");
                $this._saveCookie();
            });
        },
        _cookieExists: function(aWishlisted,sItemId) {
            if ( aWishlisted.indexOf(sItemId) > -1 ) {
                return true;
            } else {
                return false;
            }
        },
        _saveCookie: function() {
            var self = this,
                sItemId = $(this.element).data("anid"),
                sCookie = $.cookie(self.options.sCookieVar);
            if (sCookie != null) {
                var aItems = sCookie.split('|');
                if (!self._cookieExists(aItems, sItemId)) {
                    aItems.push(sItemId);
                    $.cookie(self.options.sCookieVar, aItems);
                }
            } else {
                var aItems = new Array();
                aItems.push(sItemId);
                $.cookie( self.options.sCookieVar, aItems.join('|') );
            }
            self._addWishlisted();
        },
        _deleteCookie: function(sItemId) {
            var self = this,
                sCookie = $.cookie(self.options.sCookieVar);
            if (sCookie != null) {
                var aItems = sCookie.split('|');
                if (self._cookieExists(aItems, sItemId)) {
                    aItems.pop(sItemId);
                    $.cookie( self.options.sCookieVar, aItems.join('|') );
                }
            }
        },
        _addWishlisted: function() {
            this.options.oWishlistAdder.addClass("wishlisted");
            this._disable(this.options.oWishlistAdder);
        }
    }

    $.widget("ui.oxWishlistControl", oxWishlistControl );

})( jQuery );