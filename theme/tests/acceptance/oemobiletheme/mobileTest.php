<?php
/**
 * This file is part of OXID eSales theme switcher module.
 *
 * OXID eSales theme switcher module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales theme switcher module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales theme switcher module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
 */

require_once realpath( "." ) . '/acceptance/library/oxTestCase.php';

class Acceptance_oeMobileTheme_mobileTest extends oxTestCase
{

    const TEST_USER_NAME = 'birute_test@nfq.lt';
    const TEST_USER_PASSWORD = 'useruser';

    /**
     * test for activating MobileTheme
     * @group mobile
     */
    public function testActivateExtension()
    {
        $this->open( shopURL . "admin" );
        $this->loginAdminForModule( "Extensions", "Themes", null, null, null, "admin@myoxideshop.com", "admin0303" );
        $this->openListItem( "link=OXID eShop mobile theme" );
        $this->clickAndWait( "//input[@value='Activate']" );
        $this->selectMenu( "Extensions", "Modules" );
        $this->openListItem( "link=OXID eShop theme switch" );
        $this->clickAndWait( "module_activate" );
        // dumping database
        try {
            $this->dumpDB();
        } catch (Exception $e) {
            $this->stopTesting("Failed dumping original db");
        }
    }

    // ------------------------ Mobile  functionality ----------------------------------

    /**
     * testing all header elements;
     * @group mobile
     */
    public function testHeader( $blOpenPage = true, $blCheckSearch = true )
    {
        if ( $blOpenPage ) {
            $this->openShop();
        }
        // Check does logo and alt  message exist in header

        // We do not check:that logo has a link to home page
        $this->assertElementPresent("//a[@id='logo']/img");
        $this->assertElementPresent("//img[@alt='Shopping cart software by OXID eSales']");

        // Check does header exist;
        $this->assertElementPresent("//div[@id='header']");
        $this->assertElementPresent("css=div.headerMenu.clearfix");

        // Search field  and search button should be visible after clicking on it
        // We do not check: that search field is only visible after clicking on search button
        if ( $blCheckSearch ) {
            $this->assertElementPresent("css=i.glyphicon-search");
            $this->click("css=i.glyphicon-search");
            // Search field and search button
            $this->assertElementPresent("id=searchParam");
            $this->assertElementPresent("//div[@id='search']/form/button");
            $this->assertElementPresent("css=i.glyphicon-search");
        }

        // Check does minibasket element exist
        $this->assertElementPresent("id=minibasketIcon");
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
        $this->assertElementPresent("id=footer");
        $this->assertElementPresent("id=footerServices");
        $this->assertElementPresent("id=footerInformation");

        // Check does footer navigation list elements exist
        $this->assertElementPresent("link=My account");
        $this->assertElementPresent("link=Home");
        if ( $blUserLogIn ) {
            $this->assertElementPresent("link=Logout");
        } else {
            $this->assertElementPresent("link=Login");
        }
        $this->assertElementPresent("//button[contains(text(),'Regular display')]");
        $this->assertElementPresent("link=Contact");
        $this->assertElementPresent("link=About Us");
        $this->assertElementPresent("link=Privacy Policy");
        $this->assertElementPresent("link=Terms and Conditions");
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
        $this->loginInFrontendMobile();
        $this->testFooter( $sURL, true );
    }

    /**
     * testing all start page elements;
     * @group mobile
     */
    public function testStartPage()
    {
        $this->openShop();

        //check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Need add cookie note checking
        // Check does banner element exist;
        $this->assertElementPresent("css=.carousel.slide");
        $this->assertElementVisible("css=img[alt=\"Banner 1\"]");
        // Check does baner left button and right button exist;
        $this->assertElementPresent("css=a.carousel-control.right");
        $this->assertElementPresent("css=i.glyphicon-chevron-left");
        $this->click("css=a.carousel-control.right");
        sleep(1);
        $this->assertElementNotVisible("css=img[alt=\"Banner 1\"]");
        $this->assertElementVisible("css=img[alt=\"Banner 2\"]");

        // Check category links.
        $this->assertElementPresent("link=Kiteboarding");
        $this->assertElementPresent("link=Wakeboarding");
        $this->assertElementPresent("link=Gear");
        $this->assertElementPresent("link=Special Offers");
        $this->assertElementPresent("link=Downloads");

        // Check does category list right button exist;
        $this->assertElementPresent("css=li > a > i.glyphicon-chevron-right");
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

        $this->openShop();

        // Check does category tree exist;
        $this->assertElementPresent("id=cat_list");

        // Go to subcategory;//form[@id='filterList']/label[1]
        $this->clickAndWait("//div[@id='cat_list']/ul/li/a");

        // Check does back button exist;
        $this->assertElementPresent("css=.back");

        // Check does left button near back button exist;
        $this->assertElementPresent("css=i.glyphicon-chevron-left");

        // Check does all category in category tree exist;
        $this->assertElementPresent("id=moreSubCat_1");
        $this->assertElementPresent("id=moreSubCat_2");
        $this->assertElementPresent("id=moreSubCat_3");
        $this->assertElementPresent("id=moreSubCat_4");

        // Go to subcategory "kites";
        $this->clickAndWait("//a[@id='moreSubCat_1']");

        // Check does back button exist;
        $this->assertElementPresent("css=.back");

        // Check does left button near back button exist;
        $this->assertElementPresent("css=i.glyphicon-chevron-left");

        // Check does subcategory name exist;
        $this->assertElementPresent("css=h1");

        // Check does "sort by exist";
        $this->assertElementPresent("css=label.sort-title");

        // Check does sorting options field exist;
        $this->assertElementPresent("css=#sortItems > div.dropdown > div.dropdown-toggle");

        // Check does product list exist;
        $this->assertElementPresent("css=h4.media-heading");

        // Check does image near product exist;
        $this->assertElementPresent("css=img[alt=\"Kite CORE GTS \"]");

        // Check does product price exist;
        $this->assertElementPresent("css=#productPrice_productList_1 > span");

        // Check does previous price, which is crossed out exist;
        $this->assertElementPresent("//ul[@id='productList']/li/form/div[2]/div[2]/span/del");

        // Check does pages and button "next" exist;
        $this->assertElementPresent("css=div.pagination-container");
        $this->assertElementPresent("link=1");
        $this->assertElementPresent("link=2");
        $this->assertElementPresent("css=i.glyphicon-chevron-right");

        // Check does  filter and sorting exist;
        $this->assertElementPresent("//div[@id='filterBoxClosed']/input");

        // Open filter and sorting;
        $this->click("css=input.btn");

        // Check does filter and sorting still exist;
        $this->assertElementPresent("css=span.filter-open-title");

        // Check does close "filter and sorting" button exist;
        $this->assertElementPresent("css=i.glyphicon-remove");

        // Check does title area of application exist;
        $this->assertElementPresent("//form[@id='filterList']/label[1]");

        // Check does "area of application" filter exist;
        $this->assertElementPresent("css=div.dropdown-toggle > span");

        // Check does title"included in delivery" exist;
        $this->assertElementPresent("//form[@id='filterList']/label[2]");

        // Check does "included in delivery filter exist;
        $this->assertElementPresent("//form[@id='filterList']/div[2]/div/span");
    }

    /**
     * testing all start page elements
     * @group mobile
     */

    public function testDetailPage()
    {
        // Go to Kuyichi Jeans SUGAR
        $this->open( shopURL . "index.php?cl=details&anid=6b66d82af984e5ad46b9cb27b1ef8aae" );
        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does previous button near back exist
        $this->assertElementPresent("css=i.glyphicon-chevron-left");

        // Check does back button exist
        $this->assertElementPresent("//div[@id='details']/ul/li/a/span");

        // Check does add to wish list "star" exist
        $this->assertElementPresent("css=i.glyphicon-star");

        // Check does product image exist
        $this->assertElementPresent("css=img[alt=\"Kuyichi Jeans SUGAR \"]");

        // Check does previous button for image exist
        $this->assertElementPresent("css=a.carousel-control.left > i.glyphicon-chevron-left");

        // Check does next button for image exist
        $this->assertElementPresent("css=i.glyphicon-chevron-right");

        // Check does  "incl. VAT, plus shipping" exist
        $this->assertElementPresent("css=div.product-delivery-info > a");

        // Check does size variant selection exist
        $this->assertElementPresent("id=dLabelSelectBox_varselid_0");

        // Check does color variant selection exist
        $this->assertElementPresent("id=dLabelSelectBox_varselid_1");

        // Check does washing variant selection exist
        $this->assertElementPresent("id=dLabelSelectBox_varselid_2");

        // Check does "choose variant"message exist
        $this->assertElementPresent("css=p.product-variants-message");

        // Check does "add to cart" button exist
        $this->assertElementPresent("css=#tobasketFunction");

        // Check does "more details" button exist
        $this->assertElementPresent("css=div.product-description-container > i.glyphicon-chevron-down");

        // Open full description;
        $this->click("css=.product-description-container");

        // Check does detail about product exist
        $this->assertElementPresent("css=div.product-description-container");

        // check does full description close button exist
        $this->assertElementPresent("css=i.glyphicon-chevron-up");

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
        $this->assertElementPresent("//div[@id='page']/div/h1");

        // Check does company info with all contacts exist
        $this->assertElementPresent("//div[@id='contacts']");

        // Check does label Mr exist
        $this->assertElementPresent("//div[@id='contacts']/form/ul/li/label");

        // Check does label Mrs exist
        $this->assertElementPresent("//div[@id='contacts']/form/ul/li/label[2]");

        // Check does checkbox Mr exist
        $this->assertElementPresent("id=mr_editval[oxuser__oxsal]");

        // Check does checkbox Mrs exist
        $this->assertElementPresent("id=mrs_editval[oxuser__oxsal]");

        // Check does all required field exist
        $this->assertElementPresent("name=editval[oxuser__oxfname]");
        $this->assertElementPresent("name=editval[oxuser__oxlname]");
        $this->assertElementPresent("id=contactEmail");
        $this->assertElementPresent("name=c_subject");
        $this->assertElementPresent("name=c_subject");
        $this->assertElementPresent("//div[@id='contacts']/form/ul/li[6]/label");
        $this->assertElementPresent("name=c_message");

        // Check does verification code label exist
        $this->assertElementPresent("css=label.req");

        // Check does verification code exist
        $this->assertElementPresent("css=li.verify > img");
        $this->assertElementPresent("name=c_mac");

        // Check does send button exist
        $this->assertElementPresent("//input[@value='Send']");
    }

