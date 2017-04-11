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
 * Tests for oeThemeSwitcherConfig class
 */
class Unit_oeThemeSwitcher_Core_oeThemeSwitcherConfigTest extends OxidTestCase
{

    /**
     * Checks if method oeThemeSwitcherConfig::oeThemeSwitcherGetActiveThemeId returns correct active theme id
     */
    public function testGetActiveThemeId()
    {
        $sActiveThemeId = 'test';
        $oConfig = new oeThemeSwitcherConfig();
        $oConfig->init();
        $oConfig->setConfigParam('sCustomTheme', $sActiveThemeId);
        $sGotActiveThemeId = $oConfig->oeThemeSwitcherGetActiveThemeId();

        $this->assertEquals($sActiveThemeId, $sGotActiveThemeId);
    }

    /**
     * Checks oeThemeSwitcherConfig::oeThemeSwitcherGetThemeManager returned oeThemeSwitcherThemeManager object
     */
    public function testGetThemeManager()
    {
        $oConfig = new oeThemeSwitcherConfig();
        $this->assertInstanceOf('oeThemeSwitcherThemeManager', $oConfig->oeThemeSwitcherGetThemeManager());
    }
}
