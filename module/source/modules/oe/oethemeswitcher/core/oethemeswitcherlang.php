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

/**
 * Language related utility class
 */
class oeThemeSwitcherLang extends oeThemeSwitcherLang_parent
{
    /**
     * Returns array with paths where frontend language files are stored
     *
     * @param int $iLang active language
     *
     * @return array
     */
    protected function _getLangFilesPathArray( $iLang )
    {
        $oConfig = $this->getConfig();
        $aLangFiles = array();

        $sAppDir        = $oConfig->getAppDir();
        $sLang          = oxRegistry::getLang()->getLanguageAbbr( $iLang );
        $sTheme         = $oConfig->getConfigParam( "sTheme" );
        $sCustomTheme   = $oConfig->getConfigParam( "sCustomTheme" );
        $sActiveTheme   = $oConfig->getActiveThemeId();
        $sShopId        = $oConfig->getShopId();
        $aModuleInfo    = $this->_getActiveModuleInfo();

        // Get generic lang files
        $sGenericPath = $sAppDir . 'translations/' . $sLang;
        if ( $sGenericPath ) {
            $aLangFiles[] = $sGenericPath . "/lang.php";
            $aLangFiles = $this->_appendLangFile( $aLangFiles, $sGenericPath );
        }

        // Get theme lang files
        if ( $sTheme ) {
            $sThemePath = $sAppDir . 'views/' . $sTheme .'/' . $sLang;
            $aLangFiles[] = $sThemePath . "/lang.php";
            $aLangFiles = $this->_appendLangFile( $aLangFiles, $sThemePath );
        }

        // Get custom theme lang files
        if ( $sCustomTheme && $sCustomTheme == $sActiveTheme ) {
            $sCustPath = $sAppDir . 'views/' . $sCustomTheme .'/' . $sLang;
            $aLangFiles[] = $sCustPath . "/lang.php";
            $aLangFiles = $this->_appendLangFile( $aLangFiles, $sCustPath );
        }

        // Custom theme shop languages
        if ( $this->getConfig()->getEdition() == 'EE' ) {
            if ( $sCustomTheme && $sCustomTheme == $sActiveTheme) {
                    $sShopPath = $sAppDir . 'views/'. $sCustomTheme .'/' . $sShopId . '/' . $sLang;
                    $aLangFiles[] = $sShopPath . "/lang.php";
                    $aLangFiles = $this->_appendLangFile( $aLangFiles, $sShopPath );
            } else {
                // theme shop languages
                if ( $sTheme ) {
                    $sShopPath = $sAppDir . 'views/'. $sTheme .'/' . $sShopId . '/' . $sLang;
                    $aLangFiles[] = $sShopPath . "/lang.php";
                    $aLangFiles = $this->_appendLangFile( $aLangFiles, $sShopPath );
                }
            }
        }

        // Modules language files
        if ( is_array( $aModuleInfo ) ) {
            foreach ( $aModuleInfo as $sPath ) {
                $sFullPath = $oConfig->getModulesDir() . $sPath . '/translations/' . $sLang;
                // for < 4.6 modules, since 4.7/5.0 translation files should be in modules/modulepath/translations/ dir
                if ( !is_dir($sFullPath) ) {
                    $sFullPath = $oConfig->getModulesDir() . $sPath . '/out/lang/' . $sLang;
                }
                $aLangFiles = $this->_appendLangFile( $aLangFiles, $sFullPath );
            }
        }

        // custom language files
        if ( $sTheme ) {
            $aLangFiles[] = $sAppDir . 'views/' . $sTheme . '/' . $sLang . '/cust_lang.php';
        }
        if ( $sCustomTheme ) {
            $aLangFiles[] = $sAppDir . 'views/' . $sCustomTheme . '/' . $sLang . '/cust_lang.php';
        }

        return count( $aLangFiles ) ? $aLangFiles : false;
    }


    /**
     * Returns language cache file name
     *
     * @param bool  $blAdmin    admin or not
     * @param int   $iLang      current language id
     * @param array $aLangFiles language files to load [optional]
     *
     * @return string
     */
    protected function _getLangFileCacheName( $blAdmin, $iLang, $aLangFiles = null )
    {
        $myConfig = $this->getConfig();
        $sLangFilesIdent = '_default';
        if ( is_array( $aLangFiles ) && $aLangFiles ) {
            $sLangFilesIdent = '_'.md5(implode('+', $aLangFiles));
        }
        return "langcache_" . ( (int) $blAdmin ) . "_{$iLang}_" . $myConfig->getShopId() . "_" . $myConfig->getActiveThemeId() . $sLangFilesIdent;
    }



    /**
     * Returns language map array
     *
     * @param int  $iLang   language index
     * @param bool $blAdmin admin mode [default NULL]
     *
     * @return array
     */
    protected function _getLanguageMap( $iLang, $blAdmin = null )
    {
        $blAdmin = isset( $blAdmin ) ? $blAdmin : $this->isAdmin();
        $sKey = $iLang . ( (int) $blAdmin );
        if ( !isset( $this->_aLangMap[$sKey] ) ) {
            $this->_aLangMap[$sKey] = array();
            $myConfig = $this->getConfig();
            $sMapFile = $myConfig->getAppDir() . '/views/' .  ( $blAdmin ? 'admin' : $myConfig->getActiveThemeId() ) .'/' . oxRegistry::getLang()->getLanguageAbbr( $iLang ) . '/map.php';
            if ( $sMapFile ) {
                if ( file_exists( $sMapFile ) && is_readable( $sMapFile ) ) {
                    include $sMapFile;
                    $this->_aLangMap[$sKey] = $aMap;
                }
            }
        }

        return $this->_aLangMap[$sKey];
    }

}
