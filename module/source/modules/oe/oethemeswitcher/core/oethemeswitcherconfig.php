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
 * Main shop configuration class.
 *
 * @package core
 */
class oeThemeSwitcherConfig extends oeThemeSwitcherConfig_parent
{
    /**
     * Bool variable true if mobile theme requested, otherwise false
     *
     * @var bool
     */
    protected $_blIsMobileThemeRequested = null;

    /**
     * Bool variable true if modules configs are loaded, otherwise false
     *
     * @var bool
     */
    protected $_blIsModuleConfigLoaded = false;

    /**
     * Returns config parameter value if such parameter exists
     *
     * @param string $sName config parameter name
     *
     * @return mixed
     */
    public function getConfigParam( $sName )
    {
        $sReturn = parent::getConfigParam( $sName );

        if ( $sName == "sCustomTheme" ) {

            //load module configs
            if ( !$this->_blIsModuleConfigLoaded ) {
                $this->_loadVarsFromDb( $this->getShopId(), null, oxConfig::OXMODULE_MODULE_PREFIX );
                $this->_blIsModuleConfigLoaded = true;
            }

            // check for mobile devices
            if ( $this->isMobileThemeRequested() &&  !$this->isAdmin() ) {
                return $this->_aConfigParams['sMobileTheme'];
            }
        }

        return $sReturn;

    }

    /**
     * Return current active theme
     *
     * @return string
     */
    public function getActiveThemeId()
    {
        $sCustomTheme = $this->getConfigParam('sCustomTheme');
        if ($sCustomTheme) {
            return $sCustomTheme;
        }
        return $this->getConfigParam('sTheme');
    }


    /**
     * Check if requested mobile theme
     *
     * @return bool
     */
    public function isMobileThemeRequested()
    {
        if( $this->_blIsMobileThemeRequested === null ) {

            $sRequestedThemeType = $this->getRequestParameter('themeType');
            if( !empty( $sRequestedThemeType ) ) {
                oxRegistry::get("oxUtilsServer")->setOxCookie('sThemeType', $sRequestedThemeType);
            } else {
                $sRequestedThemeType = oxRegistry::get("oxUtilsServer")->getOxCookie('sThemeType');
                if ( empty( $sRequestedThemeType ) ) {
                    $oUserAgent = oxNew( 'oeThemeSwitcherUserAgent' );
                    $sRequestedThemeType = $oUserAgent->getDeviceType();
                }
            }
            $this->_blIsMobileThemeRequested = ( $sRequestedThemeType == 'mobile' );
        }

        return $this->_blIsMobileThemeRequested;
    }
}
