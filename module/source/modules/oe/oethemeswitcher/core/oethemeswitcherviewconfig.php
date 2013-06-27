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
 * View config data access class. Keeps most
 * of getters needed for formatting various urls,
 * config parameters, session information etc.
 */
class oeThemeSwitcherViewConfig extends oeThemeSwitcherViewConfig_parent
{
    /**
     * Active theme name
     *
     * @var null
     */
    protected $_sActiveTheme = null;

    /**
     * Active device type
     *
     * @var null
     */
    protected $_sActiveDeviceType = null;

    /**
     * Active theme type
     *
     * @var null
     */
    protected $_sActiveThemeType = null;

    /**
     * Returns active theme name
     *
     * @return string
     */
    public function getActiveTheme()
    {
        if ( $this->_sActiveTheme === null ) {
            $this->_sActiveTheme = $this->getConfig()->getActiveThemeId();
        }
        return $this->_sActiveTheme;
    }

    /**
     * Return active device type (mobile|desktop)
     *
     * @return string
     */
    public function getActiveDeviceType()
    {
        if ( $this->_sActiveDeviceType === null ) {
            $oUserAgent = oxNew( 'oeThemeSwitcherUserAgent' );
            $this->_sActiveDeviceType = $oUserAgent->getDeviceType();
        }
        return $this->_sActiveDeviceType;
    }

    /**
     * Return active theme type (mobile|desktop)
     *
     * @return string
     */
    public function getActiveThemeType()
    {
        if ( $this->_sActiveThemeType === null ) {
            $this->_sActiveThemeType  = $this->getConfig()->isMobileThemeRequested() ? 'mobile' : 'desktop';
        }
        return $this->_sActiveThemeType;
    }

    /**
     * Return shop edition (EE|CE|PE)
     *
     * @return string
     */
    public function getEdition()
    {
        return $this->getConfig()->getEdition();
    }

    /**
     * Check if module is active.
     *
     * @param string $sModuleId module id.
     *
     * @return  bool
     */
    function isModuleActive( $sModuleId )
    {
        $blModuleIsActive = false;

        $aModules = $this->getConfig()->getConfigParam( 'aModules' );

        if ( is_array( $aModules ) ) {
            // Check if module was ever installed.
            $blModuleExists = false;
            foreach ( $aModules as $sClassName => $sExtendPath ) {
                if ( false !== strpos( $sExtendPath, '/'. $sModuleId .'/' ) ) {
                    $blModuleExists = true;
                    break;
                }
            }

            // If module exists, check if it is not disabled.
            if ( $blModuleExists ) {
                $aDisabledModules = $this->getConfig()->getConfigParam( 'aDisabledModules' );
                if ( ! ( is_array( $aDisabledModules ) && in_array( $sModuleId, $aDisabledModules ) ) ) {
                    $blModuleIsActive = true;
                }
            }
        }

        return $blModuleIsActive;
    }
}
