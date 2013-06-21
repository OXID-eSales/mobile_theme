<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link http://www.oxid-esales.com
 * @package tests
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 */


require_once 'oxidAdditionalSeleniumFunctions.php';

class Acceptance_mobileTest extends oxidAdditionalSeleniumFunctions
{

    protected function setUp($skipDemoData=false)
    {
        parent::setUp(false);
    }

    /**
     * Login to shop.
     */
    protected function doLogin()
    {
        // Go to my account page and login to it
        $this->click("link=Login");
        $this->waitForPageToLoad("30000");
        $this->type("id=loginUser", "admin");
        $this->type("id=loginPwd", "admin");
        $this->click("id=loginButton");
        $this->waitForPageToLoad("30000");
    }

    // ------------------------ Mobile  functionality ----------------------------------
    /**
     * testing all header elements;
     * @group mobile
     */
    public function testHeader( $blOpenPage = true )
    {
        if ( $blOpenPage ) {
            $this->openShop();
        }

        // Check does logo and alt  message exist in header

        // We do not check:that logo has a link to home page
        $this->assertTrue($this->isElementPresent("//a[@id='logo']/img"));
        $this->assertTrue($this->isElementPresent("//img[@alt='Shopping cart software by OXID eSales']"));

        // Check does header exist;
        $this->assertTrue($this->isElementPresent("//div[@id='header']"));
        $this->assertTrue($this->isElementPresent("css=div.headerMenu.clearfix"));

        // Search field  and search button should be visible after clicking on it
        // We do not check: that search field is only visible after clicking on search button
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-search"));
        $this->click("css=i.glyphicon-search");

        // Search field and search button
        $this->assertTrue($this->isElementPresent("id=searchParam"));
        $this->assertTrue($this->isElementPresent("//div[@id='search']/form/button"));
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-search"));

        // Check does minibasket element exist
        $this->assertTrue($this->isElementPresent("id=minibasketIcon"));
    }
    /**
     * testing all footer elements;
     * @group mobile
     */
    public function testFooter( $blOpenPage = true, $blUserLogIn = false )
    {
        if ( $blOpenPage ) {
            $this->openShop();
        }

        // Check does footer exist
        $this->assertTrue($this->isElementPresent("id=footer"));
        $this->assertTrue($this->isElementPresent("id=footerServices"));
        $this->assertTrue($this->isElementPresent("id=footerInformation"));

        // Check does footer navigation list elements exist
        $this->assertTrue($this->isElementPresent("link=My Account"));
        $this->assertTrue($this->isElementPresent("link=Home"));
        if ( $blUserLogIn ) {
            $this->assertTrue($this->isElementPresent("link=Logout"));
        } else {
            $this->assertTrue($this->isElementPresent("link=Login"));
        }
        $this->assertTrue($this->isElementPresent("link=Regular display"));
        $this->assertTrue($this->isElementPresent("link=Contact"));
        $this->assertTrue($this->isElementPresent("link=About Us"));
        $this->assertTrue($this->isElementPresent("link=Privacy Policy"));
        $this->assertTrue($this->isElementPresent("link=Terms and Conditions"));
    }

    /**
     * Test if footer looks ok when user is logged in.
     * @param string $sURL shop url to test on.
     */
    public function testLoginUserFooter( $sURL = null )
    {
        if ( !$sURL ) {
            $this->openShop();
        }
        $this->doLogin();
        $this->testFooter( $sURL, true );
    }

    /**
     * testing all start page elements;
     * @group mobile
     */
    public function testStartPage()
    {
        $this->open( shopURL . "en/home/" );

        //check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Need add cookie note checking
        // Check does banner element exist;
        $this->assertTrue($this->isElementPresent("class=carousel slide"));
        $this->assertTrue($this->isVisible("css=img[alt=\"Banner 1\"]"));
        // Check does baner left button and right button exist;
        $this->assertTrue($this->isElementPresent("css=a.carousel-control.right"));
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-left"));
        $this->click("css=a.carousel-control.right");
        $this->assertFalse($this->isVisible("css=img[alt=\"Banner 1\"]"));
        $this->assertTrue($this->isVisible("css=img[alt=\"Banner 2\"]"));

        // Check category links.
        $this->assertTrue($this->isElementPresent("link=Kiteboarding"));
        $this->assertTrue($this->isElementPresent("link=Wakeboarding"));
        $this->assertTrue($this->isElementPresent("link=Gear"));
        $this->assertTrue($this->isElementPresent("link=Special Offers"));
        $this->assertTrue($this->isElementPresent("link=Downloads"));

        // Check does category list right button exist;
        $this->assertTrue($this->isElementPresent("css=li > a > i.glyphicon-chevron-right"));
    }

    /**
     * testing all category list page elements;
     * @group mobile
     */

    public function testCategoryList()
    {
        $this->open( shopURL . "en/Kiteboarding/" );

        //check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        $this->open( shopURL . "en/home/" );

        // Check does category tree exist;
        $this->assertTrue($this->isElementPresent("id=cat_list"));

        // Go to subcategory;
        $this->click("css=span");
        $this->waitForPageToLoad("30000");

        // Check does back button exist;
        $this->assertTrue($this->isElementPresent("css=span"));

        // Check does left button near back button exist;
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-left"));

        // Check does all category in category tree exist;
        $this->assertTrue($this->isElementPresent("css=#moreSubCat_1 > span"));
        $this->assertTrue($this->isElementPresent("css=#moreSubCat_2 > span"));
        $this->assertTrue($this->isElementPresent("css=#moreSubCat_3 > span"));
        $this->assertTrue($this->isElementPresent("css=#moreSubCat_4 > span"));

        // Go to subcategory "kites";
        $this->click("css=#moreSubCat_1 > span");
        $this->waitForPageToLoad("30000");

        // Check does back button exist;
        $this->assertTrue($this->isElementPresent("css=span"));

        // Check does left button near back button exist;
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-left"));

        // Check does subcategory name exist;
        $this->assertTrue($this->isElementPresent("css=h1"));

        // Check does "sort by exist";
        $this->assertTrue($this->isElementPresent("css=label.sort-title"));

        // Check does sorting options field exist;
        $this->assertTrue($this->isElementPresent("css=#sortItems > div.dropdown > div.dropdown-toggle"));

        // Check does product list exist;
        $this->assertTrue($this->isElementPresent("css=h4.media-heading"));

        // Check does image near product exist;
        $this->assertTrue($this->isElementPresent("css=img[alt=\"Kite CORE GTS \"]"));

        // Check does product price exist;
        $this->assertTrue($this->isElementPresent("css=#productPrice_productList_1 > span"));

        // Check does previous price, which is crossed out exist;
        $this->assertTrue($this->isElementPresent("//ul[@id='productList']/li/form/div[2]/p/span/del"));

        // Check does pages and button "next" exist;
        $this->assertTrue($this->isElementPresent("css=div.pagination-container"));
        $this->assertTrue($this->isElementPresent("link=1"));
        $this->assertTrue($this->isElementPresent("link=2"));
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-right"));

        // Check does  filter and sorting exist;
        $this->assertTrue($this->isElementPresent("//div[@id='filterBoxClosed']/input"));

        // Open filter and sorting;
        $this->click("css=input.btn");

        // Check does filter and sorting still exist;
        $this->assertTrue($this->isElementPresent("css=span.filter-open-title"));

        // Check does close "filter and sorting" button exist;
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-remove"));

        // Check does title area of application exist;
        $this->assertTrue($this->isElementPresent("//form[@id='filterList']/label[1]"));

        // Check does "area of application" filter exist;
        $this->assertTrue($this->isElementPresent("css=div.dropdown-toggle > span"));

        // Check does title"included in delivery" exist;
        $this->assertTrue($this->isElementPresent("//form[@id='filterList']/label[2]"));

        // Check does "included in delivery filter exist;
        $this->assertTrue($this->isElementPresent("//form[@id='filterList']/div[2]/div/span"));
    }

