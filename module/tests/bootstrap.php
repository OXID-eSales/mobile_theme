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
 * @link          http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2014
 */

if (getenv('oxPATH')) {
    define('oxPATH', getenv('oxPATH'));
    switch (getenv('OXID_VERSION')) {
        case 'EE':
            define('oxCCTempDir', '/tmp/oxCCTempDir_ee/');
            define('OXID_VERSION_EE', true);
            define('OXID_VERSION_PE', false);
            define('OXID_VERSION_PE_PE', false);
            define('OXID_VERSION_PE_CE', false);
            define('OXID_VERSION_SUFIX', "_ee");
            break;
        case 'PE':
            define('oxCCTempDir', '/tmp/oxCCTempDir_pe/');
            define('OXID_VERSION_EE', false);
            define('OXID_VERSION_PE', true);
            define('OXID_VERSION_PE_PE', true);
            define('OXID_VERSION_PE_CE', false);
            define('OXID_VERSION_SUFIX', "_pe");
            break;
        case 'CE':
            define('oxCCTempDir', '/tmp/oxCCTempDir_ce/');
            define('OXID_VERSION_EE', false);
            define('OXID_VERSION_PE', true);
            define('OXID_VERSION_PE_PE', false);
            define('OXID_VERSION_PE_CE', true);
            define('OXID_VERSION_SUFIX', "_ce");
            break;

        default:
            die('bad version : ' . "'" . getenv('OXID_VERSION') . "'");
            break;
    }

    if (!is_dir(oxCCTempDir)) {
        mkdir(oxCCTempDir, 0777, 1);
    }
} else {
    define('OXID_VERSION_EE', 0);
    define('OXID_VERSION_PE_PE', 0);
    define('OXID_VERSION_PE_CE', 1);

    // AUTOMATICALLY GENERATED CONSTANTS DEPENDING ON PREVIOUS
    define('OXID_VERSION_PE', OXID_VERSION_PE_CE || OXID_VERSION_PE_PE);
    define('OXID_VERSION_SUFIX', (OXID_VERSION_EE ? '_ee' : '') . (OXID_VERSION_PE_PE ? '_pe' : '') . (OXID_VERSION_PE_CE ? '_ce' : ''));
    define('oxPATH', '/var/www/eshop/eshop/source/');
    define('oxCCTempDir', '/var/www/eshop/eshop/source/tmp/');
}

if (!defined('OXID_VERSION_SUFIX')) {
    define('OXID_VERSION_SUFIX', '');
}
