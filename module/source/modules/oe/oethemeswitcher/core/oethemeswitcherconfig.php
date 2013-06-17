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
 * Main shop configuration class.
 *
 * @package core
 */
class oeThemeSwitcherConfig extends oeThemeSwitcherConfig_parent
{
    /**
     * Active template theme type
     *
     * @var string
     */
    protected $_blIsMobileThemeRequested = null;

    /**
     * Returns config parameter value if such parameter exists
     *
     * @param string $sName config parameter name
     *
     * @return mixed
     */
    public function getConfigParam( $sName )
    {
        $sReturn = parent::getConfigParam( $sName );

        if ( $sName == "sCustomTheme" ) {
            // check for mobile devices
            if ( $this->isMobileThemeRequested() &&  !$this->isAdmin() ) {
                return $this->_aConfigParams['sMobileTheme'];
            }
        }

        return $sReturn;

    }

    /**
     * Return current active theme
     *
     * @return string
     */
    public function getActiveThemeId()
    {
        $sCustomTheme = $this->getConfigParam('sCustomTheme');
        if ($sCustomTheme) {
            return $sCustomTheme;
        }
        return $this->getConfigParam('sTheme');
    }


    /**
     * Check if requested mobile theme
     *
     * @return bool
     */
    public function isMobileThemeRequested()
    {
        if( $this->_blIsMobileThemeRequested === null ) {

            $sRequestedThemeType = $this->getRequestParameter('themeType');
            if( !empty( $sRequestedThemeType ) ) {
                oxRegistry::get("oxUtilsServer")->setOxCookie('sThemeType', $sRequestedThemeType);
            } else {
                $sRequestedThemeType = oxRegistry::get("oxUtilsServer")->getOxCookie('sThemeType');
                if ( empty( $sRequestedThemeType ) ) {
                    $oUserAgent = oxNew( 'oeThemeSwitcherUserAgent' );
                    $sRequestedThemeType = $oUserAgent->getDeviceType();
                }
            }
            $this->_blIsMobileThemeRequested = ( $sRequestedThemeType == 'mobile' );
        }

        return $this->_blIsMobileThemeRequested;
    }
}
