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
class oemobilethemeconfig extends oemobilethemeconfig_parent
{

    /**
     * Active template theme type
     *
     * @var string
     */
    protected $_sThemeType = null;

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
            $sThemeType = $this->getActiveThemeType();
            if ( $sThemeType == 'mobile' && !$this->isAdmin() ) {
                return $this->_aConfigParams['sMobileTheme'];
            }
        }

        return $sReturn;

    }

    /**
     * Checks if current device uses mobile or desktop type theme
     *
     * @return string theme type (mobile or desktop)
     */
    public function getActiveThemeType()
    {
        if ( $this->_sActiveType === null ) {
            $this->setActiveThemeType();
        }
        return $this->_sActiveType;
    }

    /**
     * Active theme setter
     *
     * @param string $sType theme type (mobile or desktop)
     */
    public function setActiveThemeType( $sType = '' )
    {
        if ( $sType ) {
            $this->_sActiveType = $sType;
            oxRegistry::get("oxUtilsServer")->setOxCookie('sThemeType', $sType);
        } else {
            $sCookieType = oxRegistry::get("oxUtilsServer")->getOxCookie('sThemeType');
            if ( $sCookieType ) {
                $this->_sActiveType = $sCookieType;
            } else {
                $this->_sActiveType = 'desktop';
                $sDeviceType = oxRegistry::get("oxUtilsServer")->getDeviceType();
                // if mobile device is detected and mobile theme is set
                if ( ($sDeviceType == 'mobile') && $this->getConfig()->getConfigParam('sMobileTheme') ) {
                    $this->_sActiveType = 'mobile';
                }
            }

        }
    }

    /**
     * return current active theme, or custom theme if specified
     *
     * @return string
     */
    public function getActiveThemeId()
    {
        $sCustTheme = $this->getConfig()->getConfigParam('sCustomTheme');
        if ($sCustTheme) {
            return $sCustTheme;
        }
        return $this->getConfig()->getConfigParam('sTheme');
    }

}
