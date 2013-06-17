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

if (getenv('oxPATH')) {
    define ('oxPATH', getenv('oxPATH'));
}

if (!defined('oxPATH')) {
    die('oxPATH is not defined');
}

if (!defined('OXID_VERSION_SUFIX')) {
    define('OXID_VERSION_SUFIX', '');
}

require_once 'unit/test_config.inc.php';

define('oxADMIN_LOGIN', oxDb::getDb()->getOne("select OXUSERNAME from oxuser where oxid='oxdefaultadmin'"));
if (getenv('oxADMIN_PASSWD')) {
    define('oxADMIN_PASSWD', getenv('oxADMIN_PASSWD'));
} else {
    define('oxADMIN_PASSWD', 'admin');
}

if ( getenv('CODECOVERAGE') && isset(PHPUnit_Util_Filter::$addUncoveredFilesFromWhitelist) ) {

    // PHPUnit_Util_Filter configuration
    PHPUnit_Util_Filter::$addUncoveredFilesFromWhitelist = true;

    PHPUnit_Util_Filter::addDirectoryToWhitelist(oxPATH.'/core');
    PHPUnit_Util_Filter::addDirectoryToWhitelist(oxPATH.'/controllers');

}