    /**
     * testing all start page elements
     * @group mobile
     */

    public function testDetailPage()
    {
        // Go to product detail page
        $this->open( shopURL . "en/Gear/Fashion/For-Her/Jeans/Kuyichi-Jeans-SUGAR.html" );

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does previous button near back exist
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-left"));

        // Check does back button exist
        $this->assertTrue($this->isElementPresent("//div[@id='details']/ul/li/a/span"));

        // Check does add to wish list "star" exist
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-star"));

        // Check does product image exist
        $this->assertTrue($this->isElementPresent("css=img[alt=\"Kuyichi Jeans SUGAR \"]"));

        // Check does previous button for image exist
        $this->assertTrue($this->isElementPresent("css=a.carousel-control.left > i.glyphicon-chevron-left"));

        // Check does next button for image exist
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-right"));

        // Check does  "incl. VAT, plus shipping" exist
        $this->assertTrue($this->isElementPresent("css=div.product-delivery-info > a"));

        // Check does size variant selection exist
        $this->assertTrue($this->isElementPresent("id=dLabel"));

        // Check does color variant selection exist
        $this->assertTrue($this->isElementPresent("//div[@id='variants']/div[2]/div"));

        // Check does washing variant selection exist
        $this->assertTrue($this->isElementPresent("//div[@id='variants']/div[3]/div"));

        // Check does "choose variant"message exist
        $this->assertTrue($this->isElementPresent("css=p.product-variants-message"));

        // Check does "add to cart" button exist
        $this->assertTrue($this->isElementPresent("css=div.tobasketFunction.clear"));

        // Check does "more details" button exist
        $this->assertTrue($this->isElementPresent("css=div.product-description-truncated > i.glyphicon-chevron-down"));

        // Open full description;
        $this->click("css=i.glyphicon-chevron-down");

        // Check does detail about product exist
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-up"));

        // check does full description close button exist
        $this->assertTrue($this->isElementPresent("css=div.product-description-full > p > #goog-gtc-unit-12 > span.goog-gtc-translatable.goog-gtc-from-human"));

    }

    /**
     * testing all start page elements
     * @group mobile
     */

    public function testContactPage()
    {
        $this->open( shopURL . "en/contact/" );
        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check  does label "you company name exist"
        $this->assertTrue($this->isElementPresent("//div[@id='page']/div/h1"));

        // Check does company info with all contacts exist
        $this->assertTrue($this->isElementPresent("//div[@id='contacts']/ul/li"));

        // Check does label Mr exist
        $this->assertTrue($this->isElementPresent("//div[@id='contacts']/form/ul/li/label"));

        // Check does label Mrs exist
        $this->assertTrue($this->isElementPresent("//div[@id='contacts']/form/ul/li/label[2]"));

        // Check does checkbox Mr exist
        $this->assertTrue($this->isElementPresent("id=mr_editval[oxuser__oxsal]"));

        // Check does checkbox Mrs exist
        $this->assertTrue($this->isElementPresent("id=mrs_editval[oxuser__oxsal]"));

        // Check does all required field exist
        $this->assertTrue($this->isElementPresent("name=editval[oxuser__oxfname]"));
        $this->assertTrue($this->isElementPresent("name=editval[oxuser__oxlname]"));
        $this->assertTrue($this->isElementPresent("id=contactEmail"));
        $this->assertTrue($this->isElementPresent("name=c_subject"));
        $this->assertTrue($this->isElementPresent("name=c_subject"));
        $this->assertTrue($this->isElementPresent("//div[@id='contacts']/form/ul/li[6]/label"));
        $this->assertTrue($this->isElementPresent("name=c_message"));

        // Check does verification code label exist
        $this->assertTrue($this->isElementPresent("css=label.req"));

        // Check does verification code exist
        $this->assertTrue($this->isElementPresent("css=li.verify > img"));
        $this->assertTrue($this->isElementPresent("name=c_mac"));

        // Check does send button exist
        $this->assertTrue($this->isElementPresent("//input[@value='Send']"));
    }

