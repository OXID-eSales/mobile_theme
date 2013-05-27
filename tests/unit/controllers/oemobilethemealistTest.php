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
     * Test get showFilter parameter
     *
     * @return null
     */
    public function testGetShowFilter()
    {
        modConfig::setParameter( "showFilter", true );
        $oAlis = $this->getProxyClass( "oemobilethemealist" );
        $this->assertTrue( $oAlis->getShowFilter() );
        modConfig::setParameter( "showFilter", false );
        $this->assertEquals( false, $oAlis->getShowFilter() );
    }
}
