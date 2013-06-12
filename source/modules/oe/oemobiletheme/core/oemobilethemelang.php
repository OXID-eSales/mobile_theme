<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   core
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id$
 */

/**
 * Language related utility class
 */
class oeMobileThemeLang extends oeMobileThemeLang_parent
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
        $sCustomTheme   = $oConfig->getActiveThemeId();
        $sShopId        = $oConfig->getShopId();
        $aModulePaths   = $this->_getActiveModuleInfo();

        //get generic lang files
        $sGenericPath = $sAppDir . 'translations/' . $sLang;
        if ( $sGenericPath ) {
            $aLangFiles[] = $sGenericPath . "/lang.php";
            $aLangFiles = $this->_appendLangFile( $aLangFiles, $sGenericPath );
        }

        //get theme lang files
        if ( $sTheme ) {
            $sThemePath = $sAppDir . 'views/' . $sTheme .'/' . $sLang;
            $aLangFiles[] = $sThemePath . "/lang.php";
            $aLangFiles = $this->_appendLangFile( $aLangFiles, $sThemePath );
        }

        //get custom theme lang files
        if ( $sCustomTheme && $sCustomTheme != $sTheme ) {
            $sCustPath = $sAppDir . 'views/' . $sCustomTheme .'/' . $sLang;
            $aLangFiles[] = $sCustPath . "/lang.php";
            $aLangFiles = $this->_appendLangFile( $aLangFiles, $sCustPath );
        }

        // custom theme shop languages
        if ( $this->getConfig()->getEdition() == 'EE' ) {
            if ( $sCustomTheme ) {
                $sShopPath = $sAppDir . 'views/'. $sCustomTheme .'/' . $sShopId . '/' . $sLang;
                $aLangFiles[] = $sShopPath . "/lang.php";
                $aLangFiles = $this->_appendLangFile( $aLangFiles, $sShopPath );
            } elseif ( $sTheme ) {
                // theme shop languages
                $sShopPath = $sAppDir . 'views/'. $sTheme .'/' . $sShopId . '/' . $sLang;
                $aLangFiles[] = $sShopPath . "/lang.php";
                $aLangFiles = $this->_appendLangFile( $aLangFiles, $sShopPath );
            }
        }

        // modules language files
        $aLangFiles = $this->_appendModuleLangFiles( $aLangFiles, $aModulePaths, $sLang );

        // custom language files
        $aLangFiles = $this->_appendCustomLangFiles( $aLangFiles, $sLang );

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
        if (is_array($aLangFiles) && $aLangFiles) {
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
