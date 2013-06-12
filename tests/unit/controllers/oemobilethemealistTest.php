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
class Unit_Controllers_oemobilethemealistTest extends OxidTestCase
{

    /**
     * Overloads oxConfig
     */
    public function setUp()
    {
        oxRegistry::set("oxConfig", new oemobilethemeconfig() );
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
        $oAlist = new oemobilethemealist();

        $this->assertEquals( $blFilterValue, $oAlist->getShowFilter() );
    }

    /**
     * Check if viewId contains theme id
     */
    public function testGetViewId()
    {
        $oAlist = $this->getProxyClass( "oemobilethemealist" );
        $sViewId = $oAlist->getViewId();

        $this->assertContains( "azure", $sViewId );
    }
}
