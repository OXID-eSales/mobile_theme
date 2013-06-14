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
            oWishlistLogin  : $( ".wishlist-login" ),
            sLoginLink      : $( ".wishlist-login" ).attr( "href" ),
            oWishlistAdder  : $( ".wishlist-adder" ),
            sAddLink        : $( ".wishlist-adder" ).attr( "href" ),
            oAlert          : $( ".wishlist-alert" ),
            oAlertMsgBox    : $( ".wishlist-alert" ).find( "span" ),
            oAlertClose     : $( ".wishlist-alert" ).find( ".close" ),
            oAlertMessages  : $( ".wishlist-alert").find( ".alert-messages" ),
            sHidden         : "hidden",
            sActiveLink     :  "",
            sCookieVar      :  "oxid-mobile-wishlisted",
            iRedirectionTime: 3000,
            sCookiePath     : "/"
        },

        /**
         * Gets translated alert message from alert-messages
         * Returns translated string if it exists and is found,
         * or an empty string, when not found
         *
         * @param key
         *
         * @return string
         */
        getMessage: function( key ) {
            var sMessage = this.options.oAlertMessages.find( key ).html();
            if ( sMessage === undefined ) {
                sMessage = '';
            }
            return sMessage;
        },

        _create: function() {
            var $this = this,
                aWishlisted = $.cookie( this.options.sCookieVar),
                sItemId = $( "form#" + this.element.attr('data-form') ).find( "input[name=aid]").val();

            if ( $( ".wishlist-star" )[0] ) {
                if ( aWishlisted != null ) {
                    if ( this.cookieExists( aWishlisted, sItemId ) ) {
                        this.addWishlisted();
                    }
                }
            }

            this.options.oAlertClose.on( "click", function() {
                $this.hide( $this.options.oAlert );
            } );

            this.options.oWishlistLogin.on( "click", function() {
                $this.hide( $this.options.oAlert );
                $this.options.oAlertMsgBox.text( $this.getMessage( ".please_login" ) );
                $this.show( $this.options.oAlert );

                $this.options.sActiveLink = $this.options.sLoginLink;
                $this.redirect( $this.options.iRedirectionTime );

                return false;
            } );

            this.options.oWishlistAdder.on( "click", function() {
                if ( !$( this ).hasClass( "disabled" ) ) {
                    $this.hide( $this.options.oAlert );
                    $this.options.oAlertMsgBox.text( $this.getMessage( ".adding_to_wishlist" ) );
                    $this.show( $this.options.oAlert );
                    $this.add();
                }
                return false;
            } );

            this.element.on( "click", function(){
                sItemId = $( "form#" + $this.element.attr('data-form') ).find( "input[name=aid]").val()
                $this.deleteCookie( sItemId );
            } );
        },

        hide: function( obj ) {
            obj.addClass( this.options.sHidden );
        },

        show: function(obj) {
            obj.removeClass( this.options.sHidden );
        },

        disable: function( obj ) {
            obj.addClass( "disabled" );
        },

        redirect: function(iTime) {
            var $this = this;
            setTimeout( function(){
                window.location = $this.options.sActiveLink;
            }, iTime );
        },

        add: function() {
            var $this = this;
            $.ajax( {
                url: $this.options.sAddLink
            } ).done( function() {
                $this.options.oAlertMsgBox.text( $this.getMessage( ".done" ) );
                $this.saveCookie();
            } );
        },

        cookieExists: function( aWishlisted, sItemId ) {
            if ( aWishlisted.indexOf( sItemId ) > -1 ) {
                return true;
            } else {
                return false;
            }
        },

        saveCookie: function() {
            var self = this,
                sItemId = $( this.element ).data( "anid" ),
                sCookie = $.cookie( self.options.sCookieVar );
            if ( sCookie != null && sCookie != "" ) {
                var aItems = sCookie.split( "|" );
                if ( !self.cookieExists( aItems, sItemId ) ) {
                    aItems.push( sItemId );
                    $.cookie( self.options.sCookieVar, aItems.join( "|" ) , { path : self.options.sCookiePath } );
                }
            } else {
                var aItems = new Array();
                aItems.push( sItemId );
                $.cookie( self.options.sCookieVar, aItems.join( "|" ) , { path : self.options.sCookiePath } );
            }
            self.addWishlisted();
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

        addWishlisted: function() {
            this.options.oWishlistAdder.addClass( "wishlisted" );
            this.disable( this.options.oWishlistAdder );
        }
    }

    $.widget( "ui.oxWishlistControl", oxWishlistControl );

})( jQuery );