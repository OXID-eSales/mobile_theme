[{if $oViewConf->oeThemeSwitcherIsModuleActive('oepaypal', false, '3.0') && $sPaymentID == "oxidpaypal" && $oViewConf->isStandardCheckoutEnabled()}]
    [{oxstyle include=$oViewConf->getModuleUrl('oethemeswitcher','out/mobile/src/css/paypal_mobile.css')}]

    <div id="paymentOption_[{$sPaymentID}]" class="payment-option [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]active-payment[{/if}]">
        <div class="paypalDescBox">
            <a href="#"><img class="paypalPaymentImg" src="[{$oViewConf->getModuleUrl('oethemeswitcher','out/mobile/src/img/')}]paypal-medium.png" border="0" alt="[{oxmultilang ident="OEPAYPAL_PAYMENT_HELP_LINK_TEXT"}]"></a>
            <a href="#" class="paypalHelpIcon">?</a>

            [{assign var="paypalHelpLink" value="OEPAYPAL_PAYMENT_HELP_LINK"|oxmultilangassign}]
            [{oxscript add="$('.paypalPaymentImg, .paypalHelpIcon').click(function (){window.open('`$paypalHelpLink`','olcwhatispaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=500, height=450');return false;});"}]

            [{if $paymentmethod->oxpayments__oxlongdesc|trim}]
            <div class="paypalPaymentDesc">
                [{ $paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
            </div>
            [{/if}]
        </div>

        [{if $oViewConf->sendOrderInfoToPayPal()}]
            <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oViewConf->sendOrderInfoToPayPalDefault() || $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked="checked"[{/if}] />
        [{/if}]
    </div>
[{else}]
    [{ $smarty.block.parent }]
[{/if}]
