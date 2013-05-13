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
            $sThemeType = $this->getThemeType();
            if ( $sThemeType == 'mobile' && !$this->isAdmin() ) {
                return $this->_aConfigParams['sMobileTheme'];
            }
        }

        return $sReturn;

    }

    /**
     * Returns active template theme type
     *
     * @return null;
     */
    public function setThemeType()
    {
        // user set theme type
        $sRequestTheme = $this->getRequestParameter('themeType');
        if ( $sRequestTheme ) {
            $sThemeType = $sRequestTheme;
            $oTheme = oxNew('oxTheme');
            $oTheme->setActiveThemeType( $sThemeType );
        } else {
            // check for mobile devices
            $oTheme = oxNew('oxTheme');
            $sThemeType = $oTheme->getActiveThemeType();
        }
        $this->_sThemeType = $sThemeType;
    }

    /**
     * Returns active template theme type
     *
     * @return string;
     */
    public function getThemeType()
    {
        if ( $this->_sThemeType == null ) {
            $this->setThemeType();
        }
        return $this->_sThemeType;
    }

}
