/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxpromocategory.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxCenterElementOnHover = {

        _create: function(){

            var self = this;
            var el   = self.element;

             el.hover(function(){
                  var targetObj = $(".viewAllHover", el);
                  var targetObjWidth = targetObj.outerWidth() / 2;
                  var parentObjWidth = el.width() / 2;

                  targetObj.css("left", parentObjWidth - targetObjWidth + "px");
                  targetObj.show();
              }, function(){
                  $(".viewAllHover", el).hide();
              });
        }
    }

    $.widget( "ui.oxCenterElementOnHover", oxCenterElementOnHover );

} )( jQuery );
