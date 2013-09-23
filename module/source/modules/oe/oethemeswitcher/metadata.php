<?php
/**
 * This file is part of OXID eSales theme switcher module.
 *
 * OXID eSales theme switcher module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales theme switcher module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales theme switcher module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
 */

/**
 * Metadata version
 */
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'oethemeswitcher',
    'title'        => 'OXID eShop theme switch',
    'description'  => array(
        'de' => 'Modul zum Wechsel der Anzeige zwischen normaler Ansicht und der Ansicht für mobile Endgeräte. Beim Aufruf des OXID eShop durch ein mobiles Endgerät wird ein installiertes Mobile Theme - standardmäßig OXID eShop Mobile Theme - zur Darstellung verwendet. Erfordert ein installiertes Mobile Theme.',
        'en' => 'Module for switching the display between a regular view and a view for mobile devices. If OXID eShop is accessed by a mobile device, an installed mobile theme (OXID eShop mobile theme by default) will be used. An installed mobile theme is required.',
    ),
    'thumbnail'    => 'picture.png',
    'version'      => '1.1.0',
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
        'oethemeswitcheruseragent'      => 'oe/oethemeswitcher/core/oethemeswitcheruseragent.php',
        'oethemeswitcherthememanager'   => 'oe/oethemeswitcher/core/oethemeswitcherthememanager.php',
        'oethemeswitcherevents'         => 'oe/oethemeswitcher/core/oethemeswitcherevents.php',
        'oethemeswitcherwpaymentlist'   => 'oe/oethemeswitcher/components/widgets/oethemeswitcherwpaymentlist.php'
    ),

    'blocks' => array(
        array('template' => 'layout/page.tpl',             'block'=>'layout_page_vatinclude',               'file'=>'views/azure/blocks/theme_switch_link.tpl'),
        array('template' => 'page/checkout/basket.tpl',    'block'=>'mb_basket_btn_next_top',               'file'=>'views/mobile/blocks/oepaypalexpresscheckout.tpl'),
        array('template' => 'page/checkout/basket.tpl',    'block'=>'mb_basket_btn_next_bottom',            'file'=>'views/mobile/blocks/oepaypalexpresscheckout.tpl'),
        array('template' => 'page/checkout/payment.tpl',   'block'=>'mb_select_payment',                    'file'=>'views/mobile/blocks/oepaypalpaymentselector.tpl'),
        array('template' => 'page/details/inc/productmain.tpl', 'block'=>'mb_details_productmain_tobasket', 'file'=>'views/mobile/blocks/oepaypalexpresscheckoutdetailspage.tpl'),
        array('template' => 'page/details/inc/productmain.tpl', 'block'=>'mb_details_productmain_morepics', 'file'=>'views/mobile/blocks/oepaypalexpresscheckoutdetailspagepopup.tpl'),
    ),

    'settings' => array(
        array('group' => 'main', 'name' => 'sOEThemeSwitcherMobileTheme', 'type' => 'str',  'value' => 'mobile'),
    ),

    'events'       => array(
        'onActivate'   => 'oeThemeSwitcherEvents::onActivate',
        'onDeactivate' => 'oeThemeSwitcherEvents::onDeactivate'
    ),
);