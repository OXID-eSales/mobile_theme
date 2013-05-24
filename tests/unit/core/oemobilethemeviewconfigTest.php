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

class Unit_Views_oemobilethemeviewConfigTest extends OxidTestCase
{
    /**
     * oxViewconfig::getActiveTheme() test case for main theme
     */
    public function testGetActiveTheme_mainTheme()
    {
        $oViewConf = new oxViewConfig();
        $oViewConf->getConfig()->setConfigParam( "sTheme", "testTheme" );
        $this->assertEquals( 'testTheme', $oViewConf->getActiveTheme() );
    }

    /**
     * oxViewconfig::getActiveTheme() test case for custom theme
     */
    public function testGetActiveTheme_customTheme()
    {
        $oViewConf = new oxViewConfig();
        $oViewConf->getConfig()->setConfigParam( "sCustomTheme", "testCustomTheme" );
        $oViewConf->getConfig()->setConfigParam( "sTheme", "testTheme" );
        $this->assertEquals( 'testCustomTheme', $oViewConf->getActiveTheme() );
    }

    /**
     * oxViewconfig::getActiveThemeType() returns active theme type (deafult - desktop)
     */
    public function testGetActiveThemeTypeDefault()
    {
        $oViewConf = new oxViewConfig();
        $this->assertEquals( 'desktop', $oViewConf->getActiveThemeType() );
    }

}
