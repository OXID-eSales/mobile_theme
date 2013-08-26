[{assign var="dynvalue" value=$oView->getDynValue()}]
[{assign var="iPayError" value=$oView->getPaymentError()}]
<div id="paymentOption_[{$sPaymentID}]" class="payment-option [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]active-payment[{/if}]">
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked="checked"[{/if}] />
    <ul class="form">
        <li>
            <input id="payment_[{$sPaymentID}]_1" class="js-oxValidate js-oxValidate_notEmpty" type="text" size="20" maxlength="64" name="dynvalue[lsbankname]" autocomplete="off" value="[{$dynvalue.lsbankname}]" placeholder="[{oxmultilang ident="BANK"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li [{if $iPayError == -4}]class="invalid-field"[{/if}]>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsblz]" autocomplete="off" value="[{$dynvalue.lsblz}]" placeholder="[{oxmultilang ident="BANK_CODE"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li [{if $iPayError == -5}]class="invalid-field"[{/if}]>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktonr]" autocomplete="off" value="[{$dynvalue.lsktonr}]" placeholder="[{oxmultilang ident="BANK_ACCOUNT_NUMBER"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktoinhaber]" value="[{if $dynvalue.lsktoinhaber}][{$dynvalue.lsktoinhaber}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" placeholder="[{oxmultilang ident="BANK_ACCOUNT_HOLDER"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <li>
                    <div class="payment-desc">
                        [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                    </div>
                </li>
            [{/if}]
        [{/block}]
    </ul>
</div>