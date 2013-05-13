<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   admin
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: deliveryset_main.php 25466 2010-02-01 14:12:07Z alfonsas $
 */

/**
 * Admin article main deliveryset manager.
 * There is possibility to change deliveryset name, article, user
 * and etc.
 * Admin Menu: Shop settings -> Shipping & Handling -> Main Sets.
 * @package admin
 */
class oemobilethemethememain extends oemobilethemethememain_parent
{
    /**
     * Disable mobile theme
     *
     * @return null
     */
    public function disableTheme()
    {
        $sTheme = $this->getEditObjectId();
        $oTheme = oxNew('oxtheme');
        if (!$oTheme->load($sTheme)) {
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( oxNew( "oxException", 'EXCEPTION_THEME_NOT_LOADED') );
            return;
        }
        try {
            $oTheme->deactivate();
            $this->resetContentCache();
        } catch (oxException $oEx) {
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( $oEx );
            $oEx->debugOut();
        }
    }
}
