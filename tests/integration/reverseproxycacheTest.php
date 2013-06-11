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

require_once realpath( dirname(__FILE__).'/../../') . '/tests/unit/OxidTestCase.php';
require_once 'reverseproxyhelper.php';

define( 'MOBILE_THEME', true );

/**
 * Tests if reverse proxy is working
 *
 */
class Integration_Cache_reverseProxyCacheTest extends OxidTestCase
{
    /**
     * Initialize the fixture.
     *
     * @return null
     */
    protected function setUp()
    {
        parent::setUp();
        $this->getConfig()->saveShopConfVar( 'bool', 'blReverseProxyActive', true );
        $this->getConfig()->saveShopConfVar( 'str', 'iLayoutCacheLifeTime', 3000 );
    }

    /**
     * Tear down the fixture.
     *
     * @return null
     */
    protected function tearDown()
    {
        $this->getConfig()->saveShopConfVar( 'bool', 'blReverseProxyActive', false );
        parent::tearDown();
    }

    /**
     * Create result file and mark test as incomplete.
     *
     * @param string $sTestname failed test name, used to form file name
     * @param string $sPageContent result (page content)
     * @param string $sPageUrl tested url, used to form file name
     * @param string $sMessage skipped message
     */
    public function __markTestIncomplete( $sTestname, $sPageContent, $sPageUrl, $sMessage )
    {
        $reverseProxyHelper = new ReverseProxyHelper();

        $sFileName = $sTestname .'_'. preg_replace('/[^\w\-~_\.]+/u', '-', $sPageUrl);
        $reverseProxyHelper->createFile( $sFileName, $sPageContent );

        $this->markTestIncomplete( $sMessage );
    }

    /**
     * Check if shop has reverse proxy active.
     */
    public function testIsReverseProxyActive()
    {
        $oRpBackend = oxRegistry::get( 'oxReverseProxyBackend' );
        $oRpBackend->setFlush();
        $oRpBackend->execute();

        $reverseProxyHelper = new ReverseProxyHelper();
        $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' );
        // Delete cookie file in this case as data providers are executed before all tests.
        $reverseProxyHelper->deleteCookieFile();

        $sShopUrl = $this->getConfigParam( 'sShopURL' );
        $sPageGet = $reverseProxyHelper->getPage( $sShopUrl );

        $this->assertEquals( 1, $reverseProxyHelper->isTextPresent( $sPageGet, 'Reverse proxy is active.'), 'Reverse proxy marked as inactive.' );
    }

