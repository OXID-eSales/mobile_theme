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
 * @copyright (C) OXID eSales AG 2003-2014
 */

/**
 * Main shop configuration class.
 *
 * @package core
 */
class oeThemeSwitcherConfig extends oeThemeSwitcherConfig_parent
{
    /**
     * Bool variable true if modules configs are loaded, otherwise false
     *
     * @var bool
     */
    protected $_blIsModuleConfigLoaded = false;

    /**
     * Theme manager object
     *
     * @var oeThemeSwitcherThemeManager
     */
    protected $_oThemeManager = null;

    /**
     * Instance cache for theme parents.
     *
     * @var array
     */
    protected $themeParents = array();

    /**
     * Returns config parameter value if such parameter exists
     *
     * @param string $sName config parameter name
     *
     * @return mixed
     */
    public function getConfigParam($sName, $sDefault = null)
    {
        $sReturn = parent::getConfigParam($sName, $sDefault);

        if ($sName == "sCustomTheme") {
            //load module configs
            if (!$this->_blIsModuleConfigLoaded) {
                $this->_loadVarsFromDb($this->getShopId(), null, oxConfig::OXMODULE_MODULE_PREFIX);
                $this->_blIsModuleConfigLoaded = true;
            }

            // check for mobile devices
            if ($this->oeThemeSwitcherGetThemeManager()->isMobileThemeRequested() && !$this->isAdmin()) {
                return $this->_aConfigParams['sOEThemeSwitcherMobileTheme'];
            }
        }

        return $sReturn;
    }

    /**
     * Return current active theme
     *
     * @return string
     */
    public function oeThemeSwitcherGetActiveThemeId()
    {
        $customTheme = $this->getConfigParam('sCustomTheme');

        if ($customTheme) {
            $parentTheme = $this->getParentThemeId($customTheme);

            if (!is_null($parentTheme)) {
                $this->_aConfigParams['sTheme'] = $parentTheme;
            }
            return $customTheme;
        }

        return $this->getConfigParam('sTheme');
    }

    /**
     * Return theme manager
     *
     * @return oeThemeSwitcherThemeManager
     */
    public function oeThemeSwitcherGetThemeManager()
    {
        if ($this->_oThemeManager == null) {
            $this->_oThemeManager = oxNew('oeThemeSwitcherThemeManager');
        }

        return $this->_oThemeManager;
    }

    /**
     * Get parent theme id for given theme id.
     *
     * @param string|null  $themeId
     */
    protected function getParentThemeId($themeId)
    {
        if (!array_key_exists($themeId, $this->themeParents)) {
            $theme = $this->loadTheme($themeId);
            $parentTheme = $theme->getInfo('parentTheme');
            $this->themeParents[$themeId] = empty($parentTheme) ? null : $parentTheme;
        }

        return $this->themeParents[$themeId];
    }

    /**
     * Load theme by id.
     *
     * @param string $themeId
     *
     * @return oxTheme
     */
    protected function loadTheme($themeId)
    {
        $theme = oxNew('oxTheme');
        $theme->load($themeId);
        return $theme;
    }
}
