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

class Unit_Core_oeThemeSwitcherViewConfigTest extends OxidTestCase
{
    /**
     * oxViewConfig::getEdition()
     */
    public function testGetEdition()
    {
        $oViewConf = new oeThemeSwitcherViewConfig();
        $this->assertEquals( $this->getConfig()->getEdition(), $oViewConf->getEdition() );
    }

}
