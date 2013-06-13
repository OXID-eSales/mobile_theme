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
class oeMobileThemeConfig extends oeMobileThemeConfig_parent
{
    /**
     * Active template theme type
     *
     * @var string
     */
    protected $_blIsUserAgentMobile = null;

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
            if ( $this->isUserAgentMobile() &&  !$this->isAdmin() ) {
                return $this->_aConfigParams['sMobileTheme'];
            }
        }

        return $sReturn;

    }

    /**
     * return current active theme, or custom theme if specified
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
     * Check is User Agent mobile
     *
     * @return bool
     */
    public function isUserAgentMobile()
    {
        if( $this->_blIsUserAgentMobile === null ) {

            $sUserAgent = $this->getRequestParameter('themeType');
            if( !empty($sUserAgent) ){
                oxRegistry::get("oxUtilsServer")->setOxCookie('sThemeType', $sUserAgent);
            } else {
                $sUserAgent = oxRegistry::get("oxUtilsServer")->getOxCookie('sThemeType');
                if ( empty($sUserAgent) ) {
                    $oUserAgent = oxNew( 'oeMobileThemeUserAgent' );
                    $sUserAgent = $oUserAgent->getDeviceType();
                }
            }
            $this->_blIsUserAgentMobile = ($sUserAgent == 'mobile');
        }

        return $this->_blIsUserAgentMobile;
    }
}
