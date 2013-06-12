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
 * Tests for  class
 */
class Unit_Controllers_oemobilethemecontentTest extends OxidTestCase
{

    /**
     * Overloads oxConfig
     */
    public function setUp()
    {
        oxRegistry::set("oxConfig", new oemobilethemeconfig() );
    }

    /**
     * Check if viewId contains theme id
     */
    public function testGetViewId()
    {
        $oMlist = new oemobilethememanufacturerlist();
        $sViewId = $oMlist->getViewId();

        $this->assertContains( 'azure', $sViewId );
    }

}