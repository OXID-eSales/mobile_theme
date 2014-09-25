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
 * Tests for oeThemeSwitcherUserAgent class
 */
class Unit_oeThemeSwitcher_Core_oeThemeSwitcherThemeManagerTest extends OxidTestCase
{

    /**
     * Data provider for testGetThemeType test case
     *
     * @return array
     */
    public function providerThemeType()
    {
        return array(
            array('', '', 'mobile', 'mobile'),
            array('mobile', '', 'mobile', 'mobile'),
            array('desktop', '', 'mobile', 'desktop'),

            array('', 'mobile', 'mobile', 'mobile'),
            array('mobile', 'mobile', 'mobile', 'mobile'),
            array('desktop', 'mobile', 'mobile', 'desktop'),

            array('', 'desktop', 'mobile', 'desktop'),
            array('mobile', 'desktop', 'mobile', 'mobile'),
            array('desktop', 'desktop', 'mobile', 'desktop'),

            array('', '', 'desktop', 'desktop'),
            array('mobile', '', 'desktop', 'mobile'),
            array('desktop', '', 'desktop', 'desktop'),

            array('', 'mobile', 'desktop', 'mobile'),
            array('mobile', 'mobile', 'desktop', 'mobile'),
            array('desktop', 'mobile', 'desktop', 'desktop'),

            array('', 'desktop', 'desktop', 'desktop'),
            array('mobile', 'desktop', 'desktop', 'mobile'),
            array('desktop', 'desktop', 'desktop', 'desktop'),
        );
    }

    /**
     * Test for theme type getter.
     *
     * @param string $sRequestValue   request value
     * @param string $sCookieValue    cookie value
     * @param string $sUserAgentValue user agent value
     * @param string $sExpectation    expectation
     *
     * @dataProvider providerThemeType
     */
    public function testGetThemeType($sRequestValue, $sCookieValue, $sUserAgentValue, $sExpectation)
    {
        // set request parameter
        if (!empty($sRequestValue)) {
            $this->setRequestParam('themeType', $sRequestValue);
        }

        $oThemeManager = $this->getMock('oeThemeSwitcherThemeManager', array('_getThemeTypeFromCookie'));
        $oThemeManager->expects($this->any())->method('_getThemeTypeFromCookie')->will($this->returnValue($sCookieValue));

        $oUserAgent = $this->getMock('oeThemeSwitcherUserAgent', array('getDeviceType'));
        $oUserAgent->expects($this->any())->method('getDeviceType')->will($this->returnValue($sUserAgentValue));

        $oThemeManager->setUserAgent($oUserAgent);

        $this->assertEquals($sExpectation, $oThemeManager->getThemeType());
    }

    /**
     * Tests getter if it is not null and if there is separators
     */
    public function testGetConfig()
    {
        $oThemeManager = new oeThemeSwitcherThemeManager();
        $this->assertInstanceOf('oxConfig', $oThemeManager->getConfig());
    }

    /**
     * Tests if getter gets set value
     */
    public function testUserAgentSetAndGet()
    {
        $oThemeManager = new oeThemeSwitcherThemeManager();
        $oThemeManager->setUserAgent('testAgent');
        $sUserAgent = $oThemeManager->getUserAgent();
        $this->assertEquals('testAgent', $sUserAgent);
    }

    /**
     * Tests if method isMobileThemeRequested returns false
     */
    public function testIsMobileThemeFalse()
    {
        $oThemeManager = $this->getMock('oeThemeSwitcherThemeManager', array('getThemeType'));
        $oThemeManager->expects($this->any())->method('getThemeType')->will($this->returnValue('desktop'));
        $this->assertFalse($oThemeManager->isMobileThemeRequested());
    }

    /**
     * Tests if method isMobileThemeRequested returns true
     */
    public function testIsMobileThemeTrue()
    {
        $oThemeManager = $this->getMock('oeThemeSwitcherThemeManager', array('getThemeType'));
        $oThemeManager->expects($this->any())->method('getThemeType')->will($this->returnValue('mobile'));
        $this->assertTrue($oThemeManager->isMobileThemeRequested());
    }
}
