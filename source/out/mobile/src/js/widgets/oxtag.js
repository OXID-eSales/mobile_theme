/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxtag.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function ( $ ) {

    oxTag = {

         highTag : function() {

            var oSelf = $(this);

            $("p.tagError").hide();

            oxAjax.ajax(
                $("#tagsForm"),
                {//targetEl, onSuccess, onError, additionalData
                    'targetEl' : $("#tags"),
                    'additionalData' : {'highTags' : oSelf.prev().text(), 'blAjax' : '1'},
                    'onSuccess' : function(response, params) {
                        oSelf.prev().addClass('taggedText');
                        oSelf.hide();
                    }
                }
            );
            return false;
        },

        saveTag : function() {
            $("p.tagError").hide();

            oxAjax.ajax(
                $("#tagsForm"),
                {//targetEl, onSuccess, onError, additionalData
                    'targetEl' : $("#tags"),
                    'additionalData' : {'blAjax' : '1'},
                    'onSuccess' : function(response, params) {
                        response = JSON.parse(response);
                        if ( response.tags.length > 0 ) {
                            $(".tagCloud").append("<span class='taggedText'>, " + response.tags + "</span> ");
                        }
                        if ( response.invalid.length > 0 ) {
                            var tagError = $("p.tagError.invalid").show();
                            $("span", tagError).text( response.invalid );
                        }
                        if ( response.inlist.length > 0 ) {
                            var tagError = $("p.tagError.inlist").show();
                            $("span", tagError).text( response.inlist );
                        }
                    }
                }
            );
            return false;
        },

        cancelTag : function () {
            oxAjax.ajax(
                $("#tagsForm"),
                {//targetEl, onSuccess, onError, additionalData
                    'targetEl' : $("#tags"),
                    'additionalData' : {'blAjax' : '1', 'fnc' : 'cancelTags'},
                    'onSuccess' : function(response, params) {
                        if ( response ) {
                            $('#tags').html(response);
                            $("#tags #editTag").click(oxTag.editTag);
                        }
                    }
                }
            );
            return false;
        },

        editTag : function() {

            oxAjax.ajax(
                $("#tagsForm"),
                { //targetEl, onSuccess, onError, additionalData
                    'targetEl' : $("#tags"),
                    'additionalData' : {'blAjax' : '1'},
                    'onSuccess' : function(response, params) {

                        if ( response ) {
                            $('#tags').html(response);
                            $("#tags .tagText").click(oxTag.highTag);
                            $('#tags #saveTag').click(oxTag.saveTag);
                            $('#tags #cancelTag').click(oxTag.cancelTag);
                        }
                    }
                }
            );

            return false;
        }
    }

    $.widget("ui.oxTag", oxTag );

})( jQuery );