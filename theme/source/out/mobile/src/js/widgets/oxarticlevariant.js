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

    var oxArticleVariant = {

        /**
         * Initiating article variants selector
         * @private
         */
        _create: function () {
            $("ul.vardrop a").click( variantSelectActionHandler );

            $("form.js-oxWidgetReload").submit( formSubmit );
            $("form.js-oxProductForm").submit( formSubmit );
        },

        /**
         * Reloads block
         *
         * @param activator
         * @param highlightTargets
         * @param contentTarget
         * @param aOptions
         * @returns {boolean}
         */
        reload: function ( activator, highlightTargets, contentTarget, aOptions ) {
            preAjaxCaller();
            oxAjax.ajax(
                activator, {//targetEl, onSuccess, onError, additionalData
                    'targetEl'  : highlightTargets,
                    'iconPosEl' : $("#variants .dropdown"),
                    'additionalData' : aOptions,
                    'onSuccess' : function(r) {
                        $( contentTarget ).html( r );
                        if ( typeof WidgetsHandler !== 'undefined') {
                            WidgetsHandler.reloadWidget('oxwarticledetails');
                        } else {
                            oxAjax.evalScripts(contentTarget);
                        }
                    }
                }
            );
            return false;
        }
    }

    /**
     * Handles variant selection action
     * @returns {boolean}
     */
    function variantSelectActionHandler( e ) {
        var obj = $( this );
        // resetting
        if ( obj.parents().hasClass("js-disabled") ) {
            resetVariantSelections();
        } else {
            $( "form.js-oxProductForm input[name=anid]" ).attr( "value", $( "form.js-oxProductForm input[name=parentid]" ).attr( "value" ) );
        }

        // setting new selection
        if ( obj.parents('.js-fnSubmit').length > 0 ) {

            var selection = $( 'input:hidden', obj.parents('div.dropdown') );
            $(selection).val( obj.data('selection-id') );

            var formProduct = $( 'form.js-oxProductForm' );
            $( 'input[name="' + $(selection).attr('name') + '"]', formProduct ).val( obj.data('selection-id') );

            var formWidget = $( 'form.js-oxWidgetReload' );
            $( 'input[name="' + $(selection).attr('name') + '"]', formWidget ).val( obj.data('selection-id') );
            $( 'input[name=fnc]', formWidget ).val( '' );

            formWidget.submit();
        }

        return false;
    }

    /**
     * Resets variant selections
     */
    function resetVariantSelections() {
        var aVarSelections = $( "form.js-oxProductForm input[name^=varselid], form.js-oxWidgetReload input[name^=varselid]" );
        for (var i = 0; i < aVarSelections.length; i++) {
            $( aVarSelections[i] ).attr( "value", "" );
        }
        $( "form.js-oxProductForm input[name=anid]" ).attr( "value", $( "form.js-oxProductForm input[name=parentid]" ).attr( "value" ) );
    }

    /**
     * Handles form submit
     *
     * @returns {*}
     */
    function formSubmit() {
        var aOptions = {}, target = $(this);
        if (!$("input[name='fnc']", this).val()) {
            if (($( "input[name=aid]", this ).val() == $( "input[name=parentid]", this ).val() )) {
                var aSelectionInputs = $("input[name^=varselid]", $("form.js-oxProductForm"));
                if (aSelectionInputs.length) {
                    var sHash = '';
                    aSelectionInputs.not("*[value='']").each(function(i) {
                        sHash = sHash+i+':'+$(this).val()+"|";
                        aOptions[$(this).attr( "name" )] = $(this).val();
                    });
                    if ( jQuery.inArray( sHash, oxVariantSelections ) === -1 ) {
                        return oxArticleVariant.reload( $(target), $("#details_container"), $("#details_container")[0], aOptions);
                    }
                }
            }
            return oxArticleVariant.reload( $(target),$("#details_container"),$("#details_container")[0], aOptions);
        }
    }

    /**
     * Runs defined scripts inside the method, before ajax is called
     */
    function preAjaxCaller() {
        $('#zoomModal').remove();
    }

    $.widget("ui.oxArticleVariant", oxArticleVariant );

})( jQuery );