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
 * Server data manipulation class
 */
class oemobilethemeutilsserver extends oemobilethemeutilsserver_parent
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
     * Detect if device is mobile or desktop
     *
     * @return string mobile|desktop
     */
    public function setDeviceType( $sType = '' )
    {
        if ( $sType ) {
            $this->_sDeviceType = $sType;
        } else {
            $this->_sDeviceType = 'desktop';
            $sUserAgent = $this->getServerVar( 'HTTP_USER_AGENT' );
            if (preg_match('/(iphone|ipod|android|webos|ipad|mobi)/is', $sUserAgent)){
                $this->_sDeviceType = 'mobile';
            }
        }
    }

    /**
     * Detect if device is mobile or desktop
     *
     * @return string mobile|desktop
     */
    public function getDeviceType()
    {
        if ( $this->_sDeviceType === null ) {
            $this->setDeviceType();
        }
        return $this->_sDeviceType;
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
