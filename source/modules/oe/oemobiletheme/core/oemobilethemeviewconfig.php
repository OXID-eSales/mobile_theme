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
class oemobilethemeviewconfig extends oemobilethemeviewconfig_parent
{
    /**
     * Active theme type
     *
     * @var string
     */
    protected $_sActiveThemeType = null;

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
     * Returns active device type (mobile|desktop)
     *
     * @return string
     */
    public function getActiveDeviceType()
    {
        if ( $this->_sActiveDeviceType === null ) {

            $this->_sActiveDeviceType = oxRegistry::get("oxUtilsServer")->getDeviceType();
        }
        return $this->_sActiveDeviceType;
    }

}
