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
     * Returns active theme name
     *
     * @return string
     */
    public function getActiveTheme()
    {
        if ( $this->_sActiveTheme === null ) {
            $oTheme = oxNew( 'oxTheme' );
            $this->_sActiveTheme = $oTheme->getActiveThemeId();
        }
        return $this->_sActiveTheme;
    }

    /**
     * Returns active theme type
     *
     * @return string
     */
    public function getActiveThemeType()
    {
        if ( $this->_sActiveThemeType === null ) {
            $oTheme = oxNew('oxTheme');
            $this->_sActiveThemeType = $oTheme->getActiveThemeType();
        }
        return $this->_sActiveThemeType;
    }

}
