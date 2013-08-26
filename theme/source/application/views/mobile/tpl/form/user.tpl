[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<form class="js-oxValidate form" action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <div class="addressCollumns">
        <div class="collumn">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="fnc" value="changeuser_testvalues">
                <input type="hidden" name="cl" value="account_user">
                <input type="hidden" name="CustomError" value='user'>
                <input type="hidden" name="blshowshipaddress" value="1">
            </div>
            <h3 class="block-head">
                [{ oxmultilang ident="BILLING_ADDRESS" }]
            </h3>
            <input id="userChangeAddress" class="btn submitButton largeButton" [{if !empty($aErrors)}]style="display: none;"[{/if}] name="changeBillAddress" type="submit" value="[{ oxmultilang ident="CHANGE" }]"/>
            <ul class="form" [{if empty($aErrors)}]style="display: none;"[{/if}] id="addressForm">
                [{ include file="form/fieldset/user_email.tpl" }]
                [{ include file="form/fieldset/user_billing.tpl" noFormSubmit=true }]
            </ul>
            <ul class="form" id="addressText">
                <li>
                    [{ include file="widget/address/billing_address.tpl"}]
                </li>
            </ul>
            [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm').show();$('#addressText').hide();$('#userChangeAddress').hide();return false;});"}]
        </div>
        <div class="collumn">
            <h3 id="addShippingAddress" class="block-head">
            [{ oxmultilang ident="SHIPPING_ADDRESSES" }]
            </h3>
            <input id="userChangeShippingAddress" class="btn submitButton largeButton" name="changeShippingAddress" type="submit" [{if !$oView->showShipAddress() or !$oxcmp_user->getSelectedAddress()}] style="display: none;"[{/if}] value="[{ oxmultilang ident="CHANGE" }]"/>
            <ul class="form">
                <li>
                    <div class="checkbox">
                        <input id="showShipAddress" type="checkbox" name="blshowshipaddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0">
                        <label for="showShipAddress" class="glyphicon-ok"></label>
                    </div>
                    <label for="showShipAddress">[{ oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS" }]</label>
                </li>
            </ul>
            <ul id="shippingAddress" class="form" [{if !$oView->showShipAddress()}] style="display: none;" [{/if}]>
            [{ include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
            </ul>
            [{oxscript add="$('#showShipAddress').change( function() { $('#userChangeShippingAddress').toggle($(this).is(':not(:checked)') &&  $('#addressId').val() != -1 ); $('#shippingAddress').toggle($(this).is(':not(:checked)')); });"}]
            [{oxscript add="$('#addressId').change(function() { $('#userChangeShippingAddress').toggle($('#addressId').val() != -1 ); }); "}]
        </div>
    </div>
    <div>
        <input id="accUserSaveTop" class="btn submitButton largeButton next-step" name="userform" type="submit" value="[{ oxmultilang ident="SAVE" }]"/>
    </div>
</form>