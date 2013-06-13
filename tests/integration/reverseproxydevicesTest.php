<?php
if ( OXID_VERSION_EE ) :
    /**
     * #PHPHEADER_OXID_LICENSE_INFORMATION#
     *
     * @link      http://www.oxid-esales.com
     * @package   tests
     * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
     * @version   SVN: $Id$
     */

    $sModuleDir = realpath( "." ) . '/../source/modules/oe/oemobiletheme/';

    require_once $sModuleDir . 'core/oemobilethemeuseragent.php';
    require_once realpath( "." ).'/unit/OxidTestCase.php';

    /**
     * Tests if reverse proxy is working correctly with mobile and desktop themes
     *
     */
    class Integration_Cache_reverseProxyDevicesTest extends OxidTestCase
    {

        /**
         * Returns devices types from shop side
         *
         * @return array
         */
        protected function _getDevicesTypesFromShopSide()
        {
            $oUserAgent = new oemobilethemeuseragent();
            $sMobileDevicesTypes = $oUserAgent->getMobileDeviceTypes();
            $aMobileDevicesTypes = explode( '|', $sMobileDevicesTypes );

            return $aMobileDevicesTypes;
        }

        /**
         * Returns device.vcl content
         *
         * @return string
         */
        protected function _getDeviceVclContent()
        {
            $sDeviceVclContentPath = realpath( dirname(__FILE__).'/../../' ) . '/library/ReverseProxy/Varnish/device.vcl';
            $sVclContent = strtolower( file_get_contents( $sDeviceVclContentPath ) );

            return $sVclContent;
        }

        /**
         * Checks if in shop side and vcl file is setted same quantity of mobile devices types
         */
        public function testAssertDeviceTypesCountBetweenShopAndVcl()
        {
            $aMobileDevicesTypes = $this->_getDevicesTypesFromShopSide();
            $iMobileDevicesTypesCount = count( $aMobileDevicesTypes );

            $sVclContent = $this->_getDeviceVclContent();
            $iMobileDevicesCount = substr_count( $sVclContent, 'req.http.user-agent' );

            $this->assertEquals( $iMobileDevicesTypesCount, $iMobileDevicesCount );
        }

        public function _assertDeviceTypesBetweenShopAndVcl_DataProvider() {
            $aDeviceTypes = $this->_getDevicesTypesFromShopSide();
            $sVclContent = $this->_getDeviceVclContent();

            $aParams = array();
            foreach ( $aDeviceTypes as $sDevicesType ) {
                $aParams[] = array( $sDevicesType, $sVclContent );
            }

            return $aParams;
        }

        /**
         * Checks if in shop side and vcl file is setted same mobile devices types
         *
         * @dataProvider _assertDeviceTypesBetweenShopAndVcl_DataProvider
         */
        public function testAssertDeviceTypesBetweenShopAndVcl( $sDevice, $sVclContent )
        {
            $this->assertContains( $sDevice, $sVclContent );
        }

    }
endif;
