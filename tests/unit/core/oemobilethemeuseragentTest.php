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

$sModuleDir = realpath( "../" ) . '/source/modules/oe/oemobiletheme/';

require_once $sModuleDir . 'core/oemobilethemeuseragent.php';

/**
 * Tests for oeMobileThemeUserAgent class
 */
class Unit_Core_oeMobileThemeUserAgentTest extends OxidTestCase
{
    public function providerIsMobile()
    {
        return array(
            array( 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3', 'mobile' ),
            array( 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C)', 'desktop' ),
            array( 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3A100a Safari/419.3', 'mobile' ),
            array( 'Mozilla/5.0 (webOS/1.0; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Pre/1.0', 'mobile' ),
            array( 'Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.1; AOLBuild 4334.34; Windows NT 5.1; SV1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322)', 'desktop' ),
            array( 'Mozilla/5.0 (Linux; U; Android 0.5; en-us) AppleWebKit/522+ (KHTML, like Gecko) Safari/419.3', 'mobile' ),
            array( 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0', 'desktop' )
        );
    }

    /**
     * Check if given device type is mobile
     *
     * @dataProvider providerIsMobile
     */
    public function testDeviceType_Detect( $sUserAgent, $sType )
    {
        $_SERVER['HTTP_USER_AGENT'] = $sUserAgent;
        $oUserAgent = new oeMobileThemeUserAgent();

        $this->assertEquals( $sType, $oUserAgent->getDeviceType() );
    }

    /**
     * Tests getter if it is not null and if there is separators
     */
    public function testGetMobileDevicesTypes_NotNullAndWithSeparators()
    {
        $oUserAgent = new oeMobileThemeUserAgent();
        $sMobileDevicesTypes = $oUserAgent->getMobileDeviceTypes();
        $this->assertContains( 'iphone|', $sMobileDevicesTypes );
    }

    /**
     * Tests for mobile device types setter and getter
     */
    public function testGetMobileDevicesTypes_SetAndGet()
    {
        $oUserAgent = new oeMobileThemeUserAgent();
        $oUserAgent->setMobileDeviceTypes( 'testDevice1|testDevice2' );
        $this->assertEquals( 'testDevice1|testDevice2', $oUserAgent->getMobileDeviceTypes() );
    }

    /**
     * Tests device type for setter and getter
     */
    public function testGetDeviceType_SetAndGet()
    {
        $oUserAgent = new oeMobileThemeUserAgent();
        $oUserAgent->setDeviceType( 'mobile' );
        $this->assertEquals( 'mobile', $oUserAgent->getDeviceType() );
    }
}
