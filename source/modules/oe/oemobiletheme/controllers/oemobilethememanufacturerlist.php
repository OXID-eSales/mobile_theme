<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   views
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id$
 */

/**
 * List of articles for a selected Manufacturer.
 * Collects list of articles, according to it generates links for list gallery,
 * metatags (for search engines). Result - "manufacturerlist.tpl" template.
 * OXID eShop -> (Any selected shop product category).
 */
class oemobilethememanufacturerlist extends oemobilethememanufacturerlist_parent
{

    /**
     * Returns view ID (for template engine caching).
     *
     * @return string   $this->_sViewId view id
     */
    public function getViewId()
    {
        $oUBase = oxNew( 'oxUBase' );
        $sViewId = $oUBase->getViewId();
        $oTheme = oxNew( 'oemobilethemetheme' );
        $sViewId .= $oTheme->getActiveThemeId();

        return $sViewId;
    }

}
