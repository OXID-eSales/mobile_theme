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
class Unit_Controllers_oeThemeSwitcherAListTest extends OxidTestCase
{

    /**
     * Overloads oxConfig
     */
    public function setUp()
    {
        oxRegistry::set("oxConfig", new oeThemeSwitcherConfig() );
        modConfig::setParameter( "showFilter", null );
    }

    public function providerGetShowFilter()
    {
        return array(
            array( true ),
            array( false )
        );
    }

    /**
     * Test get showFilter parameter
     *
     * @dataProvider providerGetShowFilter
     */
    public function testGetShowFilter( $blFilterValue )
    {
        modConfig::setParameter( "showFilter", $blFilterValue );
        $oAList = new oeThemeSwitcherAList();

        $this->assertEquals( $blFilterValue, $oAList->getShowFilter() );
    }

    /**
     * Check if viewId contains theme id
     */
    public function testGetViewId()
    {
        $oAList = $this->getProxyClass( "oeThemeSwitcherAList" );
        $sViewId = $oAList->getViewId();

        $this->assertContains( "azure", $sViewId );
    }
}
