[{assign var="dynvalue" value=$oView->getDynValue()}]
<div id="paymentOption_[{$sPaymentID}]" class="paymentOption [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked="checked"[{/if}] />
    <ul class="form">
        <li>
            <label>[{oxmultilang ident="CREDITCARD" suffix="COLON"}]</label>
            <div class="dropdown">
                [{* only to track selection within DOM *}]
                <input type="hidden" id="sCreditCardSelected" name="dynvalue[kktype]" value="mcd" />
                <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <a id="dLabel" role="button" href="#">
                        <span id="creditCardSelected"></span>
                        <i class="glyphicon-chevron-down"></i>
                    </a>
                </div>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="mcd">[{oxmultilang ident="CARD_MASTERCARD"}]</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="vis">[{oxmultilang ident="CARD_VISA"}]</a></li>
                    <!--
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="amx">American Express</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="dsc">Discover</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="dnc">Diners Club</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="jcb">JCB</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="swi">Switch</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="dlt">Delta</a></li>
                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="enr">EnRoute</a></li>
                    -->
                </ul>
                [{if !empty($dynvalue.kktype)}]
                    [{oxscript add="$('#sCreditCardSelected').val('$dynvalue.kktype');"}]
                [{/if}]
            </div>
        </li>
        <li>
            <label>[{oxmultilang ident="NUMBER" suffix="COLON"}]</label>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[kknumber]" autocomplete="off" value="[{$dynvalue.kknumber}]" />
            <p class="oxValidateError">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li>
            <label>[{oxmultilang ident="BANK_ACCOUNT_HOLDER" suffix="COLON"}]</label>
            <input type="text" size="20" class="js-oxValidate js-oxValidate_notEmpty" maxlength="64" name="dynvalue[kkname]" value="[{if $dynvalue.kkname}][{$dynvalue.kkname}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" />
            <p class="oxValidateError">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
            <div class="note">[{oxmultilang ident="IF_DIFFERENT_FROM_BILLING_ADDRESS"}]</div>
        </li>
        <li>
            <label>[{oxmultilang ident="VALID_UNTIL" suffix="COLON"}]</label>
            <div class="cardValidDateWrapper">
                <div class="cardValidDateField cardValidDateMonth">
                    <div class="dropdown">
                        <input type="hidden" id="sCardValidDateMonthSelected" name="dynvalue[kkmonth]" value="01" />
                        <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                            <a id="dLabel" role="button" href="#">
                                <span id="cardValidDateMonthSelected">01</span>
                                <i class="glyphicon-chevron-down"></i>
                            </a>
                        </div>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                            [{section name="iMonth" start=1 loop=13}]
                                [{assign var=sMonth value=$smarty.section.iMonth.index|string_format:"%02d"}]
                                <li class="dropDownOption">
                                    <a tabindex="-1" data-selection-id="[{$sMonth}]">[{$sMonth}]</a>
                                </li>
                                [{if $dynvalue.kkmonth == $sMonth}]
                                    [{oxscript add="$('#sCardValidDateMonthSelected').val('$sMonth');"}]
                                [{/if}]
                            [{/section}]
                        </ul>
                    </div>
                </div>
                <div class="cardValidDateField cardValidDateDivider">/</div>
                <div class="cardValidDateField cardValidDateYear">
                    <div class="dropdown">
                        [{assign var=aYear value=$oView->getCreditYears()}]
                        <input type="hidden" id="sCardValidDateYearSelected" name="dynvalue[kkyear]" value="[{$aYear[0]}]" />
                        <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                            <a id="dLabel" role="button" href="#">
                                <span id="cardValidDateYearSelected"></span>
                                <i class="glyphicon-chevron-down"></i>
                            </a>
                        </div>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                            [{foreach from=$aYear item=iYear}]
                                <li class="dropDownOption">
                                    <a tabindex="-1" data-selection-id="[{$iYear}]">[{$iYear}]</a>
                                </li>
                                [{if $dynvalue.kkyear == $iYear}]
                                    [{oxscript add="$('#sCardValidDateYearSelected').val('$iYear');"}]
                                [{/if}]
                            [{/foreach}]
                        </ul>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <label>[{oxmultilang ident="CARD_SECURITY_CODE" suffix="COLON"}]</label>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[kkpruef]" autocomplete="off" value="[{$dynvalue.kkpruef}]" />
            <p class="oxValidateError">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            </p>
            <div class="note">[{oxmultilang ident="CARD_SECURITY_CODE_DESCRIPTION"}]</div>
        </li>

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
[{oxscript add="$('#paymentOption_$sPaymentID').find('.dropdown').oxDropDown();"}]