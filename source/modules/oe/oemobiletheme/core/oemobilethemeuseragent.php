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
class oemobilethemeuseragent
{
    /**
     * Detected device type
     *
     * @var string
     */
    protected $_sDeviceType = null;

    /**
     * Mobile devices types
     *
     * @var string
     */
    protected $_sMobileDevicesTypes = 'iphone|ipod|android|webos|ipad';

    /**
     * Returns if device is mobile
     *
     * @return bool
     */
    public function isMobile()
    {
        if ( $this->_sDeviceType ) {
            return $this->_sDeviceType == 'mobile' ? true : false;
        } else {
            $sUserAgent = $_SERVER['HTTP_USER_AGENT'];
            $sMobileDevicesTypes = $this->getMobileDevicesTypes();
            if ( preg_match( '/('. $sMobileDevicesTypes .')/is', $sUserAgent ) ){
                $this->_sDeviceType = 'mobile';
                return true;
            }
            $this->_sDeviceType = 'desktop';
            return false;
        }
    }

    /**
     * Function returns all supported devices types for mobile theme
     *
     * @return string
     */
    public function getMobileDevicesTypes()
    {
        return $this->_sMobileDevicesTypes;
    }
}