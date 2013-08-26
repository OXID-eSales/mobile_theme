[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
[{block name="user_checkout_registration"}]
    <form class="form js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
    [{block name="user_checkout_registration_form"}]
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="cl" value="user">
        <input type="hidden" name="option" value="3">
        [{if !$oxcmp_user->oxuser__oxpassword->value }]
        <input type="hidden" name="fnc" value="createuser">
        [{else}]
        <input type="hidden" name="fnc" value="changeuser">
        <input type="hidden" name="lgn_cook" value="0">
        [{/if}]
        <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
        <input type="hidden" name="blshowshipaddress" value="1">

        <div>
            <h3 class="block-head">[{ oxmultilang ident="ACCOUNT_INFORMATION" }]</h3>
            <ul class="form">
                [{ include file="form/fieldset/user_account.tpl" }]
            </ul>
        </div>
        <div class="collumn">
            <h3 class="block-head">[{ oxmultilang ident="BILLING_ADDRESS" }]</h3>
            <ul class="form">
            [{ include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=false blOrderRemark=true}]
            </ul>
        </div>
        <div class="collumn">
            <h3 class="block-head">[{ oxmultilang ident="SHIPPING_ADDRESS" }]</h3>
            <div class="checkbox">
                <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0">
                <label for="showShipAddress" class="glyphicon-ok"></label>
            </div>
            <label for="showShipAddress">[{ oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS" }]</label>
            <div class="clearfix"></div>
            <ul id="shippingAddress" class="form" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}]>
            [{ include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
            </ul>
            <ul class="form">
                <li>
                    [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                </li>
            </ul>
        </div>

        [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
        <ul class="form">
            <li>
                <input id="userNextStepBottom" class="btn submitButton largeButton nextStep" name="userform" type="submit" value="[{ oxmultilang ident="CONTINUE_TO_NEXT_STEP" }]"/>
            </li>
            <li>
                <input class="btn previous" type="button" id="userBackStepBottom" value="[{ oxmultilang ident="PREVIOUS_STEP" }]" onclick="window.open('[{ oxgetseourl ident=$oViewConf->getBasketLink() }]', '_self');" />
            </li>
        </ul>
    [{/block}]
    </form>
[{/block}]
