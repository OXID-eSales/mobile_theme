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

    oxWishlistControl = {
        options: {
            oWishlistBtn    : ".wishlist-btn",
            oAlert          : $(".wishlist-alert"),
            oAlertMsgBox    : $(".wishlist-alert span"),
            oAlertClose     : $(".wishlist-alert .close"),
            sCookieVar      :  "oxid-mobile-wishlisted",
            iRedirectionTime: 3000,
            sCookiePath     : "/"
        },

        _create: function() {
            var $this = this;

            $($this.options.oWishlistBtn).each(function() {
                if ( $this.isWishlisted( $(this).attr('data-anid') ) ) {
                    $(this).addClass( "wishlisted" );
                }
            });

            $($this.options.oWishlistBtn).on( "click", function() {
                var sItemId = $(this).attr('data-anid');
                switch ( $(this).data( "action" ) ) {
                    case "login":
                        $this.showAlert("please_login");
                        $this.redirect( $(this).attr("href"), $this.options.iRedirectionTime );
                        break;
                    case "add":
                        if ( $(this).hasClass("wishlisted") ) {
                            break;
                        }
                        $this.add($(this).attr("href"), sItemId);
                        $(this).addClass( "wishlisted" );
                        break;
                    case "remove":
                        $this.deleteCookie( sItemId );
                        break;
                }

                return false;
            } );

            $(this.options.oAlertClose).on( "click", function() {
                $( $this.options.oAlert).hide();
            } );
        },

        /**
         * Gets translated alert message from alert-messages
         * Returns translated string if it exists and is found,
         * or an empty string, when not found
         */
        showAlert: function( key ) {
            var $this = this;
            var oAlertMsg =  $($this.options.oAlertMsgBox);
            var sMessage = oAlertMsg.data("messages")[key];
            if ( sMessage !== undefined ) {
                oAlertMsg.html(sMessage);
            }
            $(this.options.oAlert).show();
        },

        redirect: function(sLink, iTime) {
            var $this = this;
            setTimeout( function(){
                window.location = sLink;
            }, iTime );
        },

        add: function(href, anid) {
            var $this = this;
            $this.showAlert("adding_to_wishlist");
            $.get( href, function() {
                $this.showAlert("done");
                $this.saveCookie( anid );
            } );
        },

        cookieExists: function( aWishlisted, sItemId ) {
            if ( aWishlisted.indexOf( sItemId ) > -1 ) {
                return true;
            } else {
                return false;
            }
        },

        saveCookie: function( sItemId ) {
            var $this = this,
                sCookie = $.cookie( $this.options.sCookieVar );
            if ( sCookie != null && sCookie != "" ) {
                var aItems = sCookie.split( "|" );
                if ( !$this.cookieExists( aItems, sItemId ) ) {
                    aItems.push( sItemId );
                    $.cookie( $this.options.sCookieVar, aItems.join( "|" ) , { path : $this.options.sCookiePath } );
                }
            } else {
                var aItems = new Array();
                aItems.push( sItemId );
                $.cookie( $this.options.sCookieVar, aItems.join( "|" ) , { path : $this.options.sCookiePath } );
            }
        },

        deleteCookie: function( sItemId ) {
            var self = this,
                sCookie = $.cookie( self.options.sCookieVar );
            if ( sCookie != null ) {
                var aItems = sCookie.split( "|" );
                if ( self.cookieExists( aItems, sItemId ) ) {
                    aItems.splice( aItems.indexOf( sItemId ), 1 );
                    $.cookie( self.options.sCookieVar, aItems.join( "|" ) , { path : self.options.sCookiePath } );
                }
            }
        },

        isWishlisted: function( anid ) {
            var aWishlisted = $.cookie( this.options.sCookieVar );

            if ( aWishlisted != null && this.cookieExists( aWishlisted, anid ) ) {
                return true;
            }
            return false;
        }
    }

    $.widget( "ui.oxWishlistControl", oxWishlistControl );

})( jQuery );