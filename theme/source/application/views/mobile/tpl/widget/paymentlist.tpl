[{if $oView->getPaymentList()}]
    <ul class="payment-images">
        [{foreach key=sPaymentID from=$oView->getPaymentList() item=aPayment}]
            [{if $aPayment.OXPAYMENTIMAGE}]
            <li id="paymentOption_[{$sPaymentID}]">
                <img src="[{$aPayment.OXPAYMENTIMAGE}]" title="[{$aPayment.OXDESC}]" alt="[{$aPayment.OXDESC}]"/>
            </li>
            [{/if}]
        [{/foreach}]
    </ul>
[{/if}]