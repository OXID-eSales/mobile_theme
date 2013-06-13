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
    protected $_sMobileDevicesTypes = 'iphone|ipod|android|webos|ipad';

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
            $sUserAgent = $_SERVER['HTTP_USER_AGENT'];
            $sMobileDevicesTypes = $this->getMobileDevicesTypes();
            if ( preg_match( '/('. $sMobileDevicesTypes .')/is', $sUserAgent ) ){
                $this->setDeviceType( 'mobile' );
            } else {
                $this->setDeviceType( 'desktop' );
            }
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

}