[{capture append="oxidBlock_content"}]
[{oxscript include="js/widgets/oxdropdown.js" priority=10}]
<div id="paymentSelect" class="content">

    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=3}]

    [{block name="checkout_payment_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]

        [{block name="change_shipping"}]
            <div class="paymentRow">
                [{if $oView->getAllSets()}]
                    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
                    <form action="[{$oViewConf->getSslSelfLink()}]" name="shipping" id="shipping" method="post">
                        <div>
                            [{$oViewConf->getHiddenSid()}]
                            [{$oViewConf->getNavFormParams()}]
                            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]" />
                            <input type="hidden" name="fnc" value="changeshipping" />
                        </div>
                        <div id="shippingMethods" class="dropdown">
                            <input type="hidden" id="sShipSet" name="sShipSet" value="" />
                            <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                                <a id="dLabel" role="button" href="#">
                                    [{* only to track selection within DOM *}]
                                    <span id="shippingSelected">[{oxmultilang ident="SELECTED_SHIPPING_CARRIER"}]</span>
                                    <i class="glyphicon-chevron-down"></i>
                                </a>
                            </div>
                            [{block name="act_shipping"}]
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                    [{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
                                        [{assign var=sShippingName value=$oShippingSet->oxdeliveryset__oxtitle->value}]
                                        <li class="dropDownOption">
                                            <a tabindex="-1" data-selection-id="[{$sShipID}]">[{$sShippingName}]</a>
                                        </li>
                                        [{if $oShippingSet->blSelected}]
                                            [{oxscript add="$('#sShipSet').val('$sShipID');"}]
                                        [{/if}]
                                    [{/foreach}]
                                </ul>
                            [{/block}]
                        </div>
                        [{if $oxcmp_basket->getDeliveryCosts()}]
                            [{if $oxcmp_basket->getDelCostNet()}]
                            <div id="shipSetCost">
                                <b>[{oxmultilang ident="CHARGES" suffix="COLON"}] [{$oxcmp_basket->getDelCostNet()}] [{$currency->sign}]
                                [{if $oxcmp_basket->getDelCostVat()}]
                                    ([{oxmultilang ident="PLUS_VAT"}]
                                    [{$oxcmp_basket->getDelCostVat()}] [{$currency->sign}])
                                [{/if}]
                                </b>
                            </div>
                            [{else}]
                                <div id="shipSetCost">
                                    <b>[{oxmultilang ident="CHARGES" suffix="COLON"}] [{$oxcmp_basket->getFDeliveryCosts()}] [{$currency->sign}]</b>
                                </div>
                            [{/if}]
                        [{/if}]
                        <div class="lineBlock"></div>
                    </form>
                [{/if}]
            </div>
        [{/block}]

        [{block name="checkout_payment_errors"}]
            [{assign var="iPayError" value=$oView->getPaymentError()}]
            [{if !empty($iPayError)}]
                <div class="paymentRow">
                    [{assign var="sPayErrorClass" value='alert alert-error errContainer'}]
                    [{if $iPayError == 1}]
                        <div class="[{$sPayErrorClass}]">[{oxmultilang ident="ERROR_MESSAGE_COMPLETE_FIELDS_CORRECTLY"}]</div>
                    [{elseif $iPayError == 2}]
                      <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
                    [{elseif $iPayError == 4}]
                        <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_UNAVAILABLE_SHIPPING_METHOD"}]</div>
                    [{elseif $iPayError == 5}]
                        <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT"}]</div>
                    [{elseif $iPayError == 6}]
                       <div class="[{$sPayErrorClass}]">[{oxmultilang ident="TRUSTED_SHOP_UNAVAILABLE_PROTECTION"}]</div>
                    [{elseif $iPayError > 6}]
                    <!--Add custom error message here-->
                       <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT"}]</div>
                    [{elseif $iPayError == -1}]
                       <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT_ERROR" suffix="COLON"}] "[{$oView->getPaymentErrorText()}]").</div>
                    [{elseif $iPayError == -2}]
                       <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_NO_SHIPPING_METHOD_FOUND"}]</div>
                    [{elseif $iPayError == -3}]
                       <div class="[{$sPayErrorClass}]">[{oxmultilang ident="MESSAGE_PAYMENT_SELECT_ANOTHER_PAYMENT"}]</div>
                    [{/if}]
                </div>
            [{/if}]
        [{/block}]

        [{block name="change_payment"}]
            <div class="paymentRow">
                [{oxscript include="js/widgets/oxpayment.js" priority=10}]
                [{oxscript add="$( '#payment' ).oxPayment();"}]
                [{oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
                [{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
                <form action="[{$oViewConf->getSslSelfLink()}]" class="js-oxValidate payment" id="payment" name="order" method="post">
                    <div>
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]" />
                        <input type="hidden" name="fnc" value="validatepayment" />
                    </div>

                    [{if $oView->getPaymentList()}]
                        [{block name="select_payment"}]
                            [{* first loop is to render payment method selection *}]
                            <div id="paymentMethods" class="dropdown">
                                [{* only to track selection within DOM *}]
                                <input type="hidden" id="sPaymentSelected" value="" />
                                <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                                    <a id="dLabel" role="button" href="#">
                                        <span id="paymentSelected">[{oxmultilang ident="PAYMENT_METHOD"}]</span>
                                        <i class="glyphicon-chevron-down"></i>
                                    </a>
                                </div>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                    [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                                        [{assign var=sPaymentName value=$paymentmethod->oxpayments__oxdesc->value}]
                                        <li class="dropDownOption">
                                            <a tabindex="-1" data-selection-id="[{$sPaymentID}]">[{$sPaymentName}]</a>
                                        </li>
                                        [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]
                                            [{oxscript add="$('#sPaymentSelected').val('$sPaymentID');"}]
                                        [{/if}]
                                    [{/foreach}]
                                </ul>
                            </div>
                            [{* second loop is to render payment method details *}]
                            [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                                [{block name="select_payment"}]
                                    [{if $sPaymentID == "oxidcashondel"}]
                                        [{include file="page/checkout/inc/payment_oxidcashondel.tpl"}]
                                    [{elseif $sPaymentID == "oxidcreditcard"}]
                                        [{include file="page/checkout/inc/payment_oxidcreditcard.tpl"}]
                                    [{elseif $sPaymentID == "oxiddebitnote"}]
                                        [{include file="page/checkout/inc/payment_oxiddebitnote.tpl"}]
                                    [{else}]
                                        [{include file="page/checkout/inc/payment_other.tpl"}]
                                    [{/if}]
                                [{/block}]
                            [{/foreach}]
                        [{/block}]

                        [{* TRUSTED SHOPS BEGIN *}]
                        [{include file="page/checkout/inc/trustedshops.tpl"}]
                        [{* TRUSTED SHOPS END *}]

                        [{block name="checkout_payment_nextstep"}]
                            <ul class="form">
                                [{if $oView->isLowOrderPrice()}]
                                    <li><b>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</b></li>
                                [{else}]
                                    <li><input type="submit" id="paymentNextStepBottom" name="userform" class="btn" value="[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]" /></li>
                                    <li><input type="button" id="paymentBackStepBottom" class="btn previous" value="[{oxmultilang ident="PREVIOUS_STEP"}]" onclick="window.open('[{oxgetseourl ident=$oViewConf->getOrderLink()}]', '_self');" /></li>
                                [{/if}]
                            </ul>
                        [{/block}]

                    [{elseif $oView->getEmptyPayment()}]
                        [{block name="checkout_payment_nopaymentsfound"}]
                            <ul class="form">
                                <h3 id="paymentHeader" class="blockHead">[{oxmultilang ident="PAYMENT_INFORMATION"}]</h3>
                                [{oxifcontent ident="oxnopaymentmethod" object="oCont"}]
                                    [{$oCont->oxcontents__oxcontent->value}]
                                [{/oxifcontent}]
                                <input type="hidden" name="paymentid" value="oxempty" />
                                <li><input type="submit" id="paymentNextStepBottom" name="userform" class="btn" value="[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]" /></li>
                                <li><input type="button" id="paymentBackStepBottom" class="btn previous" value="[{oxmultilang ident="PREVIOUS_STEP"}]" onclick="window.open('[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]', '_self');" /></li>
                            </ul>
                        [{/block}]
                    [{/if}]
                </form>
            </div>
        [{/block}]

    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]

</div>
[{oxscript add="$('#shippingMethods').oxDropDown({form:'#shipping'});"}]
[{oxscript add="$('#paymentMethods').oxDropDown();"}]
[{oxscript add="
    $('#paymentMethods').on('click', '.dropDownOption > a', function() {
        var payment = $('#payment');
        $('div.paymentOption.activePayment', payment).removeClass('activePayment');
        $('#paymentOption_'+$(this).data('selection-id'), payment).addClass('activePayment');
        $('#payment_'+$(this).data('selection-id'), payment).prop('checked', true);
    });
"}]
[{/capture}]

[{include file="layout/page.tpl"}]