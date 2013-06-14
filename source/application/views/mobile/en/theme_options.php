<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   lang
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: theme_lang.php 28697 2010-06-29 11:09:58Z vilma $
 */

$aLang = array(
'charset'                                       => 'ISO-8859-15',

'SHOP_THEME_GROUP_images'                       => 'Images',
'SHOP_THEME_GROUP_display'                      => 'Display',

'SHOP_THEME_sIconsize'                          => 'Icon size (width*height)',//SHOP_CONFIG_ICONSIZE
'HELP_SHOP_THEME_sIconsize'                     => 'Icons are the smallest pictures of a product. They are used: <br>' .
                                                 '<ul><li>in the shopping cart.</li>' .
                                                 '<li>if products are shown in the right menu (e.g. in <span class="filename_filepath_or_italic">TOP of the Shop</span> and <span class="filename_filepath_or_italic">Bargain</span>).</li></ul>' .
                                                 'For avoiding design issues caused by too big icons the icons are resized. Enter the maximum size for icons here.',

'SHOP_THEME_sThumbnailsize'                     => 'Thumbnail size (width*height)',//SHOP_CONFIG_THUMBNAILSIZE
'HELP_SHOP_THEME_sThumbnailsize'                => 'Thumbnails are small product pictures. They are used:<br>' .
                                                 '<ul><li>in product lists.</li>' .
                                                 '<li>in promotions displayed in the middle of the front page, e. g. <span class="filename_filepath_or_italic">Just arrived!</span>.</li></ul>' .
                                                 'For avoiding design issues caused by too big thumbnails the thumbnails are resized. Enter the maximum size for thumbnails here.',

'SHOP_THEME_sZoomImageSize'                     => 'Zoom picture size (width*height)',//SHOP_CONFIG_ZOOMIMAGESIZE
'SHOP_THEME_aDetailImageSizes'                  => 'Product picture size (width*height)',//SHOP_CONFIG_DETAILIMAGESIZE

'SHOP_THEME_sManufacturerIconsize'              => 'Manufacturer\'s/brand logo size', // Check if this is really manufacturer or if it is more like "brand"
'HELP_SHOP_THEME_sManufacturerIconsize'         => 'Manufacturer\'s/brand logo is shown on start page in manufacturer\'s slider.',

'SHOP_THEME_sCatPromotionsize'                  => 'Category picture size for promotion on startpage (width*height)',
'HELP_SHOP_THEME_sCatPromotionsize'             => 'Category promotion on start page needs special size for category pictures. Define size of those pictures here.',

'SHOP_THEME_blShowBirthdayFields'               => 'Display input fields for date of birth when users enter their personal data',//SHOP_CONFIG_SHOWBIRTHDAYFIELDS

'SHOP_THEME_iNewBasketItemMessage'              => 'Select action when product is added to cart',//SHOP_SYSTEM_SHOWNEWBASKETITEMMESSAGE
'HELP_SHOP_THEME_iNewBasketItemMessage'         => 'When customer adds products to cart, OXID eShop can behave differently. Set up what shall happen to give proper feedback to customer.',//SHOP_SYSTEM_SHOWNEWBASKETITEMMESSAGE
'SHOP_THEME_iNewBasketItemMessage_0'            => 'None',
'SHOP_THEME_iNewBasketItemMessage_3'            => 'Open basket',

'SHOP_THEME_aNrofCatArticles'                   => 'Number of products which can be shown in a product lists (category pages, search results)<br><br>Attention: A large number of products per page (above 100) can cause performance loss!',
);
