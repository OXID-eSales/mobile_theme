<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   core
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: $
 */

/**
 * Class handling shop themes
 *
 */
class oeMobileThemeTheme extends oeMobileThemeTheme_parent
{
    /**
     * Load theme info list
     *
     * @return array
     */
    public function getList()
    {
        $this->_aThemeList   = array();
        $sOutDir = $this->getConfig()->getViewsDir();
        foreach ( glob( $sOutDir."*", GLOB_ONLYDIR ) as $sDir ) {
            $oTheme = oxNew('oxTheme');
            if ($oTheme->load(basename($sDir))) {
                if( $oTheme->getId() != $this->getConfig()->getConfigParam('sMobileTheme') )
                $this->_aThemeList[$sDir] = $oTheme;
            }
        }
        return $this->_aThemeList;
    }
}

