<?php
/**
 * This file is part of OXID eSales theme switcher module.
 *
 * OXID eSales theme switcher module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales theme switcher module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales theme switcher module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
 */


    switch (getenv('OXID_VERSION')) {
        case 'EE':
            define ('oxCCTempDir', '/tmp/oxCCTempDir_ee/');
            define('OXID_VERSION_EE', true );
            define('OXID_VERSION_PE', false);
            define('OXID_VERSION_PE_PE', false );
            define('OXID_VERSION_PE_CE', false );
            break;
        case 'PE':
            define ('oxCCTempDir', '/tmp/oxCCTempDir_pe/');
            define('OXID_VERSION_EE',    false);
            define('OXID_VERSION_PE',    true );
            define('OXID_VERSION_PE_PE', true );
            define('OXID_VERSION_PE_CE', false );
        break;
        case 'CE':
            define ('oxCCTempDir', '/tmp/oxCCTempDir_ce/');
            define('OXID_VERSION_EE',    false);
            define('OXID_VERSION_PE',    true );
            define('OXID_VERSION_PE_PE', false );
            define('OXID_VERSION_PE_CE', true );
        break;

        default:
            die('bad version--- : '."'".getenv('OXID_VERSION')."'");
        break;
    }

    define ('oxPATH', getenv('oxPATH'));
    define ('OXID_VERSION', getenv('OXID_VERSION'));
    define ('OXID_TEST_UTF8', getenv('OXID_TEST_UTF8'));

    if (!is_dir(oxCCTempDir)) {
        mkdir(oxCCTempDir, 0777, 1);
    }

require_once 'PHPUnit/Framework/TestSuite.php';
error_reporting( (E_ALL ^ E_NOTICE) | E_STRICT );
ini_set('display_errors', true);

echo "=========\nrunning php version ".phpversion()."\n\n============\n";

/**
 * PHPUnit_Framework_TestCase implemetnation for adding and testing all unit tests from unit dir
 */
class AllTestsUnit extends PHPUnit_Framework_TestCase
{
    /**
     * Test suite
     *
     * @return object
     */
    static function suite()
    {
        chdir(dirname(__FILE__));
        $oSuite = new PHPUnit_Framework_TestSuite( 'PHPUnit' );
        $sFilter = getenv("PREG_FILTER");

        $aTestSuiteDirs = array( 'unit', 'integration' );
        $aTestDirs = array( '', 'core', 'maintenance', 'views', 'admin', 'setup', 'components/widgets', 'price', 'timestamp' );
        if (getenv('TEST_DIRS')) {
            $aTestDirs = explode('%', getenv('TEST_DIRS'));
        }

        $sTestFileNameEnd = 'Test.php';
        if ( getenv('OXID_TEST_UTF8') ) {
            $sTestFileNameEnd = 'utf8Test.php';
        }

        foreach ($aTestDirs as $sTestDir ) {
            if ($sTestDir == '_root_') {
                $sTestDir = '';
            }

            foreach ( $aTestSuiteDirs as $sTestSuiteDir ) {

                $sDir = rtrim($sTestSuiteDir.'/'.$sTestDir, '/');

                echo "Searching for $sDir\n";
                //adding UNIT Tests
                if (!is_dir($sDir)) {
                    continue;
                }
                echo "Adding unit tests from $sDir/*{$sTestFileNameEnd}\n";
                foreach ( glob( "$sDir/*".$sTestFileNameEnd ) as $sFilename) {

                    if ( !getenv('OXID_TEST_UTF8') && strpos( $sFilename, 'utf8Test.php' ) !== false ) {
                        continue;
                    }

                    if (!$sFilter || preg_match("&$sFilter&i", $sFilename)) {
                        error_reporting( (E_ALL ^ E_NOTICE) | E_STRICT );
                        ini_set('display_errors', true);
                        include_once $sFilename;
                        $sClassName = str_replace( array( "/", ".php" ), array( "_", "" ), $sFilename );

                        if ( class_exists( $sClassName ) ) {
                            $oSuite->addTestSuite( $sClassName );
                        } else {
                            echo "\n\nWarning: class not found: $sClassName in $sFilename\n\n\n ";
                        }
                    } else {
                        echo "skiping $sFilename\n";
                    }
                }
            }
        }

        return $oSuite;
    }
}
