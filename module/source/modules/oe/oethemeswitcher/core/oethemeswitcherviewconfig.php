<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   views
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id$
 */

/**
 * View config data access class. Keeps most
 * of getters needed for formatting various urls,
 * config parameters, session information etc.
 */
class oeThemeSwitcherViewConfig extends oeThemeSwitcherViewConfig_parent
{
    /**
     * Active theme name
     *
     * @var null
     */
    protected $_sActiveTheme = null;

    /**
     * Active device name
     *
     * @var null
     */
    protected $_sActiveDeviceType = null;

    /**
     * Returns active theme name
     *
     * @return string
     */
    public function getActiveTheme()
    {
        if ( $this->_sActiveTheme === null ) {
            $this->_sActiveTheme = $this->getConfig()->getActiveThemeId();
        }
        return $this->_sActiveTheme;
    }

    /**
     * Return active device type (mobile|desktop)
     *
     * @return string
     */
    public function getActiveDeviceType()
    {
        if ( $this->_sActiveDeviceType === null ) {
            $oUserAgent = oxNew( 'oeThemeSwitcherUserAgent' );
            $this->_sActiveDeviceType = $oUserAgent->getDeviceType();
        }
        return $this->_sActiveDeviceType;
    }

    /**
     * Return shop edition (EE|CE|PE)
     *
     * @return string
     */
    public function getEdition()
    {
        return $this->getConfig()->getEdition();
    }

}
