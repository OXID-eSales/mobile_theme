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

require_once realpath( dirname( __FILE__ ) . '/../../' ) . '/tests/unit/OxidTestCase.php';

class ReverseProxyHelper
{
    /**
     * Path to file storage.
     * @var string
     */
    private $_sFilePath = '/tmp/';
    /**
     * Path and name to cookies file.
     * @var string
     */
    public $sCookiesFileFullName = '/tmp/rpcookies';

    /**
     * All start page widgets.
     * @var array
     */
    public $aStartWidgets = array( "oxwcookienote", "oxwlanguagelist", "oxwcurrencylist", "oxwservicemenu"
                                , "oxwcategorytree", "oxwminibasket", "oxwtagcloud", "oxwservicelist", "oxwinformation"
                                , "oxwmanufacturerlist" );

    /**
     * All start page widgets for mobile devices.
     * @var array
     */
    public $aStartWidgetsForMobile = array( "oxwcookienote", "oxwcategorytree", "oxwminibasket", "oxwservicelist"
                                        , "oxwinformation" );

    /**
     * All list page widgets.
     * @var array
     */
    public $aListWidgets = array( "oxwcookienote", "oxwlanguagelist", "oxwcurrencylist", "oxwservicemenu"
                                , "oxwcategorytree", "oxwminibasket", "oxwtagcloud", "oxwservicelist", "oxwinformation"
                                , "oxwmanufacturerlist" );

    /**
     * All details page widgets.
     * @var array
     */
    public $aDetailsWidgets = array( "oxwcookienote", "oxwlanguagelist", "oxwcurrencylist", "oxwservicemenu"
                                , "oxwcategorytree", "oxwminibasket", "oxwtagcloud", "oxwservicelist", "oxwinformation"
                                , "oxwmanufacturerlist" );

    /**
     * All compare page widgets.
     * @var array
     */
    public $aCompareWidgets = array("oxwcookienote", "oxwlanguagelist", "oxwcurrencylist", "oxwservicemenu"
                                , "oxwcategorytree", "oxwminibasket", "oxwservicelist", "oxwinformation"
                                , "oxwmanufacturerlist");

    /**
     * All compare page widgets for mobile device.
     * @var array
     */
    public $aCompareWidgetsForMobile = array( "oxwcookienote", "oxwminibasket", "oxwservicelist", "oxwinformation" );

    /**
     * All account page widgets.
     * @var array
     */
    public $aAccountWidgets = array( "oxwcookienote", "oxwlanguagelist", "oxwcurrencylist", "oxwservicemenu"
                                , "oxwcategorytree", "oxwminibasket", "oxwservicelist", "oxwinformation"
                                , "oxwmanufacturerlist" );

    /**
     * All account page widgets for mobile device.
     * @var array
     */
    public $aAccountWidgetsForMobile = array( "oxwcookienote", "oxwminibasket", "oxwservicelist", "oxwinformation" );

    /**
     * All not existing page widgets.
     * @var array
     */
    public $a404Widgets = array( "oxwcookienote", "oxwlanguagelist", "oxwcurrencylist", "oxwservicemenu"
                                , "oxwcategorytree", "oxwminibasket", "oxwservicelist", "oxwinformation"
                                , "oxwmanufacturerlist" );

    /**
     * All not existing page widgets for mobile device.
     * @var array
     */
    public $a404WidgetsForMobile = array( "oxwcookienote", "oxwminibasket", "oxwservicelist", "oxwinformation" );

    /**
     * Set cookie file full name.
     *
     * @param string $sCookiesFileName name of cookie file without path.
     *
     * @return void
     */
    public function setCookieFileName( $sCookiesFileName )
    {
        $this->sCookiesFileFullName = '/tmp/'. $sCookiesFileName;
    }

    /**
     * Delete cookie file if exist.
     *
     * @return void.
     */
    public function deleteCookieFile()
    {
        if ( file_exists( $this->sCookiesFileFullName ) ) {
            unlink( $this->sCookiesFileFullName );
        }
    }

    /**
     * Get page content with curl.
     * Cookies file need for two connection as environment key changes regenerate cache.
     *
     * @param string $sPageUrl page to get url.
     * @param bool $blPost call page with post or get.
     * @param string $sUserAgent mobile user agent if it's not null
     *
     * @return string
     */
    public function getPage( $sPageUrl, $blPost = false, $aParams = null, $sUserAgent = null )
    {
        $ch = curl_init();

        curl_setopt( $ch, CURLOPT_URL, $sPageUrl );
        // Add bigger timout (server has 30).
        curl_setopt( $ch, CURLOPT_TIMEOUT, 31 );
        // Return result as string.
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
        if ($blPost) {
            curl_setopt( $ch, CURLOPT_POST, 1 );
            if ( $aParams && count($aParams) > 0 ) {
                $sParams = '';
                foreach ( $aParams as $sParamKey => $sParamValue ) {
                    $sParams .= $sParamKey ."=". $sParamValue ."&";
                }
                $sParams = substr( $sParams, 0, -1 );

                curl_setopt( $ch, CURLOPT_POSTFIELDS, $sParams );
            }
        } else {
            curl_setopt( $ch, CURLOPT_HTTPGET, 1 );
        }
        // Will include headers in to output.
        curl_setopt( $ch, CURLOPT_HEADER, 1 );
        // For reverse proxy log to see who called.
        curl_setopt( $ch, CURLOPT_USERAGENT, "OXID-TEST" );
        // Where cookies should be stored.
        curl_setopt( $ch, CURLOPT_COOKIEJAR, $this->sCookiesFileFullName );
        // From where cookies will be send to server.
        curl_setopt( $ch, CURLOPT_COOKIEFILE, $this->sCookiesFileFullName );
        // Forse close connection, no cache.
        curl_setopt( $ch, CURLOPT_FORBID_REUSE, true );
        // Adds user agent
        if ( $sUserAgent ) {
            curl_setopt( $ch, CURLOPT_USERAGENT, $sUserAgent );
        }

        $sRes = curl_exec( $ch );
        curl_close( $ch );

        return $sRes;
    }

    /**
     * Get render date value by tag name.
     *
     * @param string $sPage page to get param from.
     * @param string $sTag tag name to get valye by.
     *
     * @return int
     */
    public function getRenderDateFromString( $sPage, $sTag )
    {
        $stringToFind = '/<div id=\''. $sTag .'_timestamp' .'\'>Timestamp: (\d+\.\d+)/';
        $sValue = preg_match( $stringToFind, $sPage, $aRes );
        return $aRes[1];
    }

    /**
     * Returns if text exists
     *
     * @param string $sPage   page to get param from.
     * @param string $sString text to search.
     *
     * @return int
     */
    public function isTextPresent( $sPage, $sString )
    {
        $sValue = preg_match( '/'.$sString.'/', $sPage, $aRes );
        return $sValue;
    }

    /**
     * Create file with custom content.
     *
     * @param string $sFileName file name
     * @param string $sContent content to put in file.
     */
    public function createFile( $sFileName, $sContent )
    {
        $sFullFilePath = $this->_sFilePath . $sFileName;
        $fc = fopen( $sFullFilePath, 'w' );
        fwrite( $fc, $sContent );
        fclose( $fc );
    }
}

endif;