[{oxscript include="js/widgets/oxdropdown.js" priority=10 }]
[{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]
[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]
<li>
    <label>[{ oxmultilang ident="ADDRESSES" }]</label>
    <input type="hidden" name="changeClass" value="[{$onChangeClass|default:'account_user'}]">
    [{oxscript include="js/widgets/oxusershipingaddressselect.js" priority=10 }]
    [{oxscript add="$( '#addressId' ).oxUserShipingAddressSelect();"}]
    <div id="addressSelect" class="dropdown">
        <input id="addressId" type="hidden" name="oxaddressid" value="-1" />
        <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
            <a role="button" href="#">
                <span>[{ oxmultilang ident="NEW_ADDRESS" }]</span>
                <i class="glyphicon-chevron-down"></i>
            </a>
        </div>
        <ul class="dropdown-menu">
            <li class="dropdown-option">
                <a tabindex="-1" data-selection-id="-1">[{ oxmultilang ident="NEW_ADDRESS" }]</a>
            </li>
            [{if $oxcmp_user }]
                [{foreach from=$oxcmp_user->getUserAddresses() item=address }]
                    [{if $address->isSelected()}]
                        [{oxscript add="$('#addressId').val('`$address->oxaddress__oxid->value`');"}]
                    [{/if}]
                    <li class="dropdown-option">
                        <a tabindex="-1" data-selection-id="[{$address->oxaddress__oxid->value}]">[{$address}]</a>
                    </li>
                [{/foreach}]
            [{/if}]
        </ul>
    </div>
</li>
[{if $delivadr}]
    <li class="form" id="shippingAddressText">
        [{ include file="widget/address/shipping_address.tpl" delivadr=$delivadr}]
        [{oxscript add="$('#userChangeShippingAddress').click( function() { $('#shippingAddressForm').show();$('#shippingAddressText').hide(); $('#userChangeShippingAddress').hide();return false;});"}]
    </li>
[{/if}]
<li>
    <ul id="shippingAddressForm" class="form" [{if $delivadr }]style="display: none;"[{/if}]>
        <li>
              [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal }]
        </li>
        <li [{if $aErrors.oxaddress__oxfname}]class="invalid-field"[{/if}]>
            <input [{if $oView->isFieldRequired(oxaddress__oxfname) }]class="js-oxValidate js-oxValidate_notEmpty"[{/if}] placeholder="[{ oxmultilang ident="FIRST_NAME" }][{if $oView->isFieldRequired(oxaddress__oxfname) }]*[{/if }]" type="text" maxlength="255" name="deladr[oxaddress__oxfname]" value="[{if isset( $deladr.oxaddress__oxfname ) }][{ $deladr.oxaddress__oxfname }][{else}][{ $delivadr->oxaddress__oxfname->value }][{/if }]">
            [{if $oView->isFieldRequired(oxaddress__oxfname)}]
                <p class="validation-error">
                    <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfname}]
                </p>
            [{/if}]
        </li>
        <li [{if $aErrors.oxaddress__oxlname}]class="invalid-field"[{/if}]>
            <input [{if $oView->isFieldRequired(oxaddress__oxlname)}]class="js-oxValidate js-oxValidate_notEmpty"[{/if}] placeholder="[{ oxmultilang ident="LAST_NAME" }][{if $oView->isFieldRequired(oxaddress__oxlname) }]*[{/if }]" type="text" maxlength="255" name="deladr[oxaddress__oxlname]" value="[{if isset( $deladr.oxaddress__oxlname ) }][{ $deladr.oxaddress__oxlname }][{else}][{ $delivadr->oxaddress__oxlname->value }][{/if }]">
            [{if $oView->isFieldRequired(oxaddress__oxlname)}]
                <p class="validation-error">
                    <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxlname}]
                </p>
            [{/if}]
        </li>
        <li [{if $aErrors.oxaddress__oxcompany}]class="invalid-field"[{/if}]>
            <input [{if $oView->isFieldRequired(oxaddress__oxcompany) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] placeholder="[{ oxmultilang ident="COMPANY" }][{if $oView->isFieldRequired(oxaddress__oxcompany) }]*[{/if }]" type="text" size="37" maxlength="255" name="deladr[oxaddress__oxcompany]" value="[{if isset( $deladr.oxaddress__oxcompany ) }][{ $deladr.oxaddress__oxcompany }][{else}][{ $delivadr->oxaddress__oxcompany->value }][{/if}]">
            [{if $oView->isFieldRequired(oxaddress__oxcompany) }]
                <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcompany}]
                </p>
            [{/if}]
        </li>
        <li [{if $aErrors.oxaddress__oxaddinfo}]class="invalid-field"[{/if}]>
            [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_SHIPPING_ADDITIONALINFO2_TOOLTIP"|oxmultilangassign }]
            <input [{if $oView->isFieldRequired(oxaddress__oxaddinfo) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] placeholder="[{ oxmultilang ident="ADDITIONAL_INFO" }][{if $oView->isFieldRequired(oxaddress__oxaddinfo) }]*[{/if }]" type="text" size="37" maxlength="255" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo ) }][{ $deladr.oxaddress__oxaddinfo }][{else}][{ $delivadr->oxaddress__oxaddinfo->value }][{/if}]">
            [{if $oView->isFieldRequired(oxaddress__oxaddinfo) }]
                <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxaddinfo}]
                </p>
            [{/if}]
        </li>
        <li class="inline-elements first-big [{if $aErrors.oxaddress__oxstreet}]invalid-field[{/if}]">
            <input class="bigField [{if $oView->isFieldRequired(oxaddress__oxstreet) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="STREET" }][{if $oView->isFieldRequired(oxaddress__oxstreet) }][{/if }]" type="text" data-fieldsize="pair-xsmall" maxlength="255" name="deladr[oxaddress__oxstreet]" value="[{if isset( $deladr.oxaddress__oxstreet ) }][{ $deladr.oxaddress__oxstreet }][{else}][{ $delivadr->oxaddress__oxstreet->value }][{/if}]">
            <input class="small-field absoluteRight [{if $oView->isFieldRequired(oxaddress__oxstreetnr) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="HOUSE_NO" }][{if $oView->isFieldRequired(oxaddress__oxstreetnr) }]*[{/if }]" type="text" data-fieldsize="xsmall" maxlength="16" name="deladr[oxaddress__oxstreetnr]" value="[{if isset( $deladr.oxaddress__oxstreetnr ) }][{ $deladr.oxaddress__oxstreetnr }][{else}][{ $delivadr->oxaddress__oxstreetnr->value }][{/if}]">
            [{if $oView->isFieldRequired(oxaddress__oxstreet) || $oView->isFieldRequired(oxaddress__oxstreetnr) }]
                <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxstreet}]
                </p>
            [{/if}]
        </li>
        <li class="inline-elements first-small [{if $aErrors.oxaddress__oxzip || $aErrors.oxaddress__oxcity}]invalid-field[{/if}]">
            <input class="small-field absoluteLeft [{if $oView->isFieldRequired(oxaddress__oxzip) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="POSTAL_CODE" }][{if $oView->isFieldRequired(oxaddress__oxzip) }]*[{/if }]" type="text" data-fieldsize="small" maxlength="50" name="deladr[oxaddress__oxzip]" value="[{if isset( $deladr.oxaddress__oxzip ) }][{ $deladr.oxaddress__oxzip }][{else}][{ $delivadr->oxaddress__oxzip->value }][{/if}]">
            <input class="bigField [{if $oView->isFieldRequired(oxaddress__oxcity) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="POSTAL_CITY" }][{if $oView->isFieldRequired(oxaddress__oxcity) }]*[{/if }]" type="text" data-fieldsize="pair-small" maxlength="255" name="deladr[oxaddress__oxcity]" value="[{if isset( $deladr.oxaddress__oxcity ) }][{ $deladr.oxaddress__oxcity }][{else}][{ $delivadr->oxaddress__oxcity->value }][{/if}]">
            [{if $oView->isFieldRequired(oxaddress__oxzip) || $oView->isFieldRequired(oxaddress__oxcity) }]
                <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxzip}]
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcity}]
                </p>
            [{/if}]
        </li>
        [{block name="form_user_shipping_country"}]
        <li [{if $aErrors.oxaddress__oxcountryid}]class="invalid-field"[{/if}]>
                <div id="delCountry" class="dropdown">
                    <input type="hidden" id="delCountrySelected" name="deladr[oxaddress__oxcountryid]" value="[{$delivadr->oxaddress__oxcountryid->value}]" [{if $oView->isFieldRequired(oxaddress__oxcountryid)}] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] />
                    <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                        <a id="delCountryLabel" role="button" href="#">
                            <span id="countrySelected">[{oxmultilang ident="COUNTRY"}][{if $oView->isFieldRequired(oxaddress__oxcountryid) }]*[{/if }]</span>
                            <i class="glyphicon-chevron-down"></i>
                        </a>
                    </div>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="delCountryLabel">
                        [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                            [{assign var=sCountryName value=$country->oxcountry__oxtitle->value}]
                            [{assign var=sCountryID value=$country->oxcountry__oxid->value}]
                            <li class="dropdown-option">
                                <a tabindex="-1" data-selection-id="[{$sCountryID}]">[{$sCountryName}]</a>
                            </li>
                            [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $sCountryID) ||
                                    (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $sCountryName or
                                    $delivadr->oxaddress__oxcountry->value == $sCountryID or
                                    $delivadr->oxaddress__oxcountryid->value == $sCountryID))}]
                                [{oxscript add="$('#delCountrySelected').val('$sCountryID');"}]
                            [{/if}]
                        [{/foreach}]
                    </ul>
                </div>
              [{if $oView->isFieldRequired(oxaddress__oxcountryid) }]
              <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcountryid}]
            </p>
          [{/if}]
        </li>
        <li class="stateBox">
              [{include file="form/fieldset/state.tpl"
                    countryDropDown="delCountry"
                    countrySelected="delCountrySelected"
                    stateSelectName="deladr[oxaddress__oxstateid]"
                    selectedStateIdPrim=$deladr.oxaddress__oxstateid
                    selectedStateId=$delivadr->oxaddress__oxstateid->value
            }]
        </li>
        [{oxscript add="$('#delCountry.dropdown').oxDropDown();"}]
        [{/block}]
        <li [{if $aErrors.oxaddress__oxfon}]class="invalid-field"[{/if}]>
            <input [{if $oView->isFieldRequired(oxaddress__oxfon) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] placeholder="[{ oxmultilang ident="PHONE" }][{if $oView->isFieldRequired(oxaddress__oxfon) }]*[{/if }]" type="tel" size="37" maxlength="128" name="deladr[oxaddress__oxfon]" value="[{if isset( $deladr.oxaddress__oxfon ) }][{ $deladr.oxaddress__oxfon }][{else}][{ $delivadr->oxaddress__oxfon->value }][{/if }]">
            [{if $oView->isFieldRequired(oxaddress__oxfon) }]
                <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfon}]
                </p>
            [{/if}]
        </li>
        <li [{if $aErrors.oxaddress__oxfax}]class="invalid-field"[{/if}]>
            <input [{if $oView->isFieldRequired(oxaddress__oxfax) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] placeholder="[{ oxmultilang ident="FAX" }][{if $oView->isFieldRequired(oxaddress__oxfax) }]*[{/if }]" type="tel" size="37" maxlength="128" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax ) }][{ $deladr.oxaddress__oxfax }][{else}][{ $delivadr->oxaddress__oxfax->value }][{/if}]">
            [{if $oView->isFieldRequired(oxaddress__oxfax) }]
                <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfax}]
                </p>
            [{/if}]
        </li>
    </ul>
</li>
[{if !$noFormSubmit}]
    <li class="alert alert-block">[{ oxmultilang ident="COMPLETE_MARKED_FIELDS" }]</li>
    <li class="formSubmit">
        <button id="accUserSaveBottom" type="submit" class="submitButton" name="save">[{ oxmultilang ident="SAVE" }]</button>
    </li>
[{/if}]
[{oxscript add="$('#addressSelect.dropdown').oxDropDown();"}]