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
 * List of articles for a selected vendor.
 * Collects list of articles, according to it generates links for list gallery,
 * metatags (for search engines). Result - "vendorlist.tpl" template.
 * OXID eShop -> (Any selected shop product category).
 */
class oemobilethemevendorlist extends oemobilethemevendorlist_parent
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
        $sViewId .= $this->getConfig()->getActiveThemeId();

        return $sViewId;
    }

}