    /**
     * Check if element is cached. If not output error messge.
     *
     * @param array  $aCachedElements
     * @param string $sPageGet
     * @param string $sPagePost
     * @param string $sPageUrl
     * @param string $sUserAgent
     */
    protected function _checkIfCached( $aCachedElements, $sPage1, $sPage2, $sPageUrl, $sMobileUserAgent )
    {
        $reverseProxyHelper = new ReverseProxyHelper();
        $sMobileUserAgent ? $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' ) : $reverseProxyHelper->setCookieFileName( 'rpcookiescachetestmobile' );

        foreach ( $aCachedElements as $sCachedElement ) {
            $iDateFirstHit = $reverseProxyHelper->getRenderDateFromString( $sPage1, $sCachedElement );
            $iDateSecondHit = $reverseProxyHelper->getRenderDateFromString( $sPage2, $sCachedElement );

            // Check if element is in both pages. If not something went wrong. Put result to temp file and mark as incomplete.
            if ( !$iDateFirstHit ) {
                $this->__markTestIncomplete( 'testPageCache', $sPage1, $sPageUrl, 'Element '. $sCachedElement .' missing!' );
            }
            if (!$iDateSecondHit) {
                $this->__markTestIncomplete( 'testPageCache', $sPage2, $sPageUrl, 'Element '. $sCachedElement .' missing!' );
            }

            // Check if dates correct.
            $this->assertTrue( ( $iDateFirstHit == $iDateSecondHit )
                               , "Checking element: ". $sCachedElement ." in page ". $sPageUrl .". Date on first hit
                                  (". date('Y-m-d H:i:s', $iDateFirstHit) .")[".$iDateFirstHit."] must be same as in second hit
                                  (". date('Y-m-d H:i:s', $iDateSecondHit) .")[".$iDateSecondHit."],
                                  as date in second hit comes from rendered page which should be previously cached." );

            // Checks theme type.
            $sMobileUserAgent ? $sThemeType = 'mobile' : $sThemeType = 'desktop';
            $this->assertContains( '<div id="'. $sCachedElement .'_themetype' .'">Theme type: '. $sThemeType .'', $sPage1 );
        }
    }

    /**
     * Check if element is not cached. If cached output error message.
     *
     * @param array  $aCachedElements
     * @param string $sPageGet
     * @param string $sPagePost
     * @param string $sPageUrl
     */
    protected function _checkIfNotCached( $aNotCachedElements, $sPage1, $sPage2, $sPageUrl )
    {
        $reverseProxyHelper = new ReverseProxyHelper();
        $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' );

        foreach ( $aNotCachedElements as $sNotCachedElement ) {
            $iDateFirstHit = $reverseProxyHelper->getRenderDateFromString( $sPage1, $sNotCachedElement );
            $iDateSecondHit = $reverseProxyHelper->getRenderDateFromString( $sPage2, $sNotCachedElement );

            // Check if element is in both pages. If not something went wrong. Put result to temp file and mark as incomplete.
            if (!$iDateFirstHit) {
                $this->__markTestIncomplete( 'testPageCache_nc', $sPage1, $sPageUrl, 'Element '. $sNotCachedElement .' missing!' );
            }
            if (!$iDateSecondHit) {
                $this->__markTestIncomplete( 'testPageCache_nc', $sPage2, $sPageUrl, 'Element '. $sNotCachedElement .' missing!' );
            }

            // Check if dates correct.
            $this->assertTrue( $iDateFirstHit < $iDateSecondHit
                               , "Checking element: ". $sNotCachedElement ." in page ". $sPageUrl .". Date on first hit
                               (". date('Y-m-d H:i:s', $iDateFirstHit) .")[".$iDateFirstHit."] must be lower then date on second hit
                               (". date('Y-m-d H:i:s', $iDateSecondHit) .")[".$iDateSecondHit."]." );
        }
    }

    /**
     * Module dataprovider.
     */
    public function providerPageCache_get()
    {
        $reverseProxyHelper = new ReverseProxyHelper();
        $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' );

        $sBaseUrl = $this->getConfigParam('sShopURL');
        $sBaseSeparator = ( substr( $sBaseUrl, -1 ) != '/' ) ? "/" : "";

        $sCategoryWithSubcategoriesUrl    = $sBaseUrl . $sBaseSeparator . "Eco-Fashion/Woman/";
        $sCategoryWithoutSubcategoriesUrl = $sBaseUrl . $sBaseSeparator . "Eco-Fashion/Woman/Jeans/";
        $sDetailsUrl                      = $sBaseUrl . $sBaseSeparator . "Eco-Fashion/Woman/Jeans/Kuyichi-Jeans-Anna.html";
        $sCompareUrl                      = $sBaseUrl . $sBaseSeparator . "en/my-product-comparison/";
        $sAccountUrl                      = $sBaseUrl . $sBaseSeparator . "en/my-account/";
        $sOrderHistoryUrl                 = $sBaseUrl . $sBaseSeparator . "en/order-history/";
        $sMyPasswordUrl                   = $sBaseUrl . $sBaseSeparator . "en/my-password/";
        $sNewsLetterUrl                   = $sBaseUrl . $sBaseSeparator . "index.php?lang=1&cl=account_newsletter";
        $sMyAddressUrl                    = $sBaseUrl . $sBaseSeparator . "en/my-address/";
        $sComparisonUrl                   = $sBaseUrl . $sBaseSeparator . "en/my-product-comparison/";
        $sWishListUrl                     = $sBaseUrl . $sBaseSeparator . "en/my-wish-list/";
        $sGiftRegistryUrl                 = $sBaseUrl . $sBaseSeparator . "en/my-gift-registry/";
        $sListmaniaUrl                    = $sBaseUrl . $sBaseSeparator . "en/my-listmania-list/";
        $s404Page                         = $sBaseUrl . $sBaseSeparator . "/zuzu/not_existing_page.html";

        $aCachedStartElements            = $reverseProxyHelper->aStartWidgets;
        $aCachedListElements             = $reverseProxyHelper->aListWidgets;
        $aCachedDetailElements           = $reverseProxyHelper->aDetailsWidgets;
        $aCachedCompareElements          = $reverseProxyHelper->aCompareWidgets;
        $aCachedCompareElementsForMobile = $reverseProxyHelper->aCompareWidgetsForMobile;
        $aCachedAccountElements          = $reverseProxyHelper->aAccountWidgets;
        $aCachedAccountElementsForMobile = $reverseProxyHelper->aAccountWidgetsForMobile;
        $aCached404Elements              = $reverseProxyHelper->a404Widgets;
        $aCached404ElementsForMobile     = $reverseProxyHelper->a404WidgetsForMobile;

        $aCachedStartElements          = array("start");
        $aCachedListElements           = array("alist");
        $aCachedDetailElements         = array("details");

        $aUncachedCompareElements      = array("compare");
        $aUncachedAccountElements      = array("account");
        $aUncachedOrderHistoryElements = array("account_order");
        $aUncachedMyPasswordElements   = array("account_password");
        $aUncachedNewsLetterElements   = array("account_newsletter");
        $aUncachedMyAddressElements    = array("account_user");
        $aUncachedComparisonElements   = array("compare");
        $aUncachedWhishListElements    = array("account_noticelist");
        $aUncachedGiftRegistryElements = array("account_wishlist");
        $aUncachedListmaniaElements    = array("account_recommlist");

        $sDefaultUserAgent = null;
        $sMobileUserAgent = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3";

        return array(
                    array($sBaseUrl,                         $aCachedStartElements,            array(),                        $sDefaultUserAgent),
                    array($sCategoryWithSubcategoriesUrl,    $aCachedListElements,             array(),                        $sDefaultUserAgent),
                    array($sCategoryWithoutSubcategoriesUrl, $aCachedListElements,             array(),                        $sDefaultUserAgent),
                    array($sDetailsUrl,                      $aCachedDetailElements,           array(),                        $sDefaultUserAgent),
                    array($sCompareUrl,                      $aCachedCompareElements,          $aUncachedCompareElements,      $sDefaultUserAgent),
                    array($sAccountUrl,                      $aCachedAccountElements,          $aUncachedAccountElements,      $sDefaultUserAgent),
                    array($sOrderHistoryUrl,                 $aCachedAccountElements,          $aUncachedOrderHistoryElements, $sDefaultUserAgent),
                    array($sMyPasswordUrl,                   $aCachedAccountElements,          $aUncachedMyPasswordElements,   $sDefaultUserAgent),
                    array($sNewsLetterUrl,                   $aCachedAccountElements,          $aUncachedNewsLetterElements,   $sDefaultUserAgent),
                    array($sMyAddressUrl,                    $aCachedAccountElements,          $aUncachedMyAddressElements,    $sDefaultUserAgent),
                    array($sComparisonUrl,                   $aCachedAccountElements,          $aUncachedComparisonElements,   $sDefaultUserAgent),
                    array($sWishListUrl,                     $aCachedAccountElements,          $aUncachedWhishListElements,    $sDefaultUserAgent),
                    array($sGiftRegistryUrl,                 $aCachedAccountElements,          $aUncachedGiftRegistryElements, $sDefaultUserAgent),
                    array($sListmaniaUrl,                    $aCachedAccountElements,          $aUncachedListmaniaElements,    $sDefaultUserAgent),
                    array($s404Page,                         $aCached404Elements,              array(),                        $sDefaultUserAgent),

                    array($sBaseUrl,                         $aCachedStartElements,            array(),                        $sMobileUserAgent),
                    array($sCategoryWithSubcategoriesUrl,    $aCachedListElements,             array(),                        $sMobileUserAgent),
                    array($sCategoryWithoutSubcategoriesUrl, $aCachedListElements,             array(),                        $sMobileUserAgent),
                    array($sDetailsUrl,                      $aCachedDetailElements,           array(),                        $sMobileUserAgent),
                    array($sCompareUrl,                      $aCachedCompareElementsForMobile, $aUncachedCompareElements,      $sMobileUserAgent),
                    array($sAccountUrl,                      $aCachedAccountElementsForMobile, $aUncachedAccountElements,      $sMobileUserAgent),
                    array($sOrderHistoryUrl,                 $aCachedAccountElementsForMobile, $aUncachedOrderHistoryElements, $sMobileUserAgent),
                    array($sMyPasswordUrl,                   $aCachedAccountElementsForMobile, $aUncachedMyPasswordElements,   $sMobileUserAgent),
                    array($sNewsLetterUrl,                   $aCachedAccountElementsForMobile, $aUncachedNewsLetterElements,   $sMobileUserAgent),
                    array($sMyAddressUrl,                    $aCachedAccountElementsForMobile, $aUncachedMyAddressElements,    $sMobileUserAgent),
                    array($sComparisonUrl,                   $aCachedAccountElementsForMobile, $aUncachedComparisonElements,   $sMobileUserAgent),
                    array($sWishListUrl,                     $aCachedAccountElementsForMobile, $aUncachedWhishListElements,    $sMobileUserAgent),
                    array($sGiftRegistryUrl,                 $aCachedAccountElementsForMobile, $aUncachedGiftRegistryElements, $sMobileUserAgent),
                    array($sListmaniaUrl,                    $aCachedAccountElementsForMobile, $aUncachedListmaniaElements,    $sMobileUserAgent),
                    array($s404Page,                         $aCached404ElementsForMobile,     array(),                        $sMobileUserAgent),

                    array($sBaseUrl,                         $aCachedStartElements,            array(),                        $sDefaultUserAgent),
                    array($sCompareUrl,                      $aCachedCompareElements,          $aUncachedCompareElements,      $sDefaultUserAgent)
        );
    }

    /**
     * Check if start page is cached when called with GET.
     *
     * @param string $sPageUrl url off page to call.
     * @param array  $aCachedElements elements to check if cached id's.
     * @param array  $aNotCachedElements elements to check if not cached id's.
     *
     * @dataProvider providerPageCache_get
     */
    public function testPageCache_get( $sPageUrl, $aCachedElements, $aNotCachedElements, $sUserAgent )
    {
        if ( !MOBILE_THEME && $sUserAgent ) {
            $this->markTestSkipped( 'Mobile theme is not active.' );
        }
        $reverseProxyHelper = new ReverseProxyHelper();
        //Different cookie for different user agent, need that error message would not be shown
        $sUserAgent ? $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' ) : $reverseProxyHelper->setCookieFileName( 'rpcookiescachetestmobile' );

        // Worm up cache to generate environment key.
        $sPage = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );

        $reverseProxyHelper->createFile( 'testPageCacheForMobileUserAgent_post_page_'. preg_replace('/[^\w\-~_\.]+/u', '-', $sPageUrl) .'_01.html', $sPage );
        $sPage = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );
        $reverseProxyHelper->createFile( 'testPageCacheForMobileUserAgent_post_page_'. preg_replace('/[^\w\-~_\.]+/u', '-', $sPageUrl) .'_02.html', $sPage );
        $sPage = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );

