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
     * Checks if method oeThemeSwitcherConfig::oeThemeSwitcherGetActiveThemeId returns correct active theme id.
     * Case that the mobile theme has no parent theme.
     */
    public function testGetActiveThemeId()
    {
        $activeThemeId = 'test';
        $config = new oeThemeSwitcherConfig();
        $config->setConfigParam('sCustomTheme', $activeThemeId);
        $gotActiveThemeId = $config->oeThemeSwitcherGetActiveThemeId();

        $this->assertEquals($activeThemeId, $gotActiveThemeId);
        $this->assertEquals('azure', $config->getConfigParam('sTheme'));
        $this->assertEquals('test', $config->getConfigParam('sCustomTheme'));
    }

    /**
     * Checks oeThemeSwitcherConfig::oeThemeSwitcherGetThemeManager returned oeThemeSwitcherThemeManager object
     */
    public function testGetThemeManager()
    {
        $config = new oeThemeSwitcherConfig();
        $this->assertInstanceOf('oeThemeSwitcherThemeManager', $config->oeThemeSwitcherGetThemeManager());
    }

    /**
     * Checks if method oeThemeSwitcherConfig::oeThemeSwitcherGetActiveThemeId returns correct active theme id.
     * Case that the mobile theme has a parent theme.
     */
    public function testGetActiveThemeAndParentIdForChildTheme()
    {
        $activeThemeId       = 'mobilechild';
        $activeThemeParentId = 'mobileparent';

        $themeMock = $this->getMock('oxTheme', array('getInfo'));
        $themeMock->expects($this->once())->method('getInfo')->with($this->equalTo('parentTheme'))->will($this->returnValue($activeThemeParentId));

        $config = $this->getMock('oeThemeSwitcherConfig', array('loadTheme'));
        $config->expects($this->once())->method('loadTheme')->with($this->equalTo($activeThemeId))->will($this->returnValue($themeMock));
        $config->setConfigParam('sCustomTheme', $activeThemeId);

        $this->assertEquals($activeThemeId, $config->oeThemeSwitcherGetActiveThemeId());
        $this->assertEquals($activeThemeParentId, $config->getConfigParam('sTheme'));
    }


    public function testMobileThemeRequested()
    {
        $mobileThemeId       = 'mobile';
        $mobileThemeParentId = 'mobileparent';
        $desktopThemeId      = 'azure';

        $mobileThemeMock = $this->getMock('oxTheme', array('getInfo'));
        $mobileThemeMock->expects($this->once())->method('getInfo')->with($this->equalTo('parentTheme'))->will($this->returnValue($mobileThemeParentId));

        $themeswitcherManager = $this->getMock('oeThemeSwitcherThemeManager', array('isMobileThemeRequested'));
        $themeswitcherManager->expects($this->any())->method('isMobileThemeRequested')->will($this->returnValue(true));

        $config = $this->getMock('oeThemeSwitcherConfig', array('loadTheme', 'oeThemeSwitcherGetThemeManager'));
        $config->expects($this->any())->method('oeThemeSwitcherGetThemeManager')->will($this->returnValue($themeswitcherManager));
        $config->expects($this->once())->method('loadTheme')->with($this->equalTo($mobileThemeId))->will($this->returnValue($mobileThemeMock));

        //call to $config->oeThemeSwitcherGetActiveThemeId() changes config Parameter sTheme
        $this->assertEquals($desktopThemeId, $config->getConfigParam('sTheme'));
        $this->assertEquals($mobileThemeId, $config->oeThemeSwitcherGetActiveThemeId());
        $this->assertEquals($mobileThemeParentId, $config->getConfigParam('sTheme'));
    }

    /**
     * Case desktop theme is requested and has no parent theme.
     */
    public function testDesktopThemeRequested()
    {
        $desktopThemeId      = 'azure';

        $themeswitcherManager = $this->getMock('oeThemeSwitcherThemeManager', array('isMobileThemeRequested'));
        $themeswitcherManager->expects($this->any())->method('isMobileThemeRequested')->will($this->returnValue(false));

        $config = $this->getMock('oeThemeSwitcherConfig', array('loadTheme', 'oeThemeSwitcherGetThemeManager'));
        $config->expects($this->any())->method('oeThemeSwitcherGetThemeManager')->will($this->returnValue($themeswitcherManager));
        $config->expects($this->never())->method('loadTheme');

        //call to $config->oeThemeSwitcherGetActiveThemeId() changes config Parameter sTheme
        $this->assertEquals($desktopThemeId, $config->getConfigParam('sTheme'));
        $this->assertEquals($desktopThemeId, $config->oeThemeSwitcherGetActiveThemeId());
        $this->assertEquals($desktopThemeId, $config->getConfigParam('sTheme'));
        $this->assertNull($config->getConfigParam('sCustomTheme'));
    }

    /**
     * Case desktop theme is requested and has a parent theme.
     */
    public function testDesktopThemeRequestedAndHasParent()
    {
        $desktopThemeId = 'azurechild';
        $desktopThemeParentId = 'azure';

        $desktopThemeMock = $this->getMock('oxTheme', array('getInfo'));
        $desktopThemeMock->expects($this->once())->method('getInfo')->with($this->equalTo('parentTheme'))->will($this->returnValue($desktopThemeParentId));

        $themeswitcherManager = $this->getMock('oeThemeSwitcherThemeManager', array('isMobileThemeRequested'));
        $themeswitcherManager->expects($this->any())->method('isMobileThemeRequested')->will($this->returnValue(false));

        $config = $this->getMock('oeThemeSwitcherConfig', array('loadTheme', 'oeThemeSwitcherGetThemeManager'));
        $config->expects($this->any())->method('oeThemeSwitcherGetThemeManager')->will($this->returnValue($themeswitcherManager));
        $config->expects($this->once())->method('loadTheme')->with($this->equalTo($desktopThemeId))->will($this->returnValue($desktopThemeMock));
        $config->setConfigParam('sCustomTheme', $desktopThemeId);
        $config->setConfigParam('sTheme', $desktopThemeParentId);

        //call to $config->oeThemeSwitcherGetActiveThemeId() changes config Parameter sTheme
        $this->assertEquals($desktopThemeParentId, $config->getConfigParam('sTheme'));
        $this->assertEquals($desktopThemeId, $config->oeThemeSwitcherGetActiveThemeId());
        $this->assertEquals($desktopThemeParentId, $config->getConfigParam('sTheme'));
        $this->assertEquals($desktopThemeId, $config->oeThemeSwitcherGetActiveThemeId());

    }

}
