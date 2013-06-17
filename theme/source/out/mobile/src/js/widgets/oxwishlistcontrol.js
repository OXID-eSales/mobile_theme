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