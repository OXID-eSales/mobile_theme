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
    'id'           => 'oethemeswitcher',
    'title'        => 'Mobile theme module',
    'description'  => 'Module for mobile theme',
    'thumbnail'    => 'picture.png',
    'version'      => '1.0',
    'author'       => 'OXID eSales AG',
    'url'          => 'http://www.oxid-esales.com',
    'email'        => 'info@oxid-esales.com',
    'extend'       => array(
        'oxconfig'         => 'oe/oethemeswitcher/core/oethemeswitcherconfig',
        'oxtheme'          => 'oe/oethemeswitcher/core/oethemeswitchertheme',
        'oxviewconfig'     => 'oe/oethemeswitcher/core/oethemeswitcherviewconfig',
        'manufacturerlist' => 'oe/oethemeswitcher/controllers/oethemeswitchermanufacturerlist',
        'alist'            => 'oe/oethemeswitcher/controllers/oethemeswitcheralist',
        'content'          => 'oe/oethemeswitcher/controllers/oethemeswitchercontent',
        'details'          => 'oe/oethemeswitcher/controllers/oethemeswitcherdetails',
        'review'           => 'oe/oethemeswitcher/controllers/oethemeswitcherreview',
        'rss'              => 'oe/oethemeswitcher/controllers/oethemeswitcherrss',
        'start'            => 'oe/oethemeswitcher/controllers/oethemeswitcherstart',
        'tag'              => 'oe/oethemeswitcher/controllers/oethemeswitchertag',
        'vendorlist'       => 'oe/oethemeswitcher/controllers/oethemeswitchervendorlist',
        'oxlang'           => 'oe/oethemeswitcher/core/oethemeswitcherlang',
    ),
    'files' => array(
        'oethemeswitcheruseragent' => 'oe/oethemeswitcher/core/oethemeswitcheruseragent.php'
    ),

    'blocks' => array(
        array('template' => 'layout/page.tpl', 'block'=>'layout_page_vatinclude', 'file'=>'views/azure/blocks/theme_switch_link.tpl')
    ),

    'settings' => array(
        array('group' => 'main', 'name' => 'sMobileTheme', 'type' => 'str',  'value' => 'mobile'),
    )
);