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
        'oxutilsserver'    => 'oe/oemobiletheme/core/oemobilethemeutilsserver',
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
        'theme_main'       => 'oe/oemobiletheme/controllers/admin/oemobilethemethememain',
    ),
    'blocks' => array(
        array('template' => 'theme_main.tpl',  'block'=>'admin_theme_main_form',  'file'=>'views/admin/blocks/theme_main_form.tpl'),
        array('template' => 'theme_list.tpl',  'block'=>'admin_theme_list_item',  'file'=>'views/admin/blocks/theme_list_item.tpl'),
        array('template' => 'layout/page.tpl', 'block'=>'layout_page_vatinclude', 'file'=>'views/azure/blocks/theme_switch_link.tpl')
    ),
);