    /**
     * testing all billing and shipping settings page elements
     * @group mobile
     */
    public function testBillingAndShippingSettings()
    {
        $this->open( shopURL . "en/my-account" );

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Go to my account page and login to it
        $this->doLogin();
        $this->click("link=My Account");

        // Go to billing and shipping settings
        $this->click("css=#linkAccountBillship > span");
        $this->waitForPageToLoad("30000");

        // Check does  "billing and shipping settings" label exist
        $this->assertTrue($this->isElementPresent("id=addressSettingsHeader"));

        // Check does  billing address label exist
        $this->assertTrue($this->isElementPresent("css=h3.block-head"));

        // Check does "change" button exist
        $this->assertTrue($this->isElementPresent("id=userChangeAddress"));

        // Check does address  exist
        $this->assertTrue($this->isElementPresent("//ul[@id='addressText']/li"));

        // Check does " shipping address" label exist
        $this->assertTrue($this->isElementPresent("id=addShippingAddress"));

        // Check does "send to billing address" label exist
        $this->assertTrue($this->isElementPresent("css=div.collumn > ul > li > label"));

        // Check does "send billing address" checkbox   exist
        $this->assertTrue($this->isElementPresent("id=showShipAddress"));

        // Check does "save" button exist
        $this->assertTrue($this->isElementPresent("id=accUserSaveTop"));

        // Press "change" button
        $this->click("id=userChangeAddress");

        // Check does "billing address" label exist
        $this->assertTrue($this->isElementPresent("id=addressSettingsHeader"));

        // Check does "e-mail" address exist
        $this->assertTrue($this->isElementPresent("//ul[@id='addressForm']/li/label"));

        // Check does all imput field exist
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxusername]"));
        $this->assertTrue($this->isElementPresent("css=span.js-oxError_email"));
        $this->assertTrue($this->isElementPresent("//ul[@id='addressForm']/li[3]/label"));
        $this->assertTrue($this->isElementPresent("//ul[@id='addressForm']/li[3]/label[2]"));
        $this->assertTrue($this->isElementPresent("id=mr_invadr[oxuser__oxsal]"));
        $this->assertTrue($this->isElementPresent("id=mrs_invadr[oxuser__oxsal]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxfname]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxlname]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxcompany]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxaddinfo]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxstreet]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxstreetnr]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxzip]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxcity]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxustid]"));
        $this->assertTrue($this->isElementPresent("css=div.dropdown-toggle"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxfon]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxfax]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxmobfon]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxprivfon]"));
    }

    /**
     * testing user 2nd step when user is not logged in  page elements
     * @group mobile
     */
    public function testSecondStepNotLoginUser()
    {
        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIXX.html" );

        // Add product to the basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        // Go to 2nd step
        $this->click("css=#btnNextStepBottom > form.form > input.btn.nextStep");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does step line on top of the page exist
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.active  > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.active  > a > span.step-name"));
        $this->assertTrue($this->isElementPresent("css=li.step3 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step4 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-number.last"));

        // Check does imput field for login name and password exists
        $this->assertTrue($this->isElementPresent("name=lgn_usr"));
        $this->assertTrue($this->isElementPresent("name=lgn_pwd"));
        $this->assertTrue($this->isElementPresent("css=span.js-oxError_notEmpty"));
        $this->assertTrue($this->isElementPresent("//input[@value='Open account']"));
        $this->assertTrue($this->isElementPresent("//input[@value='Login']"));
        $this->assertTrue($this->isElementPresent("link=exact:Forgot password?"));
        $this->assertTrue($this->isElementPresent("//input[@value='Purchase without Registration']"));
    }

    /**
     * testing all start page elements
     * @group mobile
     */
    public function testSecondStepLoginUser()
    {
        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIXX.html" );

        // Add product to the basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        // Go to 2nd step
        $this->click("css=#btnNextStepBottom > form.form > input.btn.nextStep");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does  step line with all steps exist
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.active  > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.active  > a > span.step-name"));
        $this->assertTrue($this->isElementPresent("css=li.step3"));
        $this->assertTrue($this->isElementPresent("css=li.step4 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-number.last"));

        // Check does billing address label exist
        $this->assertTrue($this->isElementPresent("css=h3"));

        // Check does "change address" button exist
        $this->assertTrue($this->isElementPresent("id=userChangeAddress"));

        // Check does address exist
        $this->assertTrue($this->isElementPresent("css=#addressText > li"));

        // Check does "send to billing address" label exist
        $this->assertTrue($this->isElementPresent("css=div.form > label"));

        // Check does "send to billing address"  checkbox exist
        $this->assertTrue($this->isElementPresent("id=showShipAddress"));

        // Check does  remark field exist
        $this->assertTrue($this->isElementPresent("id=orderRemark"));

        // Check does "continue" button exist
        $this->assertTrue($this->isElementPresent("id=userNextStepBottom"));

        // Check does "previous step" button exist
        $this->assertTrue($this->isElementPresent("css=input.btn.previous"));
    }

    /**
     * testing purchase without registration page all elements
     * @group mobile
     */
    public function testPurchaseWithoutRegistration()
    {
        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIXX.html" );

        // Add product to the basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        // Go to 2nd step;
        $this->click("css=#btnNextStepBottom > form.form > input.btn.nextStep");
        $this->waitForPageToLoad("30000");

        // Go to "purchase without registration" page;
        $this->click("css=#optionNoRegistration > form.form > input.btn");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does step line exist with all steps;
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.active  > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.active  > a > span.step-name"));
        $this->assertTrue($this->isElementPresent("css=li.step3"));
        $this->assertTrue($this->isElementPresent("css=li.step4 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-number.last"));


        // Check does Customer information label exist;
        $this->assertTrue($this->isElementPresent("css=h3.block-head"));

        // Check does label and imput field for email address exist;
        $this->assertTrue($this->isElementPresent("id=userLoginName"));

        // Check  does warning message "Specify a value for this required field" exist;
        $this->assertTrue($this->isElementPresent("css=span.js-oxError_notEmpty"));

        // Check does "Billing Address" label exist;
        $this->assertTrue($this->isElementPresent("//h3[2]"));

        // Check does Mr and  MRs check boxes with labels exist;
        $this->assertTrue($this->isElementPresent("id=mr_invadr[oxuser__oxsal]"));
        $this->assertTrue($this->isElementPresent("id=mrs_invadr[oxuser__oxsal]"));
        $this->assertTrue($this->isElementPresent("//ul[2]/li/label"));
        $this->assertTrue($this->isElementPresent("//label[2]"));

        // Check does all imput elements are in page;
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxfname]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxlname]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxcompany]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxaddinfo]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxstreet]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxzip]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxcity]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxstreetnr]"));
        $this->assertTrue($this->isElementPresent("//div[@id='invCountry']/div"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxfon]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxfax]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxmobfon]"));
        $this->assertTrue($this->isElementPresent("name=invadr[oxuser__oxprivfon]"));

        // Check does birthday field exist;
        $this->assertTrue($this->isElementPresent("css=li.oxDate > label"));
        $this->assertTrue($this->isElementPresent("css=#month > button.btn"));
        $this->assertTrue($this->isElementPresent("css=#day > button.btn"));
        $this->assertTrue($this->isElementPresent("css=#year > button.btn"));
        $this->assertTrue($this->isElementPresent("xpath=(//button[@type='button'])[2]"));
        $this->assertTrue($this->isElementPresent("xpath=(//button[@type='button'])[4]"));
        $this->assertTrue($this->isElementPresent("xpath=(//button[@type='button'])[6]"));

        // Check does warning message exist;
        $this->assertTrue($this->isElementPresent("css=li.alert.alert-block"));

        // Check does "Shipping address" label and check box exist;
        $this->assertTrue($this->isElementPresent("//h3[3]"));

        // Check does " what I wanted to say" field with label exist;
        $this->assertTrue($this->isElementPresent("//li[2]/label"));
        $this->assertTrue($this->isElementPresent("id=orderRemark"));

        // Check does "continue" button exist;
        $this->assertTrue($this->isElementPresent("id=userNextStepBottom"));

        // Check does "previous step" button exist;
        $this->assertTrue($this->isElementPresent("id=userBackStepBottom"));

    }

    /**
     * testing all start page elements
     * @group mobile
     */
    public function testSearchListMobile()
    {
        $this->open( shopURL . "en/home/" );

        // Open search field
        $this->click("//div[@id='header']/div/div/a");

        // Add search keyword
        $this->type("id=searchParam", "kite");

        // Press search button
        $this->click("css=button.btn.search-btn");
        $this->waitForPageToLoad("30000");
        $this->click("css=i.glyphicon-search");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does "24 Hits for "kite" " exist
        $this->assertTrue($this->isElementPresent("css=h1.pageHead"));

        // Check does sort by exist
        $this->assertTrue($this->isElementPresent("css=label.sort-title"));

        // Check does  sorting field exist
        $this->assertTrue($this->isElementPresent("//div[@id='sortItems']/div/div/span"));

        // Check does 1st product exist
        $this->assertTrue($this->isElementPresent("css=p.article-list-price"));

        // Check does last product in the list exist
        $this->assertTrue($this->isElementPresent("//ul[@id='searchList']/li[10]/form/div[2]/p"));

        // Ckeck does  page number 1 exist
        $this->assertTrue($this->isElementPresent("link=1"));

        // Check does next page  button exist
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-right"));
    }

    /**
     * testing user first step when user is not logged in  page elements
     * @group mobile
     */
    public function testFirstStepNotLogInUser()
    {
 /*   //Commented because of bug #5227
       // Go to product "3570" detail page
        $this->open( shopURL . "en/Gear/Fashion/For-Her/Jeans/Kuyichi-Jeans-ANNA.html" );

        // Choose variants
        $this->click("css=div.dropdown-toggle");
        $this->click("link=W 30/L 30");
        $this->click("css=div.dropdown.open");
        $this->click("css=div.dropdown-toggle");
        $this->click("link=Smoke Gray");
        $this->waitForPageToLoad("30000");

        // Add product to basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");
*/
        // Go to product "1205" detail page
        $this->open( shopURL . "en/Special-Offers/Transport-container-BARREL.html" );
        $this->type("id=persistentParam", "TEST");

        // Add product to cart
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Add 1205 product to cart
        $this->open( shopURL . "en/Special-Offers/Transport-container-BARREL.html" );
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does  step line with all steps exist
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-name"));
        $this->assertTrue($this->isElementPresent("css=li.step2 > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step3 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step4 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-number.last"));

        // Check does exist 01 CART content
        $this->assertTrue($this->isElementPresent("css=div.content"));
        $this->assertTrue($this->isElementPresent("//tr[@id='basketGrandTotal']/th"));

        // Check does exist button CONTINUE
        $this->assertTrue($this->isElementPresent("css=input.btn.nextStep"));
        $this->assertTrue($this->isElementPresent("css=#btnNextStepBottom > form.form > input.btn.nextStep"));

        // Check does exist remove button
        $this->assertTrue($this->isElementPresent("name=removeBtn"));

        // Check does exist element product title link
        $this->assertTrue($this->isElementPresent("css=a.media-heading-link"));

        // Check does exist element of variant
        $this->assertTrue($this->isElementPresent("css=p.attributes"));

        // Check does exist quantity input fields
        $this->assertTrue($this->isElementPresent("id=am_1"));
        $this->assertTrue($this->isElementPresent("id=am_2"));
        $this->assertTrue($this->isElementPresent("//li[@id='cartItem_1']/div/div/input[4]"));

        // Check does exist element for VAT
        $this->assertTrue($this->isElementPresent("css=span.vat-percent"));

        // Check does exist element for main price
        $this->assertTrue($this->isElementPresent("css=span.main-price"));

        // Check does exist  input field for persParam
        $this->assertTrue($this->isElementPresent("//li[@id='cartItem_2']/div/p[2]/input"));

        // Check does exist label element
        $this->assertTrue($this->isElementPresent("css=label.persParamLabel"));
/*
 *  //Commented because of bug #5227
        // Check does exist element of attribute
        $this->assertTrue($this->isElementPresent("css=#cartItem_3 > div.media-body > p.attributes"));
        $this->assertTrue($this->isElementPresent("//li[@id='cartItem_3']/div/p"));
        $this->assertTrue($this->isElementPresent("css=#cartItem_2 > div.media-body"));
*/
        // Check does exist label Update
        $this->assertTrue($this->isElementPresent("//div[@id='basketFn']/label"));

        // Check does exist button Basket update
        $this->assertTrue($this->isElementPresent("id=basketFn"));
        $this->assertTrue($this->isElementPresent("id=basketUpdate"));

        // Check does exist label element Total Products (net)
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr/th"));

        // Check does exist label plus var 19 Amount
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr[2]/th"));

        // Check does exist label "Total product (gross)
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr[3]/th"));
        $this->assertTrue($this->isElementPresent("id=basketTotalProductsNetto"));
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr[2]/td"));
        $this->assertTrue($this->isElementPresent("id=basketTotalProductsGross"));
        $this->assertTrue($this->isElementPresent("css=#basketGrandTotal > td"));
        $this->assertTrue($this->isElementPresent("//tr[@id='basketGrandTotal']/th/strong"));

        // Check does exist all checkout steps at the top
        $this->assertTrue($this->isElementPresent("css=ul.checkout-steps."));
    }

    /**
     * testing user first step when user is logged in  page elements
     * @group mobile
     */
    public function testFirstStepLoginUser()
    {
        $this->open( shopURL . "en/home/" );
        $this->doLogin();

        /*   //Commented because of bug #5227
         // Go to product "3570" detail page
          $this->open( shopURL . "en/Gear/Fashion/For-Her/Jeans/Kuyichi-Jeans-ANNA.html" );

          // Choose variants
          $this->click("css=div.dropdown-toggle");
          $this->click("link=W 30/L 30");
          $this->click("css=div.dropdown.open");
          $this->click("css=div.dropdown-toggle");
          $this->click("link=Smoke Gray");
          $this->waitForPageToLoad("30000");

          // Add product to basket
          $this->click("id=toBasket");
          $this->waitForPageToLoad("30000");
  */
        // Go to product "1205" detail page
        $this->open( shopURL . "en/Special-Offers/Transport-container-BARREL.html" );
        $this->type("id=persistentParam", "TEST");

        // Add product to cart
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Add 1205 product to cart
        $this->open( shopURL . "en/Special-Offers/Transport-container-BARREL.html" );
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does  step line with all steps exist
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-name"));
        $this->assertTrue($this->isElementPresent("css=li.step2 > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step3 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step4 > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=span.step-number.last"));

        // Check does exist 01 CART content
        $this->assertTrue($this->isElementPresent("css=div.content"));
        $this->assertTrue($this->isElementPresent("//tr[@id='basketGrandTotal']/th"));

        // Check does exist button CONTINUE
        $this->assertTrue($this->isElementPresent("css=input.btn.nextStep"));
        $this->assertTrue($this->isElementPresent("css=#btnNextStepBottom > form.form > input.btn.nextStep"));

        // Check does exist remove button
        $this->assertTrue($this->isElementPresent("name=removeBtn"));

        // Check does exist element product title link
        $this->assertTrue($this->isElementPresent("css=a.media-heading-link"));

        // Check does exist element of variant
        $this->assertTrue($this->isElementPresent("css=p.attributes"));

        // Check does exist quantity input fields
        $this->assertTrue($this->isElementPresent("id=am_1"));
        $this->assertTrue($this->isElementPresent("id=am_2"));
        $this->assertTrue($this->isElementPresent("//li[@id='cartItem_1']/div/div/input[4]"));

        // Check does exist element for VAT
        $this->assertTrue($this->isElementPresent("css=span.vat-percent"));

        // Check does exist element for main price
        $this->assertTrue($this->isElementPresent("css=span.main-price"));

        // Check does exist  input field for persParam
        $this->assertTrue($this->isElementPresent("//li[@id='cartItem_2']/div/p[2]/input"));

        // Check does exist label element
        $this->assertTrue($this->isElementPresent("css=label.persParamLabel"));
        /*
         *  //Commented because of bug #5227
                // Check does exist element of attribute
                $this->assertTrue($this->isElementPresent("css=#cartItem_3 > div.media-body > p.attributes"));
                $this->assertTrue($this->isElementPresent("//li[@id='cartItem_3']/div/p"));
                $this->assertTrue($this->isElementPresent("css=#cartItem_2 > div.media-body"));
        */
        // Check does exist label Update
        $this->assertTrue($this->isElementPresent("//div[@id='basketFn']/label"));

        // Check does exist button Basket update
        $this->assertTrue($this->isElementPresent("id=basketFn"));
        $this->assertTrue($this->isElementPresent("id=basketUpdate"));

        // Check does exist label element Total Products (net)
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr/th"));

        // Check does exist label plus var 19 Amount
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr[2]/th"));

        // Check does exist label "Total product (gross)
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr[3]/th"));
        $this->assertTrue($this->isElementPresent("id=basketTotalProductsNetto"));
        $this->assertTrue($this->isElementPresent("//table[@id='basketSummary']/tbody/tr[2]/td"));
        $this->assertTrue($this->isElementPresent("id=basketTotalProductsGross"));
        $this->assertTrue($this->isElementPresent("css=#basketGrandTotal > td"));
        $this->assertTrue($this->isElementPresent("//tr[@id='basketGrandTotal']/th/strong"));

        // Check does exist all checkout steps at the top
        $this->assertTrue($this->isElementPresent("css=ul.checkout-steps."));
    }

    /**
     * testing all wish list page elements
     * @group mobile
     */
    public function testWishList()
    {
        $this->open( shopURL . "en/home/" );
        $this->doLogin();

        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIXX.html" );

        // Click on the button "Start"
        $this->click("css=i.glyphicon-star");

        // Check does exist present info message "Please login to access Wish List."
        $this->assertTrue($this->isElementPresent("//div[@id='detailsMain']/div/div/span"));

        // Check does exist info message"Please login to access Wish List." border
        $this->assertTrue($this->isElementPresent("//div[@id='detailsMain']/div/div"));
        $this->click("css=i.glyphicon-star");

        // Check does exist border with text "Success"
        $this->assertTrue($this->isElementPresent("//div[@id='detailsMain']/div/div/span"));

        // Go to My account page
        $this->click("link=My Account");
        $this->waitForPageToLoad("30000");

        // Go to " My wish list" page
        $this->click("//div[@id='cat_list']/ul/li[6]/a/span");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does exist header "MY WISH LIST"
        $this->assertTrue($this->isElementPresent("css=h1.pageHead"));

        // Check does exist remove button
        $this->assertTrue($this->isElementPresent("name=wishlist_remove_button"));

        // Check there are added product in to wish list
        $this->assertTrue($this->isElementPresent("//ul[@id='noticelistProductList']/li/form/div[2]"));

        // Remove product from wish list
        $this->click("name=wishlist_remove_button");
        $this->waitForPageToLoad("30000");
/*
 *  //Commented because of bug #5227
        // Check does exist error message "Your Wish List is empty. "
      //  $this->assertTrue($this->isElementPresent("css=div.alert.alert-error"));

        // Check does exist error message content
        $this->assertTrue($this->isElementPresent("css=div.content"));
*/
    }

    /**
     * testing user 4 basket step when user is logged in page elements
     * @group mobile
     */
    public function test4BasketStep()
    {
        $this->open( shopURL . "en/home/" );
        $this->doLogin();

        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIXX.html" );
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        // Go to 2nd basket step
        $this->click("id=userNextStepBottom");
        $this->waitForPageToLoad("30000");

        // Go to 3 basket step
        $this->click("id=userNextStepBottom");
        $this->waitForPageToLoad("30000");
sleep(20);
        // Go to 4 basket step
        $this->click("id=paymentNextStepBottom");
        $this->waitForPageToLoad("30000");

        // Check there are 4 basket steps marked as active
        $this->assertTrue($this->isElementPresent("css=li.step4.active  > span.step-name"));

        // Check does exist header "Terms and Conditions and Right to Withdrawal"
        $this->assertTrue($this->isElementPresent("css=div.agb"));
        $this->assertTrue($this->isElementPresent("css=h3.heading.section-heading > span"));

        // Check does exist link "right of withdrawal"
        $this->assertTrue($this->isElementPresent("link=right of withdrawal"));
        $this->assertTrue($this->isElementPresent("css=#test_OrderOpenWithdrawalBottom"));

        // Check does exist link to "terms and conditions" page
        $this->assertTrue($this->isElementPresent("css=a.fontunderline"));
        $this->assertTrue($this->isElementPresent("link=terms and conditions"));

        // Check does exist heading section
        $this->assertTrue($this->isElementPresent("css=form.form > h3.heading.section-heading > span"));
        $this->assertTrue($this->isElementPresent("//div[@id='orderAddress']/form/h3/span"));

        // Check does exist button EDIT billing address
        $this->assertTrue($this->isElementPresent("//button[@type='submit']"));

        // Check does exist  Billing address
        $this->assertTrue($this->isElementPresent("//div[@id='orderAddress']/dl/dd"));

        // Check does exist Billing address title
        $this->assertTrue($this->isElementPresent("//div[@id='orderAddress']/dl/dt"));

        // Check does exist SHIPPING CARRIER title
        $this->assertTrue($this->isElementPresent("css=#orderShipping > form.form > h3.heading.section-heading"));

        // Check does exist Shipping method "Standard"
        $this->assertTrue($this->isElementPresent("//div[@id='orderShipping']"));

        // Check does exist payment method information
        $this->assertTrue($this->isElementPresent("css=#orderPayment > form.form > h3.heading.section-heading"));
        $this->assertTrue($this->isElementPresent("id=orderPayment"));

        // Check does exist payment EDIT button
        $this->assertTrue($this->isElementPresent("//div[@id='orderPayment']/form/h3/button"));

        // Check does exist button edit shipping method
        $this->assertTrue($this->isElementPresent("//div[@id='orderEditCart']/form/h3/button"));

        // Check does exist Cart information
        $this->assertTrue($this->isElementPresent("//div[@id='orderEditCart']/form/h3/span"));

        // Check does exist product image
        // Check does exist link to product
        $this->assertTrue($this->isElementPresent("css=img[alt=\"Harness MADTRIXX\"]"));
        $this->assertTrue($this->isElementPresent("link=Harness MADTRIXX"));

        // Check does exist all element related with button "ORDER NOW"
        $this->assertTrue($this->isElementPresent("css=li > button.btn"));
        $this->assertTrue($this->isElementPresent("//form[@id='orderConfirmAgbBottom']/ul/li/button"));

        // Check does exist all basket summary
        $this->assertTrue($this->isElementPresent("id=basketGrandTotal"));
        $this->assertTrue($this->isElementPresent("id=basketTotalProductsNetto"));
        $this->assertTrue($this->isElementPresent("id=basketSummary"));
        $this->assertTrue($this->isElementPresent("id=basketTotalProductsGross"));
        $this->assertTrue($this->isElementPresent("id=basketDeliveryGross"));
        $this->assertTrue($this->isElementPresent("id=basketPaymentNetto"));

        // Check does exist all (1,2,3,4, ok) steps exist
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.passed  > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step3.passed  > a > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step4.active  > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step4.active  > span.step-name"));
        $this->assertTrue($this->isElementPresent("css=span.step-number.last"));

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );
    }

    /**
     * testing 5th basket step page  all elements
     * @group mobile
     */
    public function test5BasketStep()
    {
        $this->open( shopURL . "en/home/" );
        $this->doLogin();

        $this->open( shopURL . "en/Special-Offers/Transport-container-BARREL.html");

        // Add product to basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        // Go to 2nd basket step
        $this->click("//div[@id='btnNextStepBottom']/form/input[4]");
        $this->waitForPageToLoad("30000");

        // Go to 03 basket step
        $this->click("id=userNextStepBottom");
        $this->waitForPageToLoad("30000");

        sleep(20);
        // Go to 04 basket step
        $this->click("id=paymentNextStepBottom");
        $this->waitForPageToLoad("30000");

        // Click button Continue
        $this->click("//form[@id='orderConfirmAgbBottom']/ul/li/button");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does link back to Start page exist;
        $this->assertTrue($this->isElementPresent("id=backToShop"));

        // Check does exist link to  order history
        $this->assertTrue($this->isElementPresent("id=orderHistory"));

        // Check does thank you page content exist in page;
        $this->assertTrue($this->isElementPresent("//div[@id='thankyouPage']"));

        // Check does all (1,2,3,4,ok) basket step exist
        $this->assertTrue($this->isElementPresent("css=span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step2.passed  > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step3.passed  > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step4.passed  > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step5.active > span.step-number"));
        $this->assertTrue($this->isElementPresent("css=li.step5.active > span.step-name"));

    }

    /**
     * testing all "change password" page elements
     * @group mobile
     */
    public function testChangePassword()
    {
        $this->open( shopURL . "en/home/");
        $this->doLogin();
        $this->click("//a[@id='linkAccountPassword']/span");
        $this->waitForPageToLoad("30000");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist the page "CHANGE PASSWORD" header
        $this->assertTrue($this->isElementPresent("//h1[@id='personalSettingsHeader']"));

        // Check does exist content
        $this->assertTrue($this->isElementPresent("css=div.content"));
        $this->assertTrue($this->isElementPresent("css=label"));

        // Check does exist input fields "Old password"
        $this->assertTrue($this->isElementPresent("id=passwordOld"));

        // Check does exist label name "New password:"
        $this->assertTrue($this->isElementPresent("//li[2]/label"));

        // heck does exist input field "New password"
        $this->assertTrue($this->isElementPresent("id=passwordNew"));

        // Check label"Confirm password"
        $this->assertTrue($this->isElementPresent("//li[3]/label"));
        $this->click("id=passwordNewConfirm");

        // Check input field "password new confirm"
        $this->assertTrue($this->isElementPresent("id=passwordNewConfirm"));

        // Check button "SAVE"
        $this->assertTrue($this->isElementPresent("id=savePass"));

        // Check all messages "Specify a value for this required field"
        $this->assertTrue($this->isElementPresent("css=span.js-oxError_notEmpty"));
        $this->assertTrue($this->isElementPresent("//li[2]/p/span"));
        $this->assertTrue($this->isElementPresent("//li[3]/p/span"));
        $this->assertTrue($this->isElementPresent("//div[@id='page']/div/div/form/ul/li[3]/p/span"));
    }

    /**
     * testing all Error404 page elements
     * @group mobile
     */
    public function testError404()
    {
        // Open product with incorrect link
        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIX.html" );

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist Error header
        $this->assertTrue($this->isElementPresent("css=h1.pageHead"));

        // Check does exist page content
        $this->assertTrue($this->isElementPresent("css=div.content"));

        // Check does exist element bold "as bold is marked text en/Kiteboarding/Harnesses/Harness-MADTRIX.html'"
        $this->assertTrue($this->isElementPresent("css=strong"));

        // Check does exist Full information related with error 404
        $this->assertTrue($this->isElementPresent("css=div.alert.alert-error"));
    }

    /**
     * testing all forgot password page elements
     * @group mobile
     */
    public function testForgotPassword()
    {
        $this->open( shopURL . "en/home/" );

        // Open Login page
        $this->click("link=Login");
        $this->waitForPageToLoad("30000");

        // Click on Forgot password link
        $this->click("//a[@id='forgotPasswordLink']");
        $this->waitForPageToLoad("30000");

        // Check does exist title"FORGOT PASSWORD"
        $this->assertTrue($this->isElementPresent("css=h1.pageHead"));

        // Check does exist forgot password content
        $this->assertTrue($this->isElementPresent("css=div.content"));

        // Check label  "You e-mail Address:" is present
        $this->assertTrue($this->isElementPresent("css=label"));

        // Check does exist input label "E-mail address"
        $this->assertTrue($this->isElementPresent("id=forgotPasswordUserLoginName"));

        // Check does exist button with value Request Password
        $this->assertTrue($this->isElementPresent("//input[@value='Request Password']"));

        // Check does exist content ellement
        $this->assertTrue($this->isElementPresent("css=div.content"));

        // Check element is present for text"When you click on 'Request Password', you'll be sent an e-mail with instructions how to set up a new password. "
        $this->assertTrue($this->isElementPresent("css=div.content > p"));
        $this->type("id=forgotPasswordUserLoginName", "birute_test@nfq.lt");
        $this->click("css=input.btn");
        $this->waitForPageToLoad("30000");

        // Check does exist error message "  The e-mail address you have entered is invalid. Please enter a valid e-mail address."
        $this->assertTrue($this->isElementPresent("//div[@id='page']/div/div/p"));
        $this->assertTrue($this->isElementPresent("css=div.alert.alert-error"));
        $this->type("id=forgotPasswordUserLoginName", "admin");

        // Check does exist error "Please enter a valid e-mail address"
        $this->assertTrue($this->isElementPresent("css=span.js-oxError_email"));
        $this->type("id=forgotPasswordUserLoginName", "info@oxid-esales.com");
        $this->click("css=ul.form.clear");
        $this->click("css=input.btn");
        $this->waitForPageToLoad("30000");
    }

    /**
     * testing all Login page elements
     * @group mobile
     */
    public function testLoginPage()
    {
        $this->open( shopURL . "en/home/" );

        // Going to Login page by clicking Login link
        $this->click("//a[contains(text(),'Login')]");
        $this->waitForPageToLoad("30000");

        // Check does exist Login title in the login page
        $this->assertTrue($this->isElementPresent("css=h1.title"));

        // Checking does exist Login  container
        $this->assertTrue($this->isElementPresent("id=loginAccount"));

        // Check does exist message "If you are already our customer, please login using your e-mail address and password:"
        $this->assertTrue($this->isElementPresent("//div[@id='loginAccount']/p"));

        // Check does exist input field Login user

        $this->assertTrue($this->isElementPresent("id=loginUser"));

        // Check does exist input field Login Pasword
        $this->assertTrue($this->isElementPresent("id=loginPwd"));

        // Check does exist checkbox label name "Keep me logged-in"
        $this->assertTrue($this->isElementPresent("//div[@id='loginAccount']/div/form/ul/li[3]/label"));

        // Check or checkbox elemment is pressent
        $this->assertTrue($this->isElementPresent("css=label.glyphicon-ok"));
        $this->assertTrue($this->isElementPresent("//div[@id='loginAccount']/div/form/ul/li[3]"));

        // Checking Login button is present
        $this->assertTrue($this->isElementPresent("id=loginButton"));

        // Check does exist Open account  and Forgot password links
        $this->assertTrue($this->isElementPresent("id=openAccountLink"));
        $this->assertTrue($this->isElementPresent("id=forgotPasswordLink"));
        $this->assertTrue($this->isElementPresent("//div[@id='loginAccount']/div[2]"));

        // Click on checkbox "Keep me logged-in"
        $this->click("id=loginCookie");

        // Check does exist message "Specify a value for this required field"
        $this->assertTrue($this->isElementPresent("css=span.js-oxError_notEmpty"));
        $this->assertTrue($this->isElementPresent("//div[@id='loginAccount']/div/form/ul/li[2]/p/span"));
    }

    /**
     * testing all my account page elements
     * @group mobile
     */
    public function testMyAccount()
    {
        $this->open( shopURL . "en/home/" );
        $this->doLogin();
        $this->click("link=My Account");
        $this->waitForPageToLoad("30000");

        // Check there are page active
        $this->assertTrue($this->isElementPresent("css=li.active > a"));

        // Check does exist link "CHANGE PASSWORD"
        $this->assertTrue($this->isElementPresent("css=span"));

        // Check does exist glyph icon in the right side
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-right"));

        // Check does exist link "NEWSLETTER SETTINGS"
        $this->assertTrue($this->isElementPresent("css=#linkAccountNewsletter > span"));

        // Check does exist glyph icon in the right side (linkAccountNewsletter)
        $this->assertTrue($this->isElementPresent("css=#linkAccountNewsletter > i.glyphicon-chevron-right"));

        // Check does exist link "Billing and shipping settings"
        $this->assertTrue($this->isElementPresent("css=#linkAccountBillship > span"));

        // Check does exist glyph icon in the right side (linkAccountBillship)
        $this->assertTrue($this->isElementPresent("css=#linkAccountBillship > i.glyphicon-chevron-right"));

        // Check does exist link "Billing and shipping settings"
        $this->assertTrue($this->isElementPresent("css=#linkAccountOrder > span"));

        // Check does exist glyph icon in the right side (linkAccountOrder)
        $this->assertTrue($this->isElementPresent("css=#linkAccountOrder > i.glyphicon-chevron-right"));

        // Check does exist link "AccountDownloads"
        $this->assertTrue($this->isElementPresent("//a[@id='linkAccountDownloads']/span"));

        // Check does exist glyph icon in the right side (linkAccountDownloads)
        $this->assertTrue($this->isElementPresent("//a[@id='linkAccountDownloads']/i"));

        // Check does exist link"My Wish List"
        $this->assertTrue($this->isElementPresent("css=#linkAccountWishlist > span"));

        // Check does exist glyph icon in the right side
        $this->assertTrue($this->isElementPresent("//a[@id='linkAccountWishlist']/i"));
        $this->assertTrue($this->isElementPresent("css=#linkAccountWishlist > i.glyphicon-chevron-right"));
    }

    /**
     * testing all My Download page elements
     * @group mobile
     */
    public function testMyDownload()
    {
        $this->open( shopURL . "en/home/" );

        $this->doLogin();

        // Go to My download page
        $this->click("//a[@id='linkAccountDownloads']/span");
        $this->waitForPageToLoad("30000");

        //check header and footer.
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist header "My download"
        $this->assertTrue($this->isElementPresent("css=h1.page-head"));

        // Check does exist info message  "You have not ordered any files yet. "
        $this->assertTrue($this->isElementPresent("css=div.box.info"));

        // Check does exist My download content
        $this->assertTrue($this->isElementPresent("css=div.content"));
        $this->open( shopURL . "en/Downloads/Online-shops-with-OXID-eShop.html" );

        // Add product related with "download product" to basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // open second product and add to basket
        $this->open( shopURL . "en/Kiteboarding/Harnesses/Harness-MADTRIXX.html" );
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");

        // Go to 2 basket step
        $this->click("css=input.btn.nextStep");
        $this->waitForPageToLoad("30000");

        // Go to 3 basket step
        $this->click("id=userNextStepBottom");
        $this->waitForPageToLoad("30000");

        // Go to 4 basket step
        $this->click("id=paymentNextStepBottom");
        $this->waitForPageToLoad("30000");
        $this->click("css=li > button.btn");
        $this->waitForPageToLoad("30000");
        $this->click("link=My Account");
        $this->waitForPageToLoad("30000");

        // Open My downloads page
        $this->click("//a[@id='linkAccountDownloads']/span");
        $this->waitForPageToLoad("30000");

        // Check does exist My download content
        $this->assertTrue($this->isElementPresent("css=div.content"));

        // Check does exist link for download product
        $this->assertTrue($this->isElementPresent("link=ch03.pdf"));
        $this->assertTrue($this->isElementPresent("//div[@id='page']/div/div/ul/li/dl/dd"));
        $this->assertTrue($this->isElementPresent("//div[@id='page']/div/div/ul/li/dl/dt/strong"));

        // Check does exist My download header
        $this->assertTrue($this->isElementPresent("css=h1.page-head"));
    }

    /**
     * testing all Newsletter Settings page elements
     * @group mobile
     */
    public function testNewsletterSettings()
    {
        $this->open( shopURL . "en/home/" );
        $this->doLogin();

        // Going to Newsletter settings page
        $this->click("id=linkAccountNewsletter");
        $this->waitForPageToLoad("30000");

        //check header and footer.
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check header "newsletter settings"
        $this->assertTrue($this->isElementPresent("id=newsletterSettingsHeader"));

        // Check content
        $this->assertTrue($this->isElementPresent("css=div.content"));

        // Check label with name "Newsletter subscription:"
        $sNewsletterHeader = $this->getText("//form[@name='newsletter']//ul/li/label");
        $this->assertTrue("Newsletter subscription:" == $sNewsletterHeader);

        // Check does exist dropdown
        $this->assertTrue($this->isElementPresent("css=div.dropdown-toggle"));
        $this->click("css=div.dropdown-toggle");
        $this->click("link=Yes");
        $this->click("css=div.dropdown-toggle");
        $this->click("link=No");
        $this->click("id=newsletterSettingsSave");
        $this->waitForPageToLoad("30000");

        // Check success message  "The Newsletter subscription has been canceled successful"
        $this->assertTrue($this->isElementPresent("css=div.alert.alert-success"));

        // Checking button "SAVE"
        $this->assertTrue($this->isElementPresent("id=newsletterSettingsSave"));
        $this->click("id=newsletterSettingsSave");
        $this->waitForPageToLoad("30000");

        $sNewsletterCancelText = $this->getText("//form[@name='newsletter']//ul/li[3]/p");
        $this->assertTrue("It's possible to cancel newsletter at any time." == $sNewsletterCancelText);

        // Check does exist message "You have just been sent a confirmation e-mail, with which you can activate your subscription."
        $this->click("css=div.dropdown-toggle");
        $this->click("link=Yes");
        $this->click("id=newsletterSettingsSave");
        $this->waitForPageToLoad("30000");
    }

    /**
     * testing all order history page elements
     * @todo need to ensure that order exist in database.
     * @group mobile
     */
    public function testOrderHistory()
    {
        $this->open( shopURL . "en/order-history/" );
        //check header and footer.
        $this->testHeader( false );
        $this->testFooter( false );

        $this->doLogin();
        $this->open( shopURL . "en/order-history/" );

        // Check does exist "ORDER HISTORY " header.
        $this->assertTrue($this->isElementPresent("//div[@id='page']/div/h1"));
        // Check does exist element order date.
        $this->assertTrue($this->isElementPresent("//span[@id='accOrderDate_2']"));

        // Check does exist order no.
        $this->assertTrue($this->isElementPresent("//ul[@id='orderList']/li/ul/li/strong"));
        $this->assertTrue($this->isElementPresent("css=ul.order-history-details > li"));
        $this->assertTrue($this->isElementPresent("id=accOrderNo_2"));

        // Check does exist Order status.
        $this->assertTrue($this->isElementPresent("//li[2]/strong"));
        $this->assertTrue($this->isElementPresent("//span[@id='accOrderStatus_2']/span"));
        $this->assertTrue($this->isElementPresent("//ul[@id='orderList']/li/ul/li[2]"));

        // Check does shipment to:
        $this->assertTrue($this->isElementPresent("//ul[@id='orderList']/li/ul/li[3]/strong"));
        $this->assertTrue($this->isElementPresent("//span[@id='accOrderName_2']"));
        $this->assertTrue($this->isElementPresent("//ul[@id='orderList']/li/ul/li[3]"));

        // Check does exist product in ORDER HISTORY list.
        $this->assertTrue($this->isElementPresent("css=ul.order-history-articles"));
        $this->assertTrue($this->isElementPresent("css=ul.order-history-articles > li"));
        $this->assertTrue($this->isElementPresent("id=accOrderLink_2_1"));

        // Check does exist (order history details) style.
        $this->assertTrue($this->isElementPresent("css=ul.order-history-details"));
        // Check if back button exist.
        $this->isElementPresent("a[class=back]");
    }


    /**
     * testing all 3 basket step page elements
     * @group mobile
     */
    public function test3BasketStep()
    {
        $this->open( shopURL . "en/Special-Offers/Transport-container-BARREL.html" );

        // Add product to basket
        $this->click("id=toBasket");
        $this->waitForPageToLoad("30000");

        // Go to basket
        $this->click("id=minibasketIcon");
        $this->waitForPageToLoad("30000");
        $this->type("id=am_1", "2");
        $this->click("id=basketUpdate");
        $this->waitForPageToLoad("30000");

        // Go to 2nd basket step
        $this->click("//div[@id='btnNextStepBottom']/form/input[4]");
        $this->waitForPageToLoad("30000");

        // Login to shop
        $this->type("name=lgn_usr", "admin");
        $this->type("name=lgn_pwd", "admin");

        // Click login button
        $this->click("css=input.btn");
        $this->waitForPageToLoad("30000");

        // Go to 03 basket step
        $this->click("id=userNextStepBottom");
        $this->waitForPageToLoad("30000");

        //check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist "Standard" dropdown
        $this->assertTrue($this->isElementPresent("css=div.dropdown-toggle"));
        $this->click("css=div.dropdown-toggle");
        $this->click("link=Example Set1: UPS 48 hours");
        $this->waitForPageToLoad("30000");

        // Check does exist Shipping cost
        $this->assertTrue($this->isElementPresent("//div[@id='shipSetCost']"));
        $this->click("//div[@id='paymentMethods']/div");

        // Select of dropdown payment methot "Credit Card"
        $this->click("//div[@id='paymentMethods']/ul/li/a");

        // Check does exist payment method label
        $this->assertTrue($this->isElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li/label"));

        // Check does exist note "If different from Billing Address."
        $this->assertTrue($this->isElementPresent("css=div.note"));

        // Check does exist label"Account Holder:"
        $this->assertTrue($this->isElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[3]/label"));

        // Check does exist "Account Holder"input name
        $this->assertTrue($this->isElementPresent("css=input[name=\"dynvalue[kkname]\"]"));

        // Check does exist "Valid intil" label
        $this->assertTrue($this->isElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[4]/label"));

        // Check does exist Valid date month dropdown
        $this->assertTrue($this->isElementPresent("css=div.card-valid-date-field.card-valid-date-month > div.dropdown > div.dropdown-toggle"));
        $this->assertTrue($this->isElementPresent("id=cardValidDateMonthSelected"));

        // Check does exist dropdown icon
        $this->assertTrue($this->isElementPresent("css=div.card-valid-date-field.card-valid-date-month > div.dropdown > div.dropdown-toggle > #dLabel > i.glyphicon-chevron-down"));

        // Check does exist valid date for year
        $this->assertTrue($this->isElementPresent("css=div.card-valid-date-field.card-valid-date-year > div.dropdown > div.dropdown-toggle"));
        $this->assertTrue($this->isElementPresent("css=div.card-valid-date-field.card-valid-date-year > div.dropdown > div.dropdown-toggle > #dLabel > i.glyphicon-chevron-down"));
        $this->assertTrue($this->isElementPresent("id=cardValidDateYearSelected"));

        // Check does exist "/ "element
        $this->assertTrue($this->isElementPresent("css=div.card-valid-date-field.card-valid-date-divider"));

        // Check does exist label element for   " CVV2 or CVC2 security code:"
        $this->assertTrue($this->isElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[5]/label"));

        // Check does exist valid note ""The CVV2/CVC2 three-digit value is printed just above the ..."
        $this->assertTrue($this->isElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[5]/div"));

        // Check does exist payment desc
        $this->assertTrue($this->isElementPresent("css=div.payment-desc"));
        $this->click("css=div.dropdown-toggle");

        // Choose shipping method "Standart"
        $this->click("css=li.dropdown-option.selected > a");
        $this->waitForPageToLoad("30000");
        $this->assertTrue($this->isElementPresent("css=i.glyphicon-chevron-down"));

        // Check does exist button "CONTINUE"
        $this->assertTrue($this->isElementPresent("id=paymentNextStepBottom"));

        // Check does exist button "PREVIOUS STEP"
        $this->assertTrue($this->isElementPresent("id=paymentBackStepBottom"));

        // Choose payment method Invoice
        $this->click("id=shippingSelected");
        $this->click("link=Standard");
        $this->waitForPageToLoad("30000");
        $this->click("//div[2]/form/div[2]/div/a/i");
        $this->click("link=Invoice");
        $this->click("//div[@id='paymentMethods']/div");

        // Choose payment method Cash in advance
        $this->click("link=Cash in advance");

        // Check does exist 3 basket steps, as active
        $this->assertTrue($this->isElementPresent("css=li.step3.active  > a > span.step-name"));

        // Choose payment method COD (Cash on Delivery)
        $this->click("//div[@id='paymentMethods']/div");
        $this->click("link=COD (Cash on Delivery)");

        // Check does exist label "7,50 ? COD Charge "
        $this->assertTrue($this->isElementPresent("css=div.payment-charge"));

        // Check does exist all basket button
        $this->assertTrue($this->isElementPresent("css=span.step-id"));
        $this->assertTrue($this->isElementPresent("css=li.step2.passed  > a > span.step-id"));
        $this->assertTrue($this->isElementPresent("css=li.step3.active  > a > span.step-name"));
        $this->assertTrue($this->isElementPresent("css=li.step4"));
        $this->assertTrue($this->isElementPresent("css=span.step-id.last"));
    }

    /**
     * testing all CMS page elements
     * @group mobile
     */
    public function testCmsPage()
    {
        $this->open( shopURL . "en/home/" );

        // Click on CMS page "About us"
        $this->click("//a[contains(text(),'About Us')]");

        $this->waitForPageToLoad("30000");

        //check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does exist header ABOUT US
        $this->assertTrue($this->isElementPresent("css=h1.pageHead"));

        // Check does exist about us content
        $this->assertTrue($this->isElementPresent("css=div.cms-content"));

        // Check does exist element for text "Add provider identification here."
        $this->assertTrue($this->isElementPresent("css=p"));

        // Go to second cms page "TERM AND CONDITIONS"
        $this->click("link=Terms and Conditions");
        $this->waitForPageToLoad("30000");

        // Check does exist header name Term and conditions
        $this->assertTrue($this->isElementPresent("css=h1.pageHead"));

        // Check does exist cms content
        $this->assertTrue($this->isElementPresent("css=div.cms-content"));

        // check or works cms page "privacy policy" link
        $this->click("link=Privacy Policy");
        $this->waitForPageToLoad("30000");
    }
}