    /**
     * testing all billing and shipping settings page elements
     * @group mobile
     */
    public function testBillingAndShippingSettings()
    {
        $this->open( shopURL . "en/my-account" );

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false );

        // Go to my account page and login to it
        $this->loginInFrontendMobile();
        $this->click("link=My account");

        // Go to billing and shipping settings
        $this->clickAndWait("css=#linkAccountBillship > span");

        // Check does  "billing and shipping settings" label exist
        $this->assertElementPresent("id=addressSettingsHeader");

        // Check does  billing address label exist
        $this->assertElementPresent("css=h3.block-head");

        // Check does "change" button exist
        $this->assertElementPresent("id=userChangeAddress");

        // Check does address  exist
        $this->assertElementPresent("//ul[@id='addressText']/li");

        // Check does " shipping address" label exist
        $this->assertElementPresent("id=addShippingAddress");

        // Check does "send to billing address" label exist
        $this->assertElementPresent("css=div.collumn > ul > li > label");

        // Check does "send billing address" checkbox   exist
        $this->assertElementPresent("id=showShipAddress");

        // Check does "save" button exist
        $this->assertElementPresent("id=accUserSaveTop");

        // Press "change" button
        $this->click("id=userChangeAddress");

        // Check does "billing address" label exist
        $this->assertElementPresent("id=addressSettingsHeader");

        // Check does "e-mail" address exist
        $this->assertElementPresent("//ul[@id='addressForm']/li/label");

        // Check does all imput field exist
        $this->assertElementPresent("name=invadr[oxuser__oxusername]");
        $this->assertElementPresent("css=span.js-oxError_email");
        $this->assertElementPresent("//ul[@id='addressForm']/li[3]/label");
        $this->assertElementPresent("//ul[@id='addressForm']/li[3]/label[2]");
        $this->assertElementPresent("id=mr_invadr[oxuser__oxsal]");
        $this->assertElementPresent("id=mrs_invadr[oxuser__oxsal]");
        $this->assertElementPresent("name=invadr[oxuser__oxfname]");
        $this->assertElementPresent("name=invadr[oxuser__oxlname]");
        $this->assertElementPresent("name=invadr[oxuser__oxcompany]");
        $this->assertElementPresent("name=invadr[oxuser__oxaddinfo]");
        $this->assertElementPresent("name=invadr[oxuser__oxstreet]");
        $this->assertElementPresent("name=invadr[oxuser__oxstreetnr]");
        $this->assertElementPresent("name=invadr[oxuser__oxzip]");
        $this->assertElementPresent("name=invadr[oxuser__oxcity]");
        $this->assertElementPresent("name=invadr[oxuser__oxustid]");
        $this->assertElementPresent("css=div.dropdown-toggle");
        $this->assertElementPresent("name=invadr[oxuser__oxfon]");
        $this->assertElementPresent("name=invadr[oxuser__oxfax]");
        $this->assertElementPresent("name=invadr[oxuser__oxmobfon]");
        $this->assertElementPresent("name=invadr[oxuser__oxprivfon]");
        $this->assertElementPresent("id=datePicker");

        // Change date of birth and submit
        $this->click("//li[@id='month']/button");
        $this->click("//li[@id='day']/button");
        $this->click("//li[@id='year']/button");
        $this->clickAndWait("id=accUserSaveTop");

