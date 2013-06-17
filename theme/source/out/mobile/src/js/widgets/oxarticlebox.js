/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxarticlebox.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function( $ ) {

    oxArticleBox = {

        _create: function(){
            var oSelf         = this,
                oElement      = oSelf.element,
                sTitlePattern = /^(.+) \([0-9]+\)$/,
                sEndPattern   = / \([0-9]+\)$/;

            //hide all
            $('.articleImage', oElement).hide();

            //open first
            $('.articleImage:first', oElement).show();
            $('.articleImage:first', oElement).addClass('showImage');

            $('.articleTitle', oElement).mouseover(function() {

                //if not opened
                if ($(this).prev().is(':hidden') == true) {

                    //closing opened
                    $('.articleTitle', oElement).removeClass('titleOn');
                    $('.showImage', oElement).slideUp(500);

                    //opening selected
                    $(this).addClass('titleOn');
                    $(this).prev().addClass('showImage')
                    $(this).prev().slideDown(500);
                }
            });

            // triming titles to mach container width (if needed)
            $( ".box h3 a", oElement ).each(function() {
                var iTitleWidth = $(this).width(),
                    iContWidth  = $(this).parent().width(),
                    sTitleText  = $.trim($(this).text());

                // if title is longer than its container
                if (iTitleWidth > iContWidth) {

                    // checking if title has numbers at the end
                    var sTitleEnd	    = $.trim(sEndPattern.exec(sTitleText));

                    // seperating the title from the numbers
                    if (sTitleEnd) {
                        sTitleEnd  = ' ' + sTitleEnd;
                        sTitleText = sTitlePattern.exec(sTitleText).pop();
                    }

                    // getting the length of the title
                    var iTitleLength = sTitleText.length;

                    while (iTitleWidth > iContWidth)
                    {
                        iTitleLength--;
                        $(this).html(sTitleText.substr(0, iTitleLength)+'&hellip;' + sTitleEnd);
                        var iTitleWidth = $(this).width();
                    }
                    $(this).attr('title',sTitleText);
                }
            });
        }
    }

    $.widget( "ui.oxArticleBox", oxArticleBox );

} )( jQuery );
