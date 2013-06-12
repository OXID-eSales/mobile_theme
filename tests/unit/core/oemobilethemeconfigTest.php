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

/**
 * Tests for aList class
 */
class Unit_Core_oemobilethemeconfigTest extends OxidTestCase
{

    /**
     * If mobile device set sCustomtheme as mobileTheme
     */
    public function testThemeNameExpectsMobile()
    {
        oxTestModules::addFunction( "oxTheme", "getActiveThemeType", "{return 'mobile';}" );

        $oConfig = new oemobilethemeconfig();
        $oConfig->setConfigParam( "sMobileTheme", "mobileTheme" );
        $oConfig->init();
        $this->assertEquals( 'mobileTheme', $oConfig->getConfigParam( 'sCustomTheme' ) );
    }

    /**
     * If mobile device, but request parameter sent different theme type set sCustomtheme as it is in db
     */
    public function testInitMobileDeviceWithRequestedThemeType()
    {
        oxTestModules::addFunction( "oxTheme", "setActiveThemeType", "{return 'mobile';}" );

        $oConfig = new oemobilethemeconfig();
        $this->setRequestParam( 'themeType', 'desktop' );
        $oConfig->setConfigParam( "sMobileTheme", "mobileTheme" );
        $oConfig->setConfigParam( "sCustomTheme", "custTheme" );
        $oConfig->init();
        $this->assertEquals( 'custTheme', $oConfig->getConfigParam( 'sCustomTheme' ) );
    }
}
