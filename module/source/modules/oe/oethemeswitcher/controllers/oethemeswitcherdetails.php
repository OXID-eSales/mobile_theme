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
 * Article details information page.
 * Collects detailed article information, possible variants, such information
 * as crosselling, similarlist, picture gallery list, etc.
 * OXID eShop -> (Any chosen product).
 * @package main
 */
class oeThemeSwitcherDetails extends oeThemeSwitcherDetails_parent
{

    /**
     * Returns view ID (for template engine caching).
     *
     * @return string   $this->_sViewId view id
     */
    public function getViewId()
    {
        $sViewId = parent::getViewId();
        $sViewId .= $this->getConfig()->getActiveThemeId();

        return $sViewId;
    }

}
