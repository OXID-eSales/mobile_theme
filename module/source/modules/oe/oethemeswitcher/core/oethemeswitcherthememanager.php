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
class oeThemeSwitcherThemeManager
{
    /**
     * Theme type
     *
     * @var string
     */
    protected $_sThemeType = null;

    /**
     * User Agent
     *
     * @var object
     */
    protected $_oUserAgent = null;


    /**
     * User Agent setter
     */
    public function setUserAgent($oUserAgent)
    {
        $this->_oUserAgent = $oUserAgent;
    }


    /**
     * User Agent getter
     *
     * @return oeThemeSwitcherUserAgent
     */
    public function getUserAgent()
    {
        if (is_null($this->_oUserAgent)) {
            $this->_oUserAgent = oxNew('oeThemeSwitcherUserAgent');
        }

        return $this->_oUserAgent;
    }

    /**
     * Config getter
     *
     * @return oxConfig
     */
    public function getConfig()
    {
        return oxRegistry::getConfig();
    }


    /**
     * Return theme type from request
     *
     * @return string
     */
    protected function _getThemeTypeFromRequest()
    {
        $sRequestedThemeType = $this->getConfig()->getRequestParameter('themeType');
        if ($sRequestedThemeType) {
            oxRegistry::get('oxUtilsServer')->setOxCookie('sThemeType', $sRequestedThemeType);
        }

        return $sRequestedThemeType;
    }

    /**
     * Return theme type from cookie
     *
     * @return string
     */
    protected function _getThemeTypeFromCookie()
    {
        return oxRegistry::get('oxUtilsServer')->getOxCookie('sThemeType');
    }


    /**
     * Return requested theme type
     *
     * @return string
     */
    public function getRequestedThemeType()
    {
        $sRequestedThemeType = $this->_getThemeTypeFromRequest();
        if (empty($sRequestedThemeType)) {
            $sRequestedThemeType = $this->_getThemeTypeFromCookie();
        }

        return $sRequestedThemeType;
    }

    /**
     * Check if requested mobile theme
     *
     * @return bool
     */
    public function isMobileThemeRequested()
    {
        return ($this->getThemeType() == 'mobile');
    }


    /**
     * Return theme type
     *
     * @return string
     */
    public function getThemeType()
    {
        if (is_null($this->_sThemeType)) {
            $sRequestedThemeType = $this->getRequestedThemeType();
            if (empty($sRequestedThemeType)) {
                $sRequestedThemeType = $this->getUserAgent()->getDeviceType();
            }
            $this->_sThemeType = $sRequestedThemeType;
        }

        return $this->_sThemeType;
    }
}