        $sPage1 = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );
        $sPage2 = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );

        $reverseProxyHelper->createFile( 'testPageCacheForMobileUserAgent_get_page_'. preg_replace('/[^\w\-~_\.]+/u', '-', $sPageUrl) .'_0.html', $sPage );
        $reverseProxyHelper->createFile( 'testPageCacheForMobileUserAgent_get_page_'. preg_replace('/[^\w\-~_\.]+/u', '-', $sPageUrl) .'_1.html', $sPage1 );
        $reverseProxyHelper->createFile( 'testPageCacheForMobileUserAgent_get_page_'. preg_replace('/[^\w\-~_\.]+/u', '-', $sPageUrl) .'_2.html', $sPage2 );

        $this->_checkIfCached( $aCachedElements, $sPage1, $sPage2, $sPageUrl, $sUserAgent );
        $this->_checkIfNotCached( $aNotCachedElements, $sPage1, $sPage2, $sPageUrl );
    }

    /**
     * Module dataprovider.
     */
    public function providerPageCache_post()
    {
        $reverseProxyHelper = new ReverseProxyHelper();
        $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' );

        $sBaseUrl = $this->getConfigParam( 'sShopURL' );
        $sBaseSeparator = ( substr( $sBaseUrl, -1 ) != '/' ) ? "/" : "";

        $sCategoryWithSubcategoriesUrl    = $sBaseUrl . $sBaseSeparator . "Eco-Fashion/Woman/";
        $sCategoryWithoutSubcategoriesUrl = $sBaseUrl . $sBaseSeparator . "Eco-Fashion/Woman/Jeans/";
        $sDetailsUrl                      = $sBaseUrl . $sBaseSeparator . "Eco-Fashion/Woman/Jeans/Kuyichi-Jeans-Anna.html";

        $aUncachedStartElements[]  = "start";
        $aUncachedStartElements = array_merge( $aUncachedStartElements, $reverseProxyHelper->aStartWidgets );
        $aUncachedStartElementsForMobile[]  = "start";
        $aUncachedStartElementsForMobile = array_merge( $aUncachedStartElementsForMobile, $reverseProxyHelper->aStartWidgetsForMobile );

        $sDefaultUserAgent = null;
        $sMobileUserAgent = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3";

        return array(
            array( $sBaseUrl, array(), $aUncachedStartElements, $sDefaultUserAgent ),
            array( $sBaseUrl, array(), $aUncachedStartElementsForMobile, $sMobileUserAgent ),
            array( $sBaseUrl, array(), $aUncachedStartElements, $sDefaultUserAgent )
        );
    }

    /**
     * Check if start page is NOT cached when called with POST.
     *
     * @param string $sPageUrl url off page to call.
     * @param array  $aCachedElements elements to check if cached id's.
     * @param array  $aNotCachedElements elements to check if not cached id's.
     *
     * @dataProvider providerPageCache_post
     */
    public function testPageCache_post( $sPageUrl, $aCachedElements, $aNotCachedElements, $sUserAgent )
    {
        if ( !MOBILE_THEME && $sUserAgent ) {
            $this->markTestSkipped( 'Mobile theme is not active.' );
        }
        $reverseProxyHelper = new ReverseProxyHelper();
        $sUserAgent ? $reverseProxyHelper->setCookieFileName( 'rpcookiescachetest' ) : $reverseProxyHelper->setCookieFileName( 'rpcookiescachetestmobile' );

        // Worm up cache to generate environment key.
        $sPage = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );

        $sPageGet = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );
        $aParams = array();
        $sPagePost = $reverseProxyHelper->getPage( $sPageUrl, true, $aParams, $sUserAgent );

        $reverseProxyHelper->createFile( 'testPageCache_post_page_'. preg_replace( '/[^\w\-~_\.]+/u', '-', $sPageUrl ) .'_0.html', $sPage );
        $reverseProxyHelper->createFile( 'testPageCache_post_page_'. preg_replace( '/[^\w\-~_\.]+/u', '-', $sPageUrl ) .'_1.html', $sPageGet );
        $reverseProxyHelper->createFile( 'testPageCache_post_page_'. preg_replace( '/[^\w\-~_\.]+/u', '-', $sPageUrl ) .'_2.html', $sPagePost );

        $this->_checkIfCached( $aCachedElements, $sPageGet, $sPagePost, $sPageUrl, $sUserAgent );
        $this->_checkIfNotCached( $aNotCachedElements, $sPageGet, $sPagePost, $sPageUrl );

        // Cache time must be same as in first get. Lower than POST.
        $sPageGet = $reverseProxyHelper->getPage( $sPageUrl, false, null, $sUserAgent );

        $this->_checkIfCached( $aCachedElements, $sPageGet, $sPagePost, $sPageUrl, $sUserAgent );
        $this->_checkIfNotCached( $aNotCachedElements, $sPageGet, $sPagePost, $sPageUrl );
    }
}
endif;
