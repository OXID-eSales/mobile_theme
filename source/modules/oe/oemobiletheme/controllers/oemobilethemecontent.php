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
 * CMS - loads pages and displays it
 */
class oemobilethemecontent extends oemobilethemecontent_parent
{

    /**
     * Returns view ID (for template engine caching).
     *
     * @return string   $this->_sViewId view id
     */
    public function getViewId()
    {
        $sViewId = parent::getViewId();
        $oTheme = oxNew( 'oxTheme' );
        $sViewId .= $oTheme->getActiveThemeId();

        return $sViewId;
    }

}
