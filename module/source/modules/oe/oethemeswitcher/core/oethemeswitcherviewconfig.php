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
     * User Agent.
     *
     * @var object
     */
    protected $_oUserAgent = null;

    /**
     * User Agent getter.
     *
     * @return oeThemeSwitcherUserAgent
     */
    public function oeThemeSwitcherGetUserAgent( )
    {
        if ( is_null( $this->_oUserAgent ) ){
            $this->_oUserAgent = oxNew( 'oeThemeSwitcherUserAgent' );
        }

        return $this->_oUserAgent;
    }

    /**
     * Return shop edition (EE|CE|PE)
     *
     * @return string
     */
    public function oeThemeSwitcherGetEdition()
    {
        return $this->getConfig()->getEdition();
    }

    /**
     * Check if module is active.
     *
     * @param string $sModuleId module id.
     * @param string $sVersionFrom module from version.
     * @param string $sVersionTo module to version.
     *
     * @return  bool
     */
    public function oeThemeSwitcherIsModuleActive( $sModuleId, $sVersionFrom = null, $sVersionTo = null )
    {
        $blModuleIsActive = false;

        $aModules = $this->getConfig()->getConfigParam( 'aModules' );

        if ( is_array( $aModules ) ) {
            $blModuleIsActive = $this->_oeThemeSwitcherModuleExists( $sModuleId, $aModules );

            if ( $blModuleIsActive ) {
                $blModuleIsActive = $this->_oeThemeSwitcherIsModuleEnabled( $sModuleId ) && $this->_oeThemeSwitcherIsModuleVersionCorrect( $sModuleId, $sVersionFrom, $sVersionTo );
            }

        }

        return $blModuleIsActive;
    }

    /**
     * Checks if module exists.
     *
     * @param $sModuleId
     * @param $aModules
     * @return bool
     */
    protected function _oeThemeSwitcherModuleExists( $sModuleId, $aModules )
    {
        $blModuleExists = false;
        foreach ( $aModules as $sExtendPath ) {
            if ( false !== strpos( $sExtendPath, '/' . $sModuleId . '/' ) ) {
                $blModuleExists = true;
                break;
            }
        }
        return $blModuleExists;
    }

    /**
     * Checks whether module is enabled.
     *
     * @param $sModuleId
     * @return bool
     */
    protected function _oeThemeSwitcherIsModuleEnabled( $sModuleId )
    {
        $blModuleIsActive = false;

        $aDisabledModules = $this->getConfig()->getConfigParam( 'aDisabledModules' );
        if ( !( is_array( $aDisabledModules ) && in_array( $sModuleId, $aDisabledModules ) ) ) {
            $blModuleIsActive = true;
        }
        return $blModuleIsActive;
    }

    /**
     * Checks whether module version is between given range.
     *
     * @param $sModuleId
     * @param $sVersionFrom
     * @param $sVersionTo
     * @return bool
     */
    protected function _oeThemeSwitcherIsModuleVersionCorrect( $sModuleId, $sVersionFrom, $sVersionTo )
    {
        $blModuleIsActive = true;

        $aModuleVersions = $this->getConfig()->getConfigParam( 'aModuleVersions' );

        if ( $sVersionFrom && !version_compare( $aModuleVersions[$sModuleId], $sVersionFrom, '>=' ) ) {
            $blModuleIsActive = false;
        }

        if ( $blModuleIsActive && $sVersionTo && !version_compare( $aModuleVersions[$sModuleId], $sVersionTo, '<' ) ) {
            $blModuleIsActive = false;
        }

        return $blModuleIsActive;
    }

}