        // Check date
        $this->click("id=userChangeAddress");
        $this->assertTextPresent("February");
        $this->assertElementPresent("//input[@value='02']");
        $this->assertElementPresent("//input[@value='1981']");
    }

    /**
     * testing user 2nd step when user is not logged in  page elements
     * @group mobile
     */
    public function testSecondStepNotLoginUser()
    {
        //Open Harness MADTRIXX
        $this->open( shopURL . 'index.php?cl=details&anid=05848170643ab0deb9914566391c0c63' );

        // Add product to the basket
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");

        // Go to 2nd step
        $this->clickAndWait("css=#btnNextStepBottom > form.form > input.btn.nextStep");

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false );

        // Check does step line on top of the page exist
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=li.step2.active  > a > span.step-number");
        $this->assertElementPresent("css=li.step2.active  > a > span.step-name");
        $this->assertElementPresent("css=li.step3 > span.step-number");
        $this->assertElementPresent("css=li.step4 > span.step-number");
        $this->assertElementPresent("css=span.step-number.last");

        // Check does imput field for login name and password exists
        $this->assertElementPresent("name=lgn_usr");
        $this->assertElementPresent("name=lgn_pwd");
        $this->assertElementPresent("css=span.js-oxError_notEmpty");
        $this->assertElementPresent("//input[@value='Open account']");
        $this->assertElementPresent("//input[@value='Log in']");
        $this->assertElementPresent("link=Forgot password?");
        $this->assertElementPresent("//input[@value='Without registration']");
    }

    /**
     * testing all start page elements
     * @group mobile
     */
    public function testSecondStepLoginUser()
    {
        $this->openShop();
        $this->loginInFrontendMobile();

        //Open Harness MADTRIXX
        $this->open( shopURL . 'index.php?cl=details&anid=05848170643ab0deb9914566391c0c63' );

        // Add product to the basket
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");

        // Go to 2nd step
        $this->clickAndWait("css=#btnNextStepBottom > form.form > input.btn.nextStep");

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false, true );

        // Check does  step line with all steps exist
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=li.step2.active  > a > span.step-number");
        $this->assertElementPresent("css=li.step2.active  > a > span.step-name");
        $this->assertElementPresent("css=li.step3");
        $this->assertElementPresent("css=li.step4 > span.step-number");
        $this->assertElementPresent("css=span.step-number.last");

        // Check does billing address label exist
        $this->assertElementPresent("css=h3");

        // Check does "change address" button exist
        $this->assertElementPresent("id=userChangeAddress");

        // Check does address exist
        $this->assertElementPresent("css=#addressText > li");

        // Check does "send to billing address" label exist
        $this->assertElementPresent("css=div.form > label");

        // Check does "send to billing address"  checkbox exist
        $this->assertElementPresent("id=showShipAddress");

        // Check does  remark field exist
        $this->assertElementPresent("id=orderRemark");

        // Check does "continue" button exist
        $this->assertElementPresent("id=userNextStepBottom");

        // Check does "previous step" button exist
        $this->assertElementPresent("css=input.btn.previous");
    }

    /**
     * testing purchase without registration page all elements
     * @group mobile
     */
    public function testPurchaseWithoutRegistration()
    {
        //Open Harness MADTRIXX
        $this->open( shopURL . 'index.php?cl=details&anid=05848170643ab0deb9914566391c0c63' );

        // Add product to the basket
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");

        // Go to 2nd step;
        $this->clickAndWait("css=#btnNextStepBottom > form.form > input.btn.nextStep");

        // Go to "purchase without registration" page;
        $this->clickAndWait("css=#optionNoRegistration > form.form > input.btn");

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false );

        // Check does step line exist with all steps;
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=li.step2.active  > a > span.step-number");
        $this->assertElementPresent("css=li.step2.active  > a > span.step-name");
        $this->assertElementPresent("css=li.step3");
        $this->assertElementPresent("css=li.step4 > span.step-number");
        $this->assertElementPresent("css=span.step-number.last");


        // Check does Customer information label exist;
        $this->assertElementPresent("css=h3.block-head");

        // Check does label and imput field for email address exist;
        $this->assertElementPresent("id=userLoginName");

        // Check  does warning message "Specify a value for this required field" exist;
        $this->assertElementPresent("css=span.js-oxError_notEmpty");

        // Check does "Billing Address" label exist;
        $this->assertElementPresent("//h3[2]");

        // Check does Mr and  MRs check boxes with labels exist;
        $this->assertElementPresent("id=mr_invadr[oxuser__oxsal]");
        $this->assertElementPresent("id=mrs_invadr[oxuser__oxsal]");
        $this->assertElementPresent("//ul[2]/li/label");
        $this->assertElementPresent("//label[2]");

        // Check does all imput elements are in page;
        $this->assertElementPresent("name=invadr[oxuser__oxfname]");
        $this->assertElementPresent("name=invadr[oxuser__oxlname]");
        $this->assertElementPresent("name=invadr[oxuser__oxcompany]");
        $this->assertElementPresent("name=invadr[oxuser__oxaddinfo]");
        $this->assertElementPresent("name=invadr[oxuser__oxstreet]");
        $this->assertElementPresent("name=invadr[oxuser__oxzip]");
        $this->assertElementPresent("name=invadr[oxuser__oxcity]");
        $this->assertElementPresent("name=invadr[oxuser__oxstreetnr]");
        $this->assertElementPresent("//div[@id='invCountry']/div");
        $this->assertElementPresent("name=invadr[oxuser__oxfon]");
        $this->assertElementPresent("name=invadr[oxuser__oxfax]");
        $this->assertElementPresent("name=invadr[oxuser__oxmobfon]");
        $this->assertElementPresent("name=invadr[oxuser__oxprivfon]");

        // Check does birthday field exist;
        $this->assertElementPresent("css=li.oxDate > label");
        $this->assertElementPresent("css=#month > button.btn");
        $this->assertElementPresent("css=#day > button.btn");
        $this->assertElementPresent("css=#year > button.btn");
        $this->assertElementPresent("//li[@id='month']/button");
        $this->assertElementPresent("//li[@id='day']/button");
        $this->assertElementPresent("//li[@id='year']/button");

        // Check does warning message exist;
        $this->assertElementPresent("css=li.alert.alert-block");

        // Check does "Shipping address" label and check box exist;
        $this->assertElementPresent("//h3[3]");

        // Check does " what I wanted to say" field with label exist;
        $this->assertElementPresent("//li[2]/label");
        $this->assertElementPresent("id=orderRemark");

        // Check does "continue" button exist;
        $this->assertElementPresent("id=userNextStepBottom");

        // Check does "previous step" button exist;
        $this->assertElementPresent("id=userBackStepBottom");

    }

    /**
     * testing all start page elements
     * @group mobile
     */
    public function testSearchListMobile()
    {
        $this->openShop();

        // Open search field
        $this->click("css=i.glyphicon-search");

        // Add search keyword
        $this->type("id=searchParam", "kite");

        // Press search button
        $this->clickAndWait("css=button.btn.search-btn");
        $this->click("css=i.glyphicon-search");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does "24 Hits for "kite" " exist
        $this->assertElementPresent("css=h1.page-head");

        // Check does sort by exist
        $this->assertElementPresent("css=label.sort-title");

        // Check does  sorting field exist
        $this->assertElementPresent("//div[@id='sortItems']/div/div/span");

        // Check does 1st product exist
        $this->assertElementPresent("css=div.article-list-price");

        // Check does last product in the list exist
        $this->assertElementPresent("//ul[@id='searchList']/li[10]/form/div[2]");

        // Check does  page number 1 exist
        $this->assertElementPresent("link=1");

        // Check does next page  button exist
        $this->assertElementPresent("css=i.glyphicon-chevron-right");
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
        // Go to product Transport container BARREL details page
        $this->open( shopURL . 'index.php?cl=details&anid=f4f73033cf5045525644042325355732' );
        $this->type("id=persistentParam", "TEST");

        // Add product to cart
        $this->clickAndWait("id=toBasket");

        // Add product Transport container BARREL
        $this->open( shopURL . "index.php?cl=details&anid=f4f73033cf5045525644042325355732" );
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false );

        // Check does  step line with all steps exist
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=span.step-name");
        $this->assertElementPresent("css=li.step2 > a > span.step-number");
        $this->assertElementPresent("css=li.step3 > span.step-number");
        $this->assertElementPresent("css=li.step4 > span.step-number");
        $this->assertElementPresent("css=span.step-number.last");

        // Check does exist 01 CART content
        $this->assertElementPresent("css=div.content");
        $this->assertElementPresent("//tr[@id='basketGrandTotal']/th");

        // Check does exist button CONTINUE
        $this->assertElementPresent("css=input.btn.nextStep");
        $this->assertElementPresent("css=#btnNextStepBottom > form.form > input.btn.nextStep");

        // Check does exist remove button
        $this->assertElementPresent("name=removeBtn");

        // Check does exist element product title link
        $this->assertElementPresent("css=a.media-heading-link");

        // Check does exist element of variant
        $this->assertElementPresent("css=p.attributes");

        // Check does exist quantity input fields
        $this->assertElementPresent("id=am_1");
        $this->assertElementPresent("id=am_2");
        $this->assertElementPresent("//li[@id='cartItem_1']/div/div/input[4]");

        // Check does exist element for VAT
        $this->assertElementPresent("css=span.vat-percent");

        // Check does exist element for main price
        $this->assertElementPresent("css=span.main-price");

        // Check does exist  input field for persParam
        $this->assertElementPresent("//li[@id='cartItem_2']/div/p[2]/input");
        /*
         *  //Commented because of bug #5227
                // Check does exist element of attribute
                $this->assertElementPresent("css=#cartItem_3 > div.media-body > p.attributes");
                $this->assertElementPresent("//li[@id='cartItem_3']/div/p");
                $this->assertElementPresent("css=#cartItem_2 > div.media-body");
        */
        // Check does exist label Update
        $this->assertElementPresent("//div[@id='basketFn']/label");

        // Check does exist button Basket update
        $this->assertElementPresent("id=basketFn");
        $this->assertElementPresent("id=basketUpdate");

        // Check does exist label element Total Products (net)
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr/th");

        // Check does exist label plus var 19 Amount
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr[2]/th");

        // Check does exist label "Total product (gross)
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr[3]/th");
        $this->assertElementPresent("id=basketTotalProductsNetto");
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr[2]/td");
        $this->assertElementPresent("id=basketTotalProductsGross");
        $this->assertElementPresent("css=#basketGrandTotal > td");
        $this->assertElementPresent("//tr[@id='basketGrandTotal']/th/strong");

        // Check does exist all checkout steps at the top
        $this->assertElementPresent("css=ul.steps");
    }

    /**
     * testing user first step when user is logged in  page elements
     * @group mobile
     */
    public function testFirstStepLoginUser()
    {
        $this->openShop();
        $this->loginInFrontendMobile();

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
        // Go to product Transport container BARREL details page
        $this->open( shopURL . "index.php?cl=details&anid=f4f73033cf5045525644042325355732" );
        $this->type("id=persistentParam", "TEST");

        // Add product to cart
        $this->clickAndWait("id=toBasket");

        // Add product Transport container BARREL to cart
        $this->open( shopURL . "index.php?cl=details&anid=f4f73033cf5045525644042325355732" );
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false, true );

        // Check does  step line with all steps exist
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=span.step-name");
        $this->assertElementPresent("css=li.step2 > a > span.step-number");
        $this->assertElementPresent("css=li.step3 > span.step-number");
        $this->assertElementPresent("css=li.step4 > span.step-number");
        $this->assertElementPresent("css=span.step-number.last");

        // Check does exist 01 CART content
        $this->assertElementPresent("css=div.content");
        $this->assertElementPresent("//tr[@id='basketGrandTotal']/th");

        // Check does exist button CONTINUE
        $this->assertElementPresent("css=input.btn.nextStep");
        $this->assertElementPresent("css=#btnNextStepBottom > form.form > input.btn.nextStep");

        // Check does exist remove button
        $this->assertElementPresent("name=removeBtn");

        // Check does exist element product title link
        $this->assertElementPresent("css=a.media-heading-link");

        // Check does exist element of variant
        $this->assertElementPresent("css=p.attributes");

        // Check does exist quantity input fields
        $this->assertElementPresent("id=am_1");
        $this->assertElementPresent("id=am_2");
        $this->assertElementPresent("//li[@id='cartItem_1']/div/div/input[4]");

        // Check does exist element for VAT
        $this->assertElementPresent("css=span.vat-percent");

        // Check does exist element for main price
        $this->assertElementPresent("css=span.main-price");

        // Check does exist  input field for persParam
        $this->assertElementPresent("//li[@id='cartItem_2']/div/p[2]/input");

        // Check does exist label element
        $this->assertElementPresent("css=input.persParam");
        /*
         *  //Commented because of bug #5227
                // Check does exist element of attribute
                $this->assertElementPresent("css=#cartItem_3 > div.media-body > p.attributes");
                $this->assertElementPresent("//li[@id='cartItem_3']/div/p");
                $this->assertElementPresent("css=#cartItem_2 > div.media-body");
        */
        // Check does exist label Update
        $this->assertElementPresent("//div[@id='basketFn']/label");

        // Check does exist button Basket update
        $this->assertElementPresent("id=basketFn");
        $this->assertElementPresent("id=basketUpdate");

        // Check does exist label element Total Products (net)
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr/th");

        // Check does exist label plus var 19 Amount
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr[2]/th");

        // Check does exist label "Total product (gross)
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr[3]/th");
        $this->assertElementPresent("id=basketTotalProductsNetto");
        $this->assertElementPresent("//table[@id='basketSummary']/tbody/tr[2]/td");
        $this->assertElementPresent("id=basketTotalProductsGross");
        $this->assertElementPresent("css=#basketGrandTotal > td");
        $this->assertElementPresent("//tr[@id='basketGrandTotal']/th/strong");

        // Check does exist all checkout steps at the top
        $this->assertElementPresent("css=ul.steps");
    }

    /**
     * testing all wish list page elements
     * @group mobile
     */
    public function testWishList()
    {
        $this->openShop();
        $this->loginInFrontendMobile();

        //Open Harness MADTRIXX
        $this->open( shopURL . 'index.php?cl=details&anid=05848170643ab0deb9914566391c0c63' );

        // Click on the button "Start"
        $this->click("css=i.glyphicon-star");

        // Check does exist present info message "Please login to access Wish List."
        $this->assertElementPresent("//div[@id='detailsMain']/div/div/span");

        // Check does exist info message"Please login to access Wish List." border
        $this->assertElementPresent("//div[@id='detailsMain']/div/div");
        $this->click("css=i.glyphicon-star");

        // Check does exist border with text "Success"
        $this->assertElementPresent("//div[@id='detailsMain']/div/div/span");

        // Go to My account page
        $this->clickAndWait("link=My account");

        // Go to " My wish list" page
        $this->clickAndWait("//div[@id='cat_list']/ul/li[6]/a/span");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist header "MY WISH LIST"
        $this->assertElementPresent("css=h1.page-head");

        // Check does exist remove button
        $this->assertElementPresent("name=wishlist_remove_button");

        // Check there are added product in to wish list
        $this->assertElementPresent("//ul[@id='noticelistProductList']/li/form/div[2]");

        // Remove product from wish list
        $this->clickAndWait("name=wishlist_remove_button");
        /*
         *  //Commented because of bug #5227
                // Check does exist error message "Your Wish List is empty. "
              //  $this->assertElementPresent("css=div.alert.alert-error");

                // Check does exist error message content
                $this->assertElementPresent("css=div.content");
        */
    }

    /**
     * testing user 4 basket step when user is logged in page elements
     * @group mobile
     */
    public function test4BasketStep()
    {
        $this->openShop();
        $this->loginInFrontendMobile();

        //Open Harness MADTRIXX
        $this->open( shopURL . 'index.php?cl=details&anid=05848170643ab0deb9914566391c0c63' );
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");

        // Go to 2nd basket step
        $this->clickAndWait("//input[@value='Continue']");

        // Go to 3 basket step
        $this->clickAndWait("id=userNextStepTop");

        // Go to 4 basket step
        $this->clickAndWait("//input[@value='Continue']");

        // Check there are 4 basket steps marked as active
        $this->assertElementPresent("css=li.step4.active  > span.step-name");

        // Check does exist header "Terms and Conditions and Right to Withdrawal"
        $this->assertElementPresent("css=div.agb");
        $this->assertElementPresent("css=h3.heading.section-heading > span");

        // Check does exist link "right of withdrawal"
        $this->assertElementPresent("link=Right of Withdrawal");
        $this->assertElementPresent("css=#test_OrderOpenWithdrawalBottom");

        // Check does exist link to "terms and conditions" page
        $this->assertElementPresent("css=a.fontunderline");
        $this->assertElementPresent("link=Terms and Conditions");

        // Check does exist heading section
        $this->assertElementPresent("css=form.form > h3.heading.section-heading > span");
        $this->assertElementPresent("//div[@id='orderAddress']/form/h3/span");

        // Check does exist button EDIT billing address
        $this->assertElementPresent("//button[@type='submit']");

        // Check does exist  Billing address
        $this->assertElementPresent("//div[@id='orderAddress']/dl/dd");

        // Check does exist Billing address title
        $this->assertElementPresent("//div[@id='orderAddress']/dl/dt");

        // Check does exist SHIPPING CARRIER title
        $this->assertElementPresent("css=#orderShipping > form.form > h3.heading.section-heading");

        // Check does exist Shipping method "Standard"
        $this->assertElementPresent("//div[@id='orderShipping']");

        // Check does exist payment method information
        $this->assertElementPresent("css=#orderPayment > form.form > h3.heading.section-heading");
        $this->assertElementPresent("id=orderPayment");

        // Check does exist payment EDIT button
        $this->assertElementPresent("//div[@id='orderPayment']/form/h3/button");

        // Check does exist button edit shipping method
        $this->assertElementPresent("//div[@id='orderEditCart']/form/h3/button");

        // Check does exist Cart information
        $this->assertElementPresent("//div[@id='orderEditCart']/form/h3/span");

        // Check does exist product image
        // Check does exist link to product
        $this->assertElementPresent("css=img[alt=\"Harness MADTRIXX\"]");
        $this->assertElementPresent("link=Harness MADTRIXX");

        // Check does exist all element related with button "ORDER NOW"
        $this->assertElementPresent("css=li > button.btn");
        $this->assertElementPresent("//form[@id='orderConfirmAgbBottom']/ul/li/button");

        // Check does exist all basket summary
        $this->assertElementPresent("id=basketGrandTotal");
        $this->assertElementPresent("id=basketTotalProductsNetto");
        $this->assertElementPresent("id=basketSummary");
        $this->assertElementPresent("id=basketTotalProductsGross");
        $this->assertElementPresent("id=basketDeliveryGross");
        $this->assertElementPresent("id=basketPaymentGross");

        // Check does exist all (1,2,3,4, ok) steps exist
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=li.step2.passed  > a > span.step-number");
        $this->assertElementPresent("css=li.step3.passed  > a > span.step-number");
        $this->assertElementPresent("css=li.step4.active  > span.step-number");
        $this->assertElementPresent("css=li.step4.active  > span.step-name");
        $this->assertElementPresent("css=span.step-number.last");

        //Check header and footer
        $this->testHeader( false, false);
        $this->testFooter( false, true );
    }

    /**
     * testing 5th basket step page  all elements
     * @group mobile
     */
    public function test5BasketStep()
    {
        $this->_makeOrder();

        //Check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false, true );

        // Check does link back to Start page exist;
        $this->assertElementPresent("id=backToShop");

        // Check does exist link to  order history
        $this->assertElementPresent("id=orderHistory");

        // Check does thank you page content exist in page;
        $this->assertElementPresent("//div[@id='thankyouPage']");

        // Check does all (1,2,3,4,ok) basket step exist
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=li.step2.passed  > span.step-number");
        $this->assertElementPresent("css=li.step3.passed  > span.step-number");
        $this->assertElementPresent("css=li.step4.passed  > span.step-number");
        $this->assertElementPresent("css=li.step5.active > span.step-number");
        $this->assertElementPresent("css=li.step5.active > span.step-name");

    }

    /**
     * testing all "change password" page elements
     * @group mobile
     */
    public function testChangePassword()
    {
        $this->open( shopURL . "en/home/");
        $this->loginInFrontendMobile();
        $this->clickAndWait("//a[@id='linkAccountPassword']/span");

        //Check header and footer
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist the page "CHANGE PASSWORD" header
        $this->assertElementPresent("//h1[@id='personalSettingsHeader']");

        // Check does exist content
        $this->assertElementPresent("css=div.content");

        // Check does exist input fields "Old password"
        $this->assertElementPresent("id=passwordOld");

        // heck does exist input field "New password"
        $this->assertElementPresent("id=passwordNew");

        // Check label"Confirm password"
        $this->click("id=passwordNewConfirm");

        // Check input field "password new confirm"
        $this->assertElementPresent("id=passwordNewConfirm");

        // Check button "SAVE"
        $this->assertElementPresent("id=savePass");

        // Check all messages "Specify a value for this required field"
        $this->assertElementPresent("css=span.js-oxError_notEmpty");
        $this->assertElementPresent("//li[2]/p/span");
        $this->assertElementPresent("//li[3]/p/span");
        $this->assertElementPresent("//div[@id='page']/div/div/form/ul/li[3]/p/span");
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
        $this->testFooter( false );

        // Check does exist Error header
        $this->assertElementPresent("css=h1.page-head");

        // Check does exist page content
        $this->assertElementPresent("css=div.content");

        // Check does exist element bold "as bold is marked text en/Kiteboarding/Harnesses/Harness-MADTRIX.html'"
        $this->assertElementPresent("css=strong");

        // Check does exist Full information related with error 404
        $this->assertElementPresent("css=div.alert.alert-error");
    }

    /**
     * testing all forgot password page elements
     * @group mobile
     */
    public function testForgotPassword()
    {
        $this->openShop();

        // Open Login page
        $this->clickAndWait("link=Login");

        // Click on Forgot password link
        $this->clickAndWait("//a[@id='forgotPasswordLink']");

        // Check does exist title"FORGOT PASSWORD"
        $this->assertElementPresent("css=h1.page-head");

        // Check does exist forgot password content
        $this->assertElementPresent("css=div.content");

        // Check label  "You e-mail Address:" is present
        $this->assertElementPresent("css=label");

        // Check does exist input label "E-mail address"
        $this->assertElementPresent("id=forgotPasswordUserLoginName");

        // Check does exist button with value Request Password
        $this->assertElementPresent("//input[@value='Request Password']");

        // Check does exist content ellement
        $this->assertElementPresent("css=div.content");

        // Check element is present for text"When you click on 'Request Password', you'll be sent an e-mail with instructions how to set up a new password. "
        $this->assertElementPresent("css=div.content > p");
        $this->type("id=forgotPasswordUserLoginName", "birute_test_@nfq.lt");
        $this->clickAndWait("css=input.btn");

        // Check does exist error message "  The e-mail address you have entered is invalid. Please enter a valid e-mail address."
        $this->assertElementPresent("//div[@id='page']/div/div/p");
        $this->assertElementPresent("css=div.alert.alert-error");
        $this->type("id=forgotPasswordUserLoginName", "admin");

        // Check does exist error "Please enter a valid e-mail address"
        $this->assertElementPresent("css=span.js-oxError_email");
        $this->type("id=forgotPasswordUserLoginName", "info@oxid-esales.com");
        $this->click("css=ul.form.clear");
        $this->clickAndWait("css=input.btn");
    }

    /**
     * testing all Login page elements
     * @group mobile
     */
    public function testLoginPage()
    {
        $this->openShop();

        // Going to Login page by clicking Login link
        $this->clickAndWait("//a[contains(text(),'Log in')]");

        // Check does exist Login title in the login page
        $this->assertElementPresent("css=h1.page-head");

        // Checking does exist Login  container
        $this->assertElementPresent("id=loginAccount");

        // Check does exist message "If you are already our customer, please login using your e-mail address and password:"
        $this->assertElementPresent("//div[@id='loginAccount']/p");

        // Check does exist input field Login user

        $this->assertElementPresent("id=loginUser");

        // Check does exist input field Login Password
        $this->assertElementPresent("id=loginPwd");

        // Check does exist checkbox label name "Keep me logged-in"
        $this->assertElementPresent("//div[@id='loginAccount']/form/ul/li[3]/label");


        // Check or checkbox element is present
        $this->assertElementPresent("css=label.glyphicon-ok");

        // Checking Login button is present
        $this->assertElementPresent("id=loginButton");

        // Check does exist Open account  and Forgot password links
        $this->assertElementPresent("id=openAccountLink");
        $this->assertElementPresent("id=forgotPasswordLink");

        // Click on checkbox "Keep me logged-in"
        $this->click("id=loginCookie");
        $this->click("id=loginButton");

        // Check does exist message "Specify a value for this required field"
        $this->assertElementPresent("css=span.js-oxError_notEmpty");
    }

    /**
     * testing all my account page elements
     * @group mobile
     */
    public function testMyAccount()
    {
        $this->openShop();
        $this->loginInFrontendMobile();
        $this->clickAndWait("link=My account");

        // Check there are page active
        $this->assertElementPresent("css=li.active > a");

        // Check does exist link "CHANGE PASSWORD"
        $this->assertElementPresent("css=span");

        // Check does exist glyph icon in the right side
        $this->assertElementPresent("css=i.glyphicon-chevron-right");

        // Check does exist link "NEWSLETTER SETTINGS"
        $this->assertElementPresent("css=#linkAccountNewsletter > span");

        // Check does exist glyph icon in the right side (linkAccountNewsletter)
        $this->assertElementPresent("css=#linkAccountNewsletter > i.glyphicon-chevron-right");

        // Check does exist link "Billing and shipping settings"
        $this->assertElementPresent("css=#linkAccountBillship > span");

        // Check does exist glyph icon in the right side (linkAccountBillship)
        $this->assertElementPresent("css=#linkAccountBillship > i.glyphicon-chevron-right");

        // Check does exist link "Billing and shipping settings"
        $this->assertElementPresent("css=#linkAccountOrder > span");

        // Check does exist glyph icon in the right side (linkAccountOrder)
        $this->assertElementPresent("css=#linkAccountOrder > i.glyphicon-chevron-right");

        // Check does exist link "AccountDownloads"
        $this->assertElementPresent("//a[@id='linkAccountDownloads']/span");

        // Check does exist glyph icon in the right side (linkAccountDownloads)
        $this->assertElementPresent("//a[@id='linkAccountDownloads']/i");

        // Check does exist link"My Wish List"
        $this->assertElementPresent("css=#linkAccountWishlist > span");

        // Check does exist glyph icon in the right side
        $this->assertElementPresent("//a[@id='linkAccountWishlist']/i");
        $this->assertElementPresent("css=#linkAccountWishlist > i.glyphicon-chevron-right");
    }

    /**
     * testing all My Download page elements
     * @group mobile
     */
    public function testMyDownload()
    {
        $this->openShop();

        $this->loginInFrontendMobile();

        // Go to My download page
        $this->clickAndWait("//a[@id='linkAccountDownloads']/span");

        //check header and footer.
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check does exist header "My download"
        $this->assertElementPresent("css=h1.page-head");

        // Check does exist info message  "You have not ordered any files yet. "
        $this->assertElementPresent("css=div.box.info");

        // Check does exist My download content
        $this->assertElementPresent("css=div.content");
        $this->open( shopURL . "en/Downloads/" );
        $this->clickAndWait( 'link=Online shops with OXID eShop' );

        // Add product related with "download product" to basket
        $this->clickAndWait("id=toBasket");

        // open second product and add to basket
        //Open Harness MADTRIXX
        $this->open( shopURL . 'index.php?cl=details&anid=05848170643ab0deb9914566391c0c63' );
        $this->clickAndWait("id=toBasket");
        $this->clickAndWait("id=minibasketIcon");

        // Go to 2 basket step
        $this->clickAndWait("css=input.btn.nextStep");

        // Go to 3 basket step
        $this->clickAndWait("id=userNextStepBottom");

        // Go to 4 basket step
        $this->clickAndWait("id=paymentNextStepBottom");
        $this->click( "id=checkAgbTop" );
        $this->clickAndWait("css=li > button.btn");
        $this->clickAndWait("link=My account");

        // Open My downloads page
        $this->clickAndWait("//a[@id='linkAccountDownloads']/span");

        // Check does exist My download content
        $this->assertElementPresent("css=div.content");

        // Check does exist link for download product
        $this->assertElementPresent("link=ch03.pdf");
        $this->assertElementPresent("//div[@id='page']/div/div/ul/li/dl/dd");
        $this->assertElementPresent("//div[@id='page']/div/div/ul/li/dl/dt/strong");

        // Check does exist My download header
        $this->assertElementPresent("css=h1.page-head");
    }

    /**
     * testing all Newsletter Settings page elements
     * @group mobile
     */
    public function testNewsletterSettings()
    {
        $this->openShop();
        $this->loginInFrontendMobile();

        // Going to Newsletter settings page
        $this->clickAndWait("id=linkAccountNewsletter");

        //check header and footer.
        $this->testHeader( false );
        $this->testFooter( false, true );

        // Check header "newsletter settings"
        $this->assertElementPresent("id=newsletterSettingsHeader");

        // Check content
        $this->assertElementPresent("css=div.content");

        // Check label with name "Newsletter subscription:"
        $this->assertEquals("Subscribe to the newsletter", $this->getText("//form[@name='newsletter']//ul/li/label"));

        // Check does exist dropdown
        $this->assertElementPresent("css=div.dropdown-toggle");
        $this->click("css=div.dropdown-toggle");
        $this->click("link=Yes");
        $this->click("css=div.dropdown-toggle");
        $this->click("link=No");
        $this->clickAndWait("id=newsletterSettingsSave");

        // Check success message  "The Newsletter subscription has been canceled successful"
        $this->assertElementPresent("css=div.alert.alert-success");

        // Checking button "SAVE"
        $this->assertElementPresent("id=newsletterSettingsSave");
        $this->clickAndWait("id=newsletterSettingsSave");

        $sNewsletterCancelText = $this->getText("//form[@name='newsletter']//ul/li[3]/p");
        $this->assertTrue("It's possible to cancel the newsletter at any time." == $sNewsletterCancelText);

        // Check does exist message "You have just been sent a confirmation e-mail, with which you can activate your subscription."
        $this->click("css=div.dropdown-toggle");
        $this->click("link=Yes");
        $this->clickAndWait("id=newsletterSettingsSave");
    }

    /**
     * testing all order history page elements
     *
     * @group mobile
     */
    public function testOrderHistory()
    {
        $this->_makeOrder();
        $this->open( shopURL . "en/order-history/" );
        //check header and footer.
        $this->testHeader( false );
        $this->testFooter( false, true );

        //$this->loginInFrontendMobile();
        $this->open( shopURL . "en/order-history/" );

        // Check does exist "ORDER HISTORY " header.
        $this->assertElementPresent("//div[@id='page']/div/h1");
        // Check does exist element order date.
        $this->assertElementPresent("//span[@id='accOrderDate_12']");

        // Check does exist order no.
        $this->assertElementPresent("//ul[@id='orderList']/li/ul/li/strong");
        $this->assertElementPresent("css=ul.order-history-details > li");
        $this->assertElementPresent("id=accOrderNo_12");

        // Check does exist Order status.
        $this->assertElementPresent("//li[2]/strong");
        $this->assertElementPresent("//span[@id='accOrderStatus_12']/span");
        $this->assertElementPresent("//ul[@id='orderList']/li/ul/li[2]");

        // Check does shipment to:
        $this->assertElementPresent("//ul[@id='orderList']/li/ul/li[3]/strong");
        $this->assertElementPresent("//span[@id='accOrderName_12']");
        $this->assertElementPresent("//ul[@id='orderList']/li/ul/li[3]");

        // Check does exist product in ORDER HISTORY list.
        $this->assertElementPresent("css=ul.order-history-articles");
        $this->assertElementPresent("css=ul.order-history-articles > li");
        $this->assertElementPresent("id=accOrderLink_12_1");

        // Check does exist (order history details) style.
        $this->assertElementPresent("css=ul.order-history-details");
        // Check if back button exist.
        $this->isElementPresent("a[css=.back]");
    }


    /**
     * testing all 3 basket step page elements
     * @group mobile
     */
    public function test3BasketStep()
    {
        /// Go to product Transport container BARREL details page
        $this->open( shopURL . "index.php?cl=details&anid=f4f73033cf5045525644042325355732" );

        // Add product to basket
        $this->clickAndWait("id=toBasket");

        // Go to basket
        $this->clickAndWait("id=minibasketIcon");
        $this->type("id=am_1", "2");
        $this->clickAndWait("id=basketUpdate");

        // Go to 2nd basket step
        $this->clickAndWait("//div[@id='btnNextStepBottom']/form/input[4]");

        // Login to shop
        $this->type("name=lgn_usr", self::TEST_USER_NAME);
        $this->type("name=lgn_pwd", self::TEST_USER_PASSWORD);

        // Click login button
        $this->clickAndWait("css=input.btn");

        // Go to 03 basket step
        $this->clickAndWait("id=userNextStepBottom");

        //check header and footer
        $this->testHeader( false, false );
        $this->testFooter( false, true );

        // Check does exist "Standard" dropdown
        $this->assertElementPresent("css=div.dropdown-toggle");
        $this->click("css=div.dropdown-toggle");
        $this->clickAndWait("link=Example Set1: UPS 48 hours");

        // Check does exist Shipping cost
        $this->assertElementPresent("//div[@id='shipSetCost']");
        $this->click("//div[@id='paymentMethods']/div");

        // Select of dropdown payment methot "Credit Card"
        $this->click("//div[@id='paymentMethods']/ul/li/a");

        // Check does exist payment method label
        $this->assertElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li/label");

        // Check does exist note "If different from Billing Address."
        $this->assertElementPresent("css=div.note");

        // Check does exist label"Account Holder:"
        $this->assertElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[3]/input[@placeholder='Account holder']");

        // Check does exist "Account Holder"input name
        $this->assertElementPresent("css=input[name=\"dynvalue[kkname]\"]");

        // Check does exist "Valid until" label
        $this->assertElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[4]/label");

        // Check does exist Valid date month dropdown
        $this->assertElementPresent("css=div.card-valid-date-field.card-valid-date-month > div.dropdown > div.dropdown-toggle");
        $this->assertElementPresent("id=cardValidDateMonthSelected");

        // Check does exist dropdown icon
        $this->assertElementPresent("css=div.card-valid-date-field.card-valid-date-month > div.dropdown > div.dropdown-toggle > #dLabelCardValidDateMonthSelected > i.glyphicon-chevron-down");

        // Check does exist valid date for year
        $this->assertElementPresent("css=div.card-valid-date-field.card-valid-date-year > div.dropdown > div.dropdown-toggle");
        $this->assertElementPresent("css=div.card-valid-date-field.card-valid-date-year > div.dropdown > div.dropdown-toggle > #dLabelCardValidDateYearSelected > i.glyphicon-chevron-down");
        $this->assertElementPresent("id=cardValidDateYearSelected");

        // Check does exist "/ "element
        $this->assertElementPresent("css=div.card-valid-date-field.card-valid-date-divider");

        // Check does exist label element for   " CVV2 or CVC2 security code:"
        $this->assertElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[5]/input[@placeholder='CVV2 or CVC2 security code']");

        // Check does exist valid note ""The CVV2/CVC2 three-digit value is printed just above the ..."
        $this->assertElementPresent("//div[@id='paymentOption_oxidcreditcard']/ul/li[5]/div");

        // Check does exist payment desc
        $this->assertElementPresent("css=div.payment-desc");
        $this->click("css=div.dropdown-toggle");

        // Choose shipping method "Standart"
        $this->clickAndWait("css=li.dropdown-option.selected > a");
        $this->assertElementPresent("css=i.glyphicon-chevron-down");

        // Check does exist button "CONTINUE"
        $this->assertElementPresent("id=paymentNextStepBottom");

        // Check does exist button "PREVIOUS STEP"
        $this->assertElementPresent("id=paymentBackStepBottom");

        // Choose payment method Cash in advance
        $this->click("id=shippingSelected");
        $this->clickAndWait("link=Standard");
        $this->click("//div[@id='paymentMethods']/div");
        $this->click("link=Cash in advance");

        // Check does exist 3 basket steps, as active
        $this->assertElementPresent("css=li.step3.active  > a > span.step-name");

        // Choose payment method COD (Cash on Delivery)
        $this->click("//div[@id='paymentMethods']/div");
        $this->click("link=COD (Cash on Delivery)");

        // Check does exist label "7,50 ? COD Charge "
        $this->assertElementPresent("css=div.payment-charge");

        // Check does exist all basket button
        $this->assertElementPresent("css=span.step-number");
        $this->assertElementPresent("css=li.step2.passed  > a > span.step-number");
        $this->assertElementPresent("css=li.step3.active  > a > span.step-name");
        $this->assertElementPresent("css=li.step4");
        $this->assertElementPresent("css=span.step-number.last");
    }

    /**
     * testing all CMS page elements
     * @group mobile
     */
    public function testCmsPage()
    {
        $this->openShop();

        // Click on CMS page "About us"
        $this->clickAndWait("//a[contains(text(),'About Us')]");

        //check header and footer
        $this->testHeader( false );
        $this->testFooter( false );

        // Check does exist header ABOUT US
        $this->assertElementPresent("css=h1.page-head");

        // Check does exist about us content
        $this->assertElementPresent("css=div.content");

        // Check does exist element for text "Add provider identification here."
        $this->assertElementPresent("css=p");

        // Go to second cms page "TERM AND CONDITIONS"
        $this->clickAndWait("link=Terms and Conditions");

        // Check does exist header name Term and conditions
        $this->assertElementPresent("css=h1.page-head");

        // Check does exist cms content
        $this->assertElementPresent("css=div.content");

        // check or works cms page "privacy policy" link
        $this->clickAndWait("link=Privacy Policy");
    }
    /**
     * login customer by using login fly out form.
     *
     * @param string $userName user name (email).
     * @param string $userPass user password.
     * @param boolean $waitForLogin if needed to wait until user get logged in.
     */
    public function loginInFrontendMobile($userName = self::TEST_USER_NAME, $userPass = self::TEST_USER_PASSWORD, $waitForLogin = true)
    {
        $this->selectWindow(null);
        $this->clickAndWait("//a[text()='Login']");
        $this->type("//input[@id='loginUser']", $userName);
        $this->type("//input[@id='loginPwd']", $userPass);
        if ($waitForLogin) {
            $this->clickAndWait("//form[@name='login']//input[@type='submit']", 1);
        } else {
            $this->clickAndWait("//form[@name='login']//input[@type='submit']");
        }
    }
    /**
     * PersParam functionality in frontend
     * PersParam functionality in admin
     * testing option 'Product can be customized' from Administer products -> Extend tab
     * @group navigation
     * @group order
     * @group basketfrontend
     */
    public function testFrontendPersParamSaveBasketMobile()
    {
        // Active option (Product can be customized) for product with ID 1000
        $aArticleParams = array("oxisconfigurable" => 1);
        $this->callShopSC("oxArticle", "save", "1000", $aArticleParams, 1);

        // Active config option (Don't save Shopping Carts of registered Users)
        $this->callShopSC("oxConfig", "saveShopConfVar", null, array("blPerfNoBasketSaving" => array("type" => "bool", "value" => '')));

        // Go to shop and add to basket products with ID 1000 and 1001
        $this->openShop();
        $this->loginInFrontendMobile();
        $this->searchFor("1001");
        $this->clickAndWait("link=Test product 1 [EN] šÄßüл");
        $this->selectVariantMobile("productSelections", 2, "selvar2 [EN] šÄßüл");
        $this->clickAndWait("toBasket");
        $this->selectVariantMobile("productSelections", 4, "selvar4 [EN] šÄßüл +2%");
        $this->clickAndWait("toBasket");
        $this->searchFor("1000");
        $this->clickAndWait("id=productPrice_searchList_1");
        $this->assertTrue($this->isElementPresent("persparam[details]"),"persparam field should be visible");
        $this->clickAndWait("toBasket");
        $this->type("persparam[details]", "test label šÄßüл");
        $this->clickAndWait("toBasket");

        // Go to basket:check basket info; update product PersParam info and quantity;
        $this->openBasket();
        $this->assertEquals("Test product 1 [EN] šÄßüл", $this->getText("//li[@id='cartItem_1']/div/h4/a"));
        $this->assertEquals("selvar2 [EN] šÄßüл", $this->getText("//div[@id='cartItemSelections_1']//span"));
        $this->assertEquals("Test product 1 [EN] šÄßüл", $this->getText("//li[@id='cartItem_2']/div/h4/a"));
        $this->assertEquals("selvar4 [EN] šÄßüл +2%", $this->getText("//div[@id='cartItemSelections_2']//span"));
        $this->assertEquals("Test product 0 [EN] šÄßüл", $this->getText("//li[@id='cartItem_3']/div/h4/a"));
        $this->assertEquals("Test product 0 [EN] šÄßüл", $this->getText("//li[@id='cartItem_4']/div/h4/a"));
        $this->assertEquals("", $this->getValue("//li[@id='cartItem_3']/div/p[2]/input"));
        $this->selectVariantMobile("cartItemSelections_1", 3, "selvar3 [EN] šÄßüл -2,00 €");
        $this->type("am_3", "2");
        $this->type("//li[@id='cartItem_4']/div/p[2]/input", "test label šÄßüл 1");
        $this->clickAndWait("basketUpdate");

        // Check basket info after update
        $this->assertEquals("selvar3 [EN] šÄßüл -2,00 €", $this->getText("//div[@id='cartItemSelections_1']//span"));
        $this->assertEquals("selvar4 [EN] šÄßüл +2%", $this->getText("//div[@id='cartItemSelections_2']//span"));
        $this->assertEquals("", $this->getValue("//li[@id='cartItem_3']/div/p[2]/input"));
        $this->assertEquals("2", $this->getValue("am_3"));
        $this->assertEquals("test label šÄßüл 1", $this->getValue("//li[@id='cartItem_4']/div/p[2]/input"));
        $this->assertEquals("1", $this->getValue("am_4"));

        // Checking if modified basket was saved
        $this->openShop();
        $this->clearCache();
        $this->assertElementNotPresent("//div[@id='miniBasket']/span");
        $this->loginInFrontendMobile();
        $this->assertEquals("5 Basket", $this->getText("id=miniBasket"));

        // Open basket and modify it once again
        $this->openBasket();
        $this->type("am_2", "2");
        $this->clickAndWait("basketUpdate");
        $this->assertEquals("selvar3 [EN] šÄßüл -2,00 €", $this->getText("//div[@id='cartItemSelections_3']//span"));
        $this->assertEquals("selvar4 [EN] šÄßüл +2%", $this->getText("//div[@id='cartItemSelections_4']//span"));
        $this->assertEquals("", $this->getValue("//li[@id='cartItem_1']/div/p[2]/input"));
        $this->assertEquals("2", $this->getValue("am_1"));
        $this->assertEquals("test label šÄßüл 1", $this->getValue("//li[@id='cartItem_2']/div/p[2]/input"));
        $this->assertEquals("1", $this->getValue("am_4"));
        $this->assertElementNotPresent("cartItem_5");

        // Submitting order
        $this->clickAndWait("//input[@value='Continue']");
        $this->clickAndWait("//input[@id='userNextStepTop']");
        $this->clickAndWait("//input[@value='Continue']");
        $this->assertEquals("Test product 1 [EN] šÄßüл", $this->getText("//li[@id='cartItem_3']/div/h4/a"));
        $this->assertEquals("selvar3 [EN] šÄßüл -2,00 €", $this->getText("//div[@id='cartItemSelections_3']//span"));
        $this->assertEquals("Test product 1 [EN] šÄßüл", $this->getText("//li[@id='cartItem_4']/div/h4/a"));
        $this->assertEquals("selvar4 [EN] šÄßüл +2%", $this->getText("//div[@id='cartItemSelections_4']//span"));
        $this->assertEquals("Test product 0 [EN] šÄßüл", $this->getText("//li[@id='cartItem_1']/div/h4/a"));
        $this->assertEquals("Test product 0 [EN] šÄßüл", $this->getText("//li[@id='cartItem_2']/div/h4/a"));
        $this->assertElementNotPresent("cartItem_5");
        $this->assertEquals("Label test label šÄßüл 1", $this->clearString($this->getText("//li[@id='cartItem_2']/div/p[2]")));
        $this->assertEquals("Grand total 379,40 €", $this->getText("basketGrandTotal"),"Grand total price changed or did't displayed");
        $this->check("//form[@id='orderConfirmAgbTop']//input[@name='ord_agb' and @value='1']");
        $this->clickAndWait("//form[@id='orderConfirmAgbTop']//button");

        //checking in Admin
        $this->loginAdmin("Administer Orders", "Orders");
        $this->openListItem("link=12", "save");
        $this->assertTextPresent("Label: test label šÄßüл 1");
        $this->assertEquals("2 *", $this->getText("//table[2]/tbody/tr/td[1]"));
        $this->assertEquals("Test product 0 [EN]", $this->getText("//td[3]"));
        $this->assertEquals("90,00 EUR", $this->getText("//td[5]"));
        $this->assertTextPresent("Label: test label šÄßüл 1");
        $this->frame("list");
        $this->openTab("Products");
        $this->assertEquals("2", $this->getValue("//tr[@id='art.2']/td[1]/input"));
        $this->assertEquals("Label: test label šÄßüл 1", $this->getText("//tr[@id='art.2']/td[5]"));
        $this->assertEquals("45,00 EUR", $this->getText("//tr[@id='art.2']/td[7]"));
        $this->assertEquals("90,00 EUR", $this->getText("//tr[@id='art.2']/td[8]"));

        //Disabling option (Product can be customized) where product ID is `OXID` = '1000
        $aArticleParams = array("oxisconfigurable" => 0);
        $this->callShopSC("oxArticle", "save", "1000", $aArticleParams, 1);

        //Check if persparam field is not available in shop after it was disabled
        $this->openShop();
        $this->searchFor("1000");
        $this->clickAndWait("//ul[@id='searchList']/li//a");
        $this->assertFalse($this->isElementPresent("persparam[details]"),"persparam field should not be visible");
    }
    /**
     * simple user account opening
     * @group user
     * @group registration
     */
    public function testStandardUserRegistrationMobile()
    {
        //creating user
        $this->openShop();
        $this->clickAndWait("link=My account");
        $this->clickAndWait("id=openAccountLink");
        $this->assertEquals("Open account", $this->getText("id=openAccHeader"));
        $this->type("userLoginName", "birute01@nfq.lt");
        $this->type("userPassword", "user11");
        $this->type("userPasswordConfirm", "user11");
        $this->type("invadr[oxuser__oxfname]", "user1 name_šÄßü?");
        $this->type("invadr[oxuser__oxlname]", "user1 last name_šÄßü?");
        $this->type("invadr[oxuser__oxcompany]", "user1 company_šÄßü?");
        $this->type("invadr[oxuser__oxstreet]", "user1 street_šÄßü?");
        $this->type("invadr[oxuser__oxstreetnr]", "1");
        $this->type("invadr[oxuser__oxzip]", "11");
        $this->type("invadr[oxuser__oxcity]", "user1 city_šÄßü?");
        $this->type("invadr[oxuser__oxustid]", "");
        $this->type("invadr[oxuser__oxaddinfo]", "user1 additional info_šÄßü?");
        $this->assertElementNotVisible("id=stateSelected");
        $this->click("//a[@id='invCountryLabel']/i");
        $this->waitForItemAppear("//a[contains(text(),'Germany')]");
        $this->click("link=Germany");
        $this->click("//a[@id='dLabel_oxSelect_invCountry']/i");
        $this->waitForItemAppear("//a[contains(text(),'Berlin')]");
        $this->click("link=Berlin");
        $this->type("invadr[oxuser__oxfon]", "111-111");
        $this->type("invadr[oxuser__oxfax]", "111-111-111");
        $this->type("invadr[oxuser__oxmobfon]", "111-111111");
        $this->type("invadr[oxuser__oxprivfon]", "111111111");
        $this->click("xpath=(//button[@type='button'])[2]");
        $this->click("xpath=(//button[@type='button'])[4]");
        $this->click("xpath=(//button[@type='button'])[6]");
        $this->clickAndWait("accUserSaveTop");
        $this->assertTextPresent("We welcome you as registered user!");
        $this->loginAdmin("Administer Users", "Users");
        $this->type("where[oxuser][oxlname]", "user1");
        $this->clickAndWait("submitit");
        $this->assertEquals("user1 last name_šÄßü? user1 name_šÄßü?", $this->getText("//tr[@id='row.1']/td[1]"));
        $this->openListItem("link=user1 last name_šÄßü? user1 name_šÄßü?");
        $this->assertEquals("on", $this->getValue("editval[oxuser__oxactive]"));
        $this->assertEquals("birute01@nfq.lt", $this->getValue("editval[oxuser__oxusername]"));
        $this->assertEquals("user1 name_šÄßü?", $this->getValue("editval[oxuser__oxfname]"));
        $this->assertEquals("user1 last name_šÄßü?", $this->getValue("editval[oxuser__oxlname]"));
        $this->assertEquals("user1 company_šÄßü?", $this->getValue("editval[oxuser__oxcompany]"));
        $this->assertEquals("user1 street_šÄßü?", $this->getValue("editval[oxuser__oxstreet]"));
        $this->assertEquals("1", $this->getValue("editval[oxuser__oxstreetnr]"));
        $this->assertEquals("11", $this->getValue("editval[oxuser__oxzip]"));
        $this->assertEquals("user1 city_šÄßü?", $this->getValue("editval[oxuser__oxcity]"));
        $this->assertEquals("", $this->getValue("editval[oxuser__oxustid]"));
        $this->assertEquals("user1 additional info_šÄßü?", $this->getValue("editval[oxuser__oxaddinfo]"));
        $this->assertEquals("Germany", $this->getSelectedLabel("editval[oxuser__oxcountryid]"));
        $this->assertEquals("BE", $this->getValue("editval[oxuser__oxstateid]"));
        $this->assertEquals("111-111", $this->getValue("editval[oxuser__oxfon]"));
        $this->assertEquals("111-111-111", $this->getValue("editval[oxuser__oxfax]"));
        $this->assertTrue((int)$this->getValue("editval[oxuser__oxbirthdate][day]")> 0);
        $this->assertTrue((int)$this->getValue("editval[oxuser__oxbirthdate][month]")> 0);
        $this->assertTrue((int)$this->getValue("editval[oxuser__oxbirthdate][year]") > 0);
        $this->assertTextPresent("Yes");
        $this->frame("list");
        $this->openTab("Extended");
        $this->assertEquals("111111111", $this->getValue("editval[oxuser__oxprivfon]"));
        $this->assertEquals("111-111111", $this->getValue("editval[oxuser__oxmobfon]"));
    }
    /**
     * Administer Products -> Products (variants should inherit parents selection lists)
     * @group admin
     * @group adminFunctionality
     */
    public function testVariantsInheritsSelectionListsMobile()
    {
        /* if ( OXID_VERSION_EE ) : */
        if (isSUBSHOP) {
            $this->executeSql( "UPDATE `oxarticles` SET `OXSHOPID` = ".oxSHOPID.", `OXSHOPINCL` = ".oxSHOPID." WHERE 1" );
            $this->executeSql( "UPDATE `oxselectlist` SET `OXSHOPID` = ".oxSHOPID.", `OXSHOPINCL` = ".oxSHOPID."  WHERE 1" );
        }
        /* endif; */
        //assigning selection list to parent product
        $this->loginAdmin("Administer Products", "Products");
        $this->selectAndWaitFrame("changelang", "label=Deutsch", "edit");
        $this->type("where[oxarticles][oxartnum]", "1002");
        $this->clickAndWait("submitit", "link=1002");
        $this->openListItem("link=1002");
        $this->assertEquals("[DE 2] Test product 2 šÄßü?", $this->getValue("editval[oxarticles__oxtitle]"));
        $this->Frame("list");
        $this->openTab("Selection");
        $this->click("//input[@value='Assign Selection Lists']");
        $this->usePopUp();
        $this->type("_0", "*test");
        $this->keyUp("_0", "t");
        $this->waitForAjax("test selection list [DE] šÄßü?", "//div[@id='container1_c']/table/tbody[2]/tr[1]/td[1]");
        $this->dragAndDrop("//div[@id='container1_c']/table/tbody[2]/tr[1]/td[1]", "container2");
        $this->waitForAjax("test selection list [DE] šÄßü?", "//div[@id='container2_c']/table/tbody[2]/tr[1]/td[1]");
        $this->close();
        $this->selectWindow(null);
        $this->windowMaximize(null);
        $this->frame("list");
        $this->openTab("Main");

        //checking if selection list is assigned to variant also
        $this->selectAndWaitFrame( "art_variants", "label=- var1 [DE]", "list");
        $this->assertEquals("1002-1", $this->getValue("editval[oxarticles__oxartnum]"));
        $this->Frame("list");
        $this->openTab("Selection");
        $this->click("//input[@value='Assign Selection Lists']");
        $this->usePopUp();
        $this->assertEquals("test selection list [DE] šÄßü?", $this->getText("//div[@id='container2_c']/table/tbody[2]/tr[1]/td[1]"));
        $this->close();

        //checking if in frontend it is displayed correctly
        $this->openShop();
        $this->searchFor("1002");
        $this->clickAndWait("id=productPrice_searchList_1");
        $this->assertEquals("selvar1 [EN] šÄßü? +1,00 € selvar2 [EN] šÄßüл selvar3 [EN] šÄßü? -2,00 € selvar4 [EN] šÄßü? +2%", $this->clearString($this->getText("//div[@id='productSelections']//ul")));
        $this->assertEquals("Test product 2 [EN] šÄßü?", $this->getText("//div[@id='detailsMain']/div/div[2]/div"));

        $this->selectMultiMobile("variants", 1, 1);
        $this->selectMultiMobile("variants", 1, 3);
        $this->clickAndWait("toBasket");
        $this->selectMultiMobile("variants", 1, 2);

        $this->clickAndWait("toBasket");
        $this->openBasket();
        $this->assertEquals("Test product 2 [EN] šÄßü?, var2 [EN] šÄßü?", $this->clearString($this->getText("//li[@id='cartItem_1']/div/h4/a")));

    }
    /**
     * Checking Multidimensional variants functionality
     * @group navigation
     * @group product
     */
    public function testFrontendMultidimensionalVariantsOnDetailsPageMobile()
    {
        //multidimensional variants on
        //active product WHERE `OXID`='10014'
        $aArticleParams = array("oxactive" => 1);
        $this->callShopSC("oxArticle", "save", "10014", $aArticleParams, 1);
        $this->openShop();
        $this->searchFor("10014");

        $this->clickAndWait("link=14 EN product šÄßü?");
        $this->assertEquals("13 EN description šÄßü?", $this->getText("//div[@id='detailsMain']/div/div[2]/div[2]"));
        $this->assertEquals("from 15,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));
        $this->assertElementNotEditable("toBasket");

        $this->assertEquals("size[EN] Choose variant", $this->getText("//a[@id='dLabelSelectBox_varselid_0']/span"));
        $this->assertEquals("S M L", $this->getText("//ul[@id='variants']/li/div//ul"));
        $this->assertEquals("color Choose variant", $this->getText("//ul[@id='variants']/li[2]/div/div"));
        $this->assertEquals("black white red", $this->getText("//ul[@id='variants']/li[2]/div/ul"));
        $this->assertEquals("type Choose variant", $this->getText("//ul[@id='variants']/li[3]/div/div"));
        $this->assertEquals("lether material", $this->getText("//ul[@id='variants']/li[3]/div/ul/"));
        $this->selectMultiMobile("variants", 1, 1);
        $this->assertElementNotEditable("toBasket");
        $this->selectMultiMobile("variants", 2, 1);
        $this->assertElementNotEditable("toBasket");
        $this->selectMultiMobile("variants", 3, 1);
        $this->assertEquals("25,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));
        $this->assertElementEditable("toBasket");
        //Select  white
        $this->selectMultiMobile("variants", 2, 3);

        //Select S
        $this->selectMultiMobile("variants", 1, 1);
        $this->assertEquals("15,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));
        $this->assertElementEditable("toBasket");

        // selects black
        $this->selectMultiMobile("variants", 2, 2);
        $this->assertElementNotEditable("toBasket");

        // selects material
        $this->selectMultiMobile("variants", 3, 2);
        $this->assertElementEditable("toBasket");
        $this->assertEquals("15,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));

        //Selected combination: S, black, material
        $this->selectMultiMobile("variants", 3, 3);
        $this->assertEquals("15,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));
        $this->assertElementEditable("toBasket");

        //Selected combination: M
        $this->selectMultiMobile("variants", 1, 2);
        $this->assertElementEditable("toBasket");

        //Selected combination: M, red
        $this->selectMultiMobile("variants", 2, 3);
        $this->selectMultiMobile("variants", 1, 2);
        $this->assertEquals("15,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));
        $this->assertElementEditable("toBasket");

        //Selected combination: S, red"
        $this->selectMultiMobile("variants", 1, 2);
        $this->assertElementEditable("toBasket");

        //Selected combination: S, black
        $this->selectMultiMobile("variants", 2, 2);
        $this->assertElementNotEditable("toBasket");

        //Selected combination: S, black, leather"
        $this->selectMultiMobile("variants", 3, 1);
        $this->assertEquals("25,00 € *", $this->getText("//div[@id='detailsMain']/div[3]/div/div/div/strong"));
        $this->assertElementEditable("toBasket");
        $this->type("amountToBasket", "2");
        $this->clickAndWait("toBasket");

        //Go to basket
        $this->openBasket();
        $this->assertEquals("14 EN product šÄßü?, S | black | lether", $this->clearString($this->getText("//li[@id='cartItem_1']/div/h4/a")));
        $this->assertEquals("2", $this->getValue("am_1"));
        $this->assertElementNotPresent("cartItem_2");
        $this->assertEquals("50,00 €", $this->getText("//tr[@id='basketGrandTotal']/td/strong"));
    }
    /**
     * Checking search and sorting in frontend
     * @group navigation
     * @group product
     */
    public function testSearchAndSortingMobile()
    {

        $this->openShop();

        $this->searchFor("100");
        $this->assertEquals("Test product 0 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li/form/div[2]/h4/a/span"));
        $this->assertEquals("Test product 3 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li[4]/form/div[2]/h4/a/span"));
       //soring by title
        $this->click("css=i.glyphicon-chevron-down");
        $this->clickAndWait("css=i.glyphicon-arrow-down");

        $this->assertEquals("Test product 3 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li/form/div[2]/h4/a/span"));
        $this->assertEquals("Test product 0 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li[4]/form/div[2]/h4/a/span"));

        $this->click("css=i.glyphicon-chevron-down");
        $this->clickAndWait("css=i.glyphicon-arrow-up");

        $this->assertEquals("Test product 0 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li/form/div[2]/h4/a/span"));
        $this->assertEquals("Test product 3 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li[4]/form/div[2]/h4/a/span"));

        $this->click("css=i.glyphicon-chevron-down");
        $this->clickAndWait("//div[@id='sortItems']/div/ul/li[2]/span[2]/a/i");

        $this->assertEquals("Test product 1 [EN] šÄßüл", $this->getText("//ul[@id='searchList']/li/form/div[2]/h4/a/span"));
        $this->assertEquals("Test product 0 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li[4]/form/div[2]/h4/a/span"));

        $this->click("css=i.glyphicon-chevron-down");
        $this->clickAndWait("//div[@id='sortItems']/div/ul/li[2]/span[2]/a[2]/i");
        $this->assertEquals("Test product 0 [EN] šÄßü?", $this->getText("//ul[@id='searchList']/li/form/div[2]/h4/a/span"));
        $this->assertEquals("Test product 1 [EN] šÄßüл", $this->getText("//ul[@id='searchList']/li[4]/form/div[2]/h4/a/span"));
}
    /**
     * selects specified value from dropdown (for multidimensional variants).
     *
     * @param string $elementId  container id.
     * @param int    $elementNr  select list number (e.g. 1, 2).
     */
    public function selectVariantMobile($elementId, $elementNr)
    {
        $this->assertTrue($this->isElementPresent($elementId));
        $this->assertElementNotVisible("//div[@id='".$elementId."']/div//ul/li[".$elementNr."]");
        $this->click("//div[@id='".$elementId."']/div/div");
        $this->waitForItemAppear("//div[@id='".$elementId."']/div//ul/li[".$elementNr."]");
        $this->click("//div[@id='".$elementId."']/div//ul/li[".$elementNr."]");
    }


    /**
     * selects specified value from dropdown (for multidimensional variants).
     *
     * @param string $elementId  container id.
     * @param int    $elementRow  select list number (e.g. 1, 2).
     * * @param int    $elementNr  select list number (e.g. 1, 2).
     */
    public function selectMultiMobile($elementId, $elementRow, $elementNr)
    {
        $this->assertTrue($this->isElementPresent($elementId));
        $this->assertElementNotVisible("//ul[@id='".$elementId."']/li[".$elementRow."]/div/ul/li[".$elementNr."]");
        $this->click("//ul[@id='".$elementId."']/li[".$elementRow."]/div/div");
        $this->waitForItemAppear("//ul[@id='".$elementId."']/li[".$elementRow."]/div//ul/li[".$elementNr."]");
        $this->click("//ul[@id='".$elementId."']/li[".$elementRow."]/div/ul/li[".$elementNr."]/a");
        $this->waitForItemDisappear("//ul[@id='".$elementId."']/li[".$elementRow."]/div//ul/li[".$elementNr."]");
    }
    /**
     * opens basket.
     */
    public function openBasket( $language = "English" )
    {
        $this->click("id=minibasketIcon");
        $this->waitForItemAppear("id=basketGrandTotal");
    }

    /**
     * Makes order.
     */
    protected function _makeOrder()
    {
        $this->openShop();
        $this->loginInFrontendMobile();

        // Open details page of Test product 1
        $this->open( shopURL . "index.php?cl=details&anid=1001" );

        // Add product to basket
        $this->clickAndWait( "id=toBasket" );

        // Go to basket
        $this->clickAndWait( "id=minibasketIcon" );

        // Go to 2nd basket step
        $this->clickAndWait( "//input[@value='Continue']" );

        // Go to 03 basket step
        $this->clickAndWait( "id=userNextStepTop" );

        // Go to 04 basket step
        $this->clickAndWait( "//input[@value='Continue']" );

        // Click button Continue
        $this->click( "id=checkAgbTop" );
        $this->clickAndWait( "//button[@type='submit']" );
    }

}
