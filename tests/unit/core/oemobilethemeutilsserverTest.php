<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   tests
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id$
 */

require_once realpath( "." ).'/unit/OxidTestCase.php';
require_once realpath( "." ).'/unit/test_config.inc.php';

class Unit_Core_oemobilethemeUtilsServerTest extends OxidTestCase
{

    /**
     * Tests If mobile device was detected
     */
    public function testGetMobileDeviceIPhoneDetected()
    {
        $_SERVER['HTTP_USER_AGENT'] = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3";
        $oUtils = new oxUtilsServer();
        $this->assertEquals( "mobile", $oUtils->getDeviceType() );
    }

    /**
     * Tests If mobile device was detected
     */
    public function testGetMobileDeviceIToucheDetected()
    {
        $_SERVER['HTTP_USER_AGENT'] = "Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3A100a Safari/419.3";
        $oUtils = new oxUtilsServer();
        $this->assertEquals( "mobile", $oUtils->getDeviceType() );
    }

    /**
     * Tests If mobile device was detected
     */
    public function testGetMobileDevicePalmDetected()
    {
        $_SERVER['HTTP_USER_AGENT'] = "Mozilla/5.0 (webOS/1.0; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Pre/1.0";
        $oUtils = new oxUtilsServer();
        $this->assertEquals( "mobile", $oUtils->getDeviceType() );
    }

    /**
     * Tests If mobile device was detected
     */
    public function testGetMobileDeviceAndroidDetected()
    {
        $_SERVER['HTTP_USER_AGENT'] = "Mozilla/5.0 (Linux; U; Android 0.5; en-us) AppleWebKit/522+ (KHTML, like Gecko) Safari/419.3";
        $oUtils = new oxUtilsServer();
        $this->assertEquals( "mobile", $oUtils->getDeviceType() );
    }

    /**
     * Tests If desktop device was detected
     */
    public function testGetDesktopDeviceDetected()
    {
        $_SERVER['HTTP_USER_AGENT'] = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0";
        $oUtils = new oxUtilsServer();
        $this->assertEquals( "desktop", $oUtils->getDeviceType() );
    }

    /**
     * Tests If desktop device was detected
     */
    public function testGetSetDeviceType()
    {
        $oUtils = new oxUtilsServer();
        $oUtils->setDeviceType("mobile");
        $this->assertEquals( "mobile", $oUtils->getDeviceType() );
    }

}
