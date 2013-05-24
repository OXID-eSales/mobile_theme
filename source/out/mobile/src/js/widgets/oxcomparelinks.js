/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (C) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxcomparelinks.js 35529 2012-05-23 07:31:20Z tomas $
 */
( function ( $ ) {

    /**
     * Beta note handler
     */
    oxCompareLinks = {

        /**
         * Update compare links, hide add link and show remove link.
         *
         * @param id
         * @param state 1=hide add, 0=hide remove
         *
         * @return void
         */
        updateLinks: function(list)
        {
            if (list) {
                $.each(list, function(id) {
                    $("a.compare.add[data-aid='"+id+"']").css('display','none');
                    $("a.compare.remove[data-aid='"+id+"']").css('display','block');
                });
            }
        }
    };

    /**
     * CompareLinks widget
     */
    $.widget("ui.oxCompareLinks", oxCompareLinks );

})( jQuery );
