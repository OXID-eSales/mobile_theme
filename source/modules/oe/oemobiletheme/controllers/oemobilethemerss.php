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
 * Shop RSS page.
 */
class oemobilethemerss extends oemobilethemecontent_parent
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
        $oTheme = oxNew( 'oxTheme' );
        $sViewId .= $oTheme->getActiveThemeId();

        return $sViewId;
    }

}
