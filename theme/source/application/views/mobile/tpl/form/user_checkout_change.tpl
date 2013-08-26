[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
[{block name="user_checkout_change"}]
    <form class="js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
        [{block name="user_checkout_change_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

            <div>
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="cl" value="user" />
                <input type="hidden" name="option" value="[{$oView->getLoginOption()}]" />
                <input type="hidden" name="fnc" value="changeuser" />
                <input type="hidden" name="lgn_cook" value="0" />
                <input type="hidden" name="blshowshipaddress" value="1" />
            </div>

            <div>
                <div class="form">
                    [{block name="user_checkout_billing"}]
                        [{block name="user_checkout_billing_head"}]
                            <ul class="form">
                                <li>
                                    <input type="button" id="userNextStepTop" name="userform" class="btn" value="[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]" />
                                </li>
                                <li>
                                    <h3>[{oxmultilang ident="BILLING_ADDRESS" }]</h3>
                                    <input class="btn" type="button" id="userChangeAddress" name="changeBillAddress" value="[{oxmultilang ident="CHANGE" }]" />
                                </li>
                            </ul>
                            [{oxscript add="$('#userNextStepTop').click( function() { $('#userNextStepBottom').click();return false;});"}]
                            [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm').show();$('#addressText').hide();$('#userChangeAddress').hide();return false;});"}]
                            [{if $aErrors}]
                                [{oxscript add="$(document).ready(function(){ $('#userChangeAddress').trigger('click');});"}]
                            [{/if}]
                        [{/block}]
                        [{block name="user_checkout_billing_form"}]
                            <ul id="addressForm" class="form" style="display: none;">
                                [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                            </ul>
                        [{/block}]
                        [{block name="user_checkout_billing_feedback"}]
                            <ul id="addressText" class="form">
                                <li>
                                    [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                                </li>
                            </ul>
                        [{/block}]
                    [{/block}]
                </div>
                <div class="form">
                    [{block name="user_checkout_shipping"}]
                        [{block name="user_checkout_shipping_head"}]
                            <ul class="form">
                                <li>
                                    <h3>[{ oxmultilang ident="SHIPPING_ADDRESS" }]</h3>
                                </li>
                            </ul>
                        [{/block}]
                        [{block name="user_checkout_shipping_change"}]
                            <div class="checkbox">
                                <input id="showShipAddress" type="checkbox" name="blshowshipaddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0">
                                <label for="showShipAddress" class="glyphicon-ok"></label>
                            </div>
                            <label for="showShipAddress">[{ oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS" }]</label>
                            [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
                        [{/block}]
                        [{block name="user_checkout_shipping_form"}]
                            <ul id="shippingAddress" class="form" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}]>
                                <li>
                                    <input class="btn checkout-change-shipping-address" type="button" id="userChangeShippingAddress" name="changeShippingAddress" value="[{ oxmultilang ident="CHANGE" }]" />
                                </li>
                                [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true onChangeClass='user'}]
                            </ul>
                            [{if !$oView->showShipAddress() or !$oxcmp_user->getSelectedAddress()}]
                                [{oxscript add="$('#userChangeShippingAddress').hide();"}]
                            [{/if}]
                            [{oxscript add="$('#addressId').change(function() { $('#userChangeShippingAddress').toggle($('#addressId').val() != -1 && $('#shippingAddressForm').is(':hidden') ); });"}]
                        [{/block}]
                        [{block name="user_checkout_shipping_feedback"}]
                            <ul class="form">
                                [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                            </ul>
                        [{/block}]
                    [{/block}]
                </div>
            </div>
            <ul class="form">
                <li><input type="submit" id="userNextStepBottom" class="btn" name="userform" value="[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }]" /></li>
                <li><input type="button" class="btn previous" value="[{ oxmultilang ident="PREVIOUS_STEP" }]" onclick="window.open('[{ oxgetseourl ident=$oViewConf->getBasketLink() }]', '_self');" /></li>
            </ul>
        [{/block}]
    </form>
[{/block}]