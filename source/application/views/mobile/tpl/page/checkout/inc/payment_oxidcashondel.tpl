<div id="paymentOption_[{$sPaymentID}]" class="paymentOption [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked="checked"[{/if}] />
    <ul class="form">
        [{if $paymentmethod->getPrice()}]
            <li>
                <div class="paymentCharge">
                    [{if $oxcmp_basket->getPayCostNet()}]
                        [{$paymentmethod->getFNettoPrice()}] [{$currency->sign}] [{oxmultilang ident="PLUS_VAT"}] [{$paymentmethod->getFPriceVat()}]
                    [{else}]
                        [{$paymentmethod->getFBruttoPrice()}] [{$currency->sign}]
                    [{/if}]
                    [{oxmultilang ident="COD_CHARGE"}]
                </div>
            </li>
        [{/if}]

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <li>
                    <div class="paymentDesc">
                        [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                    </div>
                </li>
            [{/if}]
        [{/block}]
    </ul>
</div>