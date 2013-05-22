<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   tests
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxcaptchaTest.php 26841 2010-03-25 13:58:15Z arvydas $
 */

require_once realpath( "." ).'/unit/OxidTestCase.php';
require_once realpath( "." ).'/unit/test_config.inc.php';

class Unit_Core_oemobilethemethemeTest extends OxidTestCase
{
    /**
     * Activate mobile theme
     */
    public function testActivateMobileTheme()
    {
        $oConfig = $this->getMock('stdClass', array('saveShopConfVar'));
        $oConfig->expects($this->once())->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sMobileTheme'),
            $this->equalTo('mobileT')
        )
            ->will($this->returnValue(null));

        $oTheme = $this->getMock('oxTheme', array('checkForActivationErrors', 'getConfig' ));
        $oTheme->expects($this->once())->method('checkForActivationErrors')->will($this->returnValue(false));
        $oTheme->expects($this->any())->method('getConfig')->will($this->returnValue($oConfig));
        $oTheme->setInfo('parentTheme', '');
        $oTheme->setInfo('id', 'mobileT');
        $oTheme->setInfo('mobile', true);
        $oTheme->activate();
    }

    /**
     * Activate mobile and desktop themes
     */
    public function testActivateMobileAndDesktopThemes()
    {
        $oConfig = $this->getMock('stdClass', array('saveShopConfVar'));
        $oConfig->expects($this->at(0))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sMobileTheme'),
            $this->equalTo('mobileT')
        )
            ->will($this->returnValue(null));
        $oConfig->expects($this->at(1))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sTheme'),
            $this->equalTo('mobileT')
        )
            ->will($this->returnValue(null));
        $oConfig->expects($this->at(2))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sCustomTheme'),
            $this->equalTo('')
        )
            ->will($this->returnValue(null));

        $oTheme = $this->getMock('oxTheme', array('checkForActivationErrors', 'getConfig' ));
        $oTheme->expects($this->once())->method('checkForActivationErrors')->will($this->returnValue(false));
        $oTheme->expects($this->any())->method('getConfig')->will($this->returnValue($oConfig));
        $oTheme->setInfo('parentTheme', '');
        $oTheme->setInfo('id', 'mobileT');
        $oTheme->setInfo('mobile', true);
        $oTheme->setInfo('desktop', true);
        $oTheme->activate();
    }

    /**
     * Activate mobile and desktop themes
     */
    public function testActivateMobileAndDesktopCustomThemes()
    {
        $oConfig = $this->getMock('stdClass', array('saveShopConfVar'));
        $oConfig->expects($this->at(0))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sMobileTheme'),
            $this->equalTo('mobileT')
        )
            ->will($this->returnValue(null));
        $oConfig->expects($this->at(1))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sTheme'),
            $this->equalTo('mainT')
        )
            ->will($this->returnValue(null));
        $oConfig->expects($this->at(2))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sCustomTheme'),
            $this->equalTo('mobileT')
        )
            ->will($this->returnValue(null));

        $oTheme = $this->getMock('oxTheme', array('checkForActivationErrors', 'getConfig' ));
        $oTheme->expects($this->once())->method('checkForActivationErrors')->will($this->returnValue(false));
        $oTheme->expects($this->any())->method('getConfig')->will($this->returnValue($oConfig));
        $oTheme->setInfo('parentTheme', 'mainT');
        $oTheme->setInfo('id', 'mobileT');
        $oTheme->setInfo('mobile', true);
        $oTheme->setInfo('desktop', true);
        $oTheme->activate();
    }

    /**
     * If mobile type is active, return mobile theme
     */
    public function testGetActiveThemeIdForMobileType()
    {
        $this->setConfigParam('sMobileTheme', 'mobile');
        $this->setConfigParam('sCustomTheme', 'custom');
        $this->setConfigParam('sTheme', 'maint');

        $oTheme = new oxTheme();
        $oTheme->setActiveThemeType('mobile');
        $this->assertEquals('mobile', $oTheme->getActiveThemeId());
    }

    /**
     * If desktop type is active and mobile theme is set, return desktop theme
     */
    public function testGetActiveThemeIdForDesktopType()
    {
        $this->setConfigParam('sMobileTheme', 'sMobileTheme');
        $this->setConfigParam('sCustomTheme', '');
        $this->setConfigParam('sTheme', 'maint');

        $oTheme = new oxTheme();
        $this->assertEquals('maint', $oTheme->getActiveThemeId());
    }

    /**
     * Tests If desktop device is set
     */
    public function testGetActiveThemeTypeIfDesktopDevice()
    {
        $oUtils = $this->getMock( "oxUtilsServer", array( "getDeviceType" ) );
        $oUtils->expects( $this->once() )->method( "getDeviceType" )->will( $this->returnValue( "desktop" ) );

        oxRegistry::set("oxUtilsServer", $oUtils);

        $oTheme = new oxTheme();
        $this->assertEquals('desktop', $oTheme->getActiveThemeType());
    }

    /**
     * Tests If mobile device is set, but no mobile theme is created
     */
    public function testGetActiveThemeTypeIfMobileDevice()
    {
        $oUtils = $this->getMock( "oxUtilsServer", array( "getDeviceType" ) );
        $oUtils->expects( $this->once() )->method( "getDeviceType" )->will( $this->returnValue( "mobile" ) );

        $this->setConfigParam("sMobileTheme", '');
        oxRegistry::set("oxUtilsServer", $oUtils);

        $oTheme = new oxTheme();
        $this->assertEquals('desktop', $oTheme->getActiveThemeType());
    }

    /**
     * Tests If mobile device is set and mobile theme is created
     */
    public function testGetMobileThemeTypeIfMobileDevice()
    {
        $oUtils = $this->getMock( "oxUtilsServer", array( "getDeviceType" ) );
        $oUtils->expects( $this->once() )->method( "getDeviceType" )->will( $this->returnValue( "mobile" ) );

        $this->setConfigParam("sMobileTheme", "mobileTheme");
        oxRegistry::set("oxUtilsServer", $oUtils);

        $oTheme = new oxTheme();
        $this->assertEquals('mobile', $oTheme->getActiveThemeType());
    }

    /**
     * Tests setter and getter of active theme type
     */
    public function testGetSetActiveThemeType()
    {
        $oTheme = new oxTheme();
        $this->assertEquals('desktop', $oTheme->getActiveThemeType());
        $oTheme->setActiveThemeType('mobile');
        $this->assertEquals('mobile', $oTheme->getActiveThemeType());
    }

    /**
     * Tests setter and getter of active theme type
     */
    public function testGetActiveThemeTypeFromCookie()
    {
        $oUtils = $this->getMock( "oxUtilsServer", array( "getDeviceType", "getOxCookie" ) );
        $oUtils->expects( $this->never() )->method( "getDeviceType" )->will( $this->returnValue( "mobile" ) );
        $oUtils->expects( $this->once() )->method( "getOxCookie" )->will( $this->returnValue( "desktop" ) );

        $this->setConfigParam("sMobileTheme", "mobileTheme");
        oxRegistry::set("oxUtilsServer", $oUtils);

        $oTheme = new oxTheme();
        $this->assertEquals('desktop', $oTheme->getActiveThemeType());
    }

    /**
     * Tests info setter and getter
     */
    public function testGetSetInfo()
    {
        $oTheme = new oxTheme();
        $oTheme->setInfo('oxid', 'testModuleId');
        $this->assertEquals('testModuleId', $oTheme->getInfo('oxid'));
    }

    /**
     * You can deactivate only mobile type theme
     */
    public function testDeactivateErrorIfNotMobileTheme()
    {
        $this->setExpectedException('oxException', 'EXCEPTION_THEME_NOT_MOBILE');
        $oTheme = new oxTheme();
        $oTheme->setInfo('mobile', false);
        $oTheme->deactivate();
    }

    /**
     * You can deactivate only mobile type theme and if there is one more active desktop theme
     */
    public function testDeactivateErrorIfLastMainTheme()
    {
        $this->setConfigParam("sTheme", 'mobileT');
        $this->setConfigParam("sMobileTheme", 'mobileT');
        $this->setConfigParam("sCustomTheme", '');
        $this->setExpectedException('oxException', 'EXCEPTION_THEME_LAST_ACTIVE');
        $oTheme = new oxTheme();
        $oTheme->setInfo('mobile', true);
        $oTheme->setInfo('desktop', true);
        $oTheme->deactivate();
    }

    /**
     * Deactivate mobile/desktop theme if custom theme is set
     */
    public function testDeactivateMobileAndDesktopTheme()
    {
        $this->setConfigParam("sTheme", 'mobileT');
        $this->setConfigParam("sMobileTheme", 'mobileT');
        $this->setConfigParam("sCustomTheme", 'customT');
        $oConfig = $this->getMock('oxconfig', array('saveShopConfVar'));
        $oConfig->expects($this->at(0))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sMobileTheme'),
            $this->equalTo('')
        )
            ->will($this->returnValue(null));
        $oConfig->expects($this->at(1))->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sTheme'),
            $this->equalTo('')
        )
            ->will($this->returnValue(null));

        $oTheme = $this->getMock('oxTheme', array('getConfig' ));
        $oTheme->expects($this->any())->method('getConfig')->will($this->returnValue($oConfig));
        $oTheme->setInfo('id', 'mobileT');
        $oTheme->setInfo('mobile', true);
        $oTheme->setInfo('desktop', true);
        $oTheme->deactivate();
    }

    /**
     * Deactivate mobile theme
     */
    public function testDeactivateMobileTheme()
    {
        $oConfig = $this->getMock('oxconfig', array('saveShopConfVar'));
        $oConfig->expects($this->once())->method('saveShopConfVar')
            ->with(
            $this->equalTo('str'),
            $this->equalTo('sMobileTheme'),
            $this->equalTo('')
        )
            ->will($this->returnValue(null));

        $oTheme = $this->getMock('oxTheme', array('_checkForDeactivationErrors', 'getConfig' ));
        $oTheme->expects($this->once())->method('_checkForDeactivationErrors')->will($this->returnValue(false));
        $oTheme->expects($this->any())->method('getConfig')->will($this->returnValue($oConfig));
        $oTheme->setInfo('id', 'mobileT');
        $oTheme->setInfo('mobile', true);
        $oTheme->deactivate();
    }

}
