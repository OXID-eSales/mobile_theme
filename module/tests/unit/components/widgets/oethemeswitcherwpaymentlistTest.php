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


require_once realpath( "." ).'/unit/OxidTestCase.php';
require_once realpath( "." ).'/unit/test_config.inc.php';

//require_once realpath( "." ).'/../source/modules/oe/oethemeswitcher/components/widgets/oethemeswitcherwpaymentlist.php';

/**
 * Tests for PaymentImages widget
 */
class Unit_Components_Widgets_oeThemeSwitcherWPaymentListTest extends OxidTestCase
{

    /**
     * Check if getPaymentImages returns images when they do exist
     */
    public function testGetPaymentList()
    {
        $sPaymentImageUrl = "baseUrl/products/de/testPayment.png";

        $oConfig = $this->getMock( "oxConfig", array( "getImageUrl" ) );
        $oConfig->expects( $this->any() )
            ->method( 'getImageUrl')
            ->will( $this->returnValue( $sPaymentImageUrl ) );

        $a = new oeThemeSwitcherWPaymentList();

        $oThemeSwitcherWPaymentList = $this->getMock( "oeThemeSwitcherWPaymentList", array( "getConfig" ) );
        $oThemeSwitcherWPaymentList->expects( $this->any() )->method( 'getConfig')->will( $this->returnValue( $oConfig ) );

        $aPayments = $oThemeSwitcherWPaymentList->getPaymentList(0);

        $this->assertNotEmpty($aPayments);

        $aPayment = array_shift($aPayments);

        $this->assertContains($sPaymentImageUrl, $aPayment);
    }
}