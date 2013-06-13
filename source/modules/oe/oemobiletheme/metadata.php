<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   main
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: metadata.php 25466 2010-02-01 14:12:07Z alfonsas $
 */

/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'oemobiletheme',
    'title'        => 'Mobile theme module',
    'description'  => 'Module for mobile theme',
    'thumbnail'    => 'picture.png',
    'version'      => '1.0',
    'author'       => 'OXID eSales AG',
    'url'          => 'http://www.oxid-esales.com',
    'email'        => 'info@oxid-esales.com',
    'extend'       => array(
        'oxconfig'         => 'oe/oemobiletheme/core/oemobilethemeconfig',
        'oxtheme'          => 'oe/oemobiletheme/core/oemobilethemetheme',
        'oxviewconfig'     => 'oe/oemobiletheme/core/oemobilethemeviewconfig',
        'manufacturerlist' => 'oe/oemobiletheme/controllers/oemobilethememanufacturerlist',
        'alist'            => 'oe/oemobiletheme/controllers/oemobilethemealist',
        'content'          => 'oe/oemobiletheme/controllers/oemobilethemecontent',
        'details'          => 'oe/oemobiletheme/controllers/oemobilethemedetails',
        'review'           => 'oe/oemobiletheme/controllers/oemobilethemereview',
        'rss'              => 'oe/oemobiletheme/controllers/oemobilethemerss',
        'start'            => 'oe/oemobiletheme/controllers/oemobilethemestart',
        'tag'              => 'oe/oemobiletheme/controllers/oemobilethemetag',
        'vendorlist'       => 'oe/oemobiletheme/controllers/oemobilethemevendorlist',
        'oxlang'           => 'oe/oemobiletheme/core/oemobilethemelang',
    ),
    'files' => array(
        'oemobilethemeuseragent' => 'oe/oemobiletheme/core/oemobilethemeuseragent.php'
    ),

    'blocks' => array(
        array('template' => 'layout/page.tpl', 'block'=>'layout_page_vatinclude', 'file'=>'views/azure/blocks/theme_switch_link.tpl')
    ),

    'settings' => array(
        array('group' => 'main', 'name' => 'sMobileTheme', 'type' => 'str',  'value' => 'mobile'),
    )
);