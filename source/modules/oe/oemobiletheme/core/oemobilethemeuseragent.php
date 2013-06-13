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
 * Class for User Agent.
 *
 * @package core
 */
class oeMobileThemeUserAgent
{
    /**
     * Detected device type
     *
     * @var string
     */
    protected $_sDeviceType = null;

    /**
     * Mobile device types
     *
     * @var string
     */
    protected $_sMobileDevicesTypes = 'iphone|ipod|android|webos|htc|fennec|iemobile|blackberry|symbianos|opera mobi';

    /**
     * Returns if device is mobile
     *
     * @return bool
     */
    public function isMobile()
    {
        return $this->getDeviceType() == 'mobile';
    }

    /**
     * Function returns all supported mobile devices types
     *
     * @return string
     */
    public function getMobileDevicesTypes()
    {
        return $this->_sMobileDevicesTypes;
    }

    /**
     * Returns device type: mobile | desktop
     *
     * @return string
     */
    public function getDeviceType()
    {
        if ( $this->_sDeviceType === null ) {
            $this->setDeviceType( $this->_detectDeviceType() );
        }

        return $this->_sDeviceType;
    }

    /**
     * Set device type
     */
    public function setDeviceType( $sDeviceType )
    {
        $this->_sDeviceType = $sDeviceType;
    }

    /**
     * Set mobile device types
     */
    public function setMobileDevicesTypes( $sMobileDeviceTypes )
    {
        $this->_sMobileDevicesTypes = $sMobileDeviceTypes;
    }


    /**
     * Detects device type from global variable. Device types: mobile, desktop
     *
     * @return string
     */
    protected function _detectDeviceType()
    {
        $sDeviceType = 'desktop';
        if ( preg_match( '/('. $this->getMobileDevicesTypes() .')/is', $_SERVER['HTTP_USER_AGENT'] ) ){
            $sDeviceType = 'mobile';
        }
        return $sDeviceType;
    }
}