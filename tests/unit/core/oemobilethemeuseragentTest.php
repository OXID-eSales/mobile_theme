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

$sModuleDir = realpath( "." ) . '/../source/modules/oe/oemobiletheme/';

require_once $sModuleDir . 'core/oemobilethemeuseragent.php';

/**
 * Tests for oemobilethemeuseragent class
 */
class Unit_Core_oemobilethemeuseragentTest extends OxidTestCase
{

    public function providerIsMobile()
    {
        return array(
            array( 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3', true ),
            array( 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C)', false ),
            array( 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3A100a Safari/419.3', true ),
            array( 'Mozilla/5.0 (webOS/1.0; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Pre/1.0', true ),
            array( 'Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.1; AOLBuild 4334.34; Windows NT 5.1; SV1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322)', false ),
            array( 'Mozilla/5.0 (Linux; U; Android 0.5; en-us) AppleWebKit/522+ (KHTML, like Gecko) Safari/419.3', true ),
            array( 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0', false )
        );
    }

    /**
     * Check if given device type is mobile
     *
     * @dataProvider providerIsMobile
     */
    public function testIsMobile( $sUserAgent, $blIsMobile )
    {
        $_SERVER['HTTP_USER_AGENT'] = $sUserAgent;
        $oUserAgent = new oemobilethemeuseragent();

        $this->assertEquals( $blIsMobile, $oUserAgent->isMobile() );
    }

    /**
     * Tests getter if it is not null and if there is separators
     */
    public function testGetMobileDevicesTypes_NotNullAndWithSeparators()
    {
        $oUtilsServer = new oemobilethemeuseragent();
        $sMobileDevicesTypes = $oUtilsServer->getMobileDevicesTypes();
        $this->assertContains( 'iphone|', $sMobileDevicesTypes );
    }

}
