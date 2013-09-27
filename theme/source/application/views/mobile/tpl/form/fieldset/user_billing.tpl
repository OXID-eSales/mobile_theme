[{oxscript include="js/widgets/oxdropdown.js" priority=10 }]
[{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]
[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]
[{if isset( $invadr.oxuser__oxbirthdate.month ) }]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month }]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":"" }]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxbirthdate.day ) }]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":"" }]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxbirthdate.year ) }]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year }]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":"" }]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]
    <li>
        [{include file="form/fieldset/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value }]
    </li>
    <li [{if $aErrors.oxuser__oxfname}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxfname) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="FIRST_NAME" }][{if $oView->isFieldRequired(oxuser__oxfname) }]*[{/if}]" type="text" size="37"  maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else }][{ $oxcmp_user->oxuser__oxfname->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxfname)}]
            <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
            </p>
          [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxlname}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxlname) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="LAST_NAME" }][{if $oView->isFieldRequired(oxuser__oxlname) }]*[{/if}]" type="text" size="37" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else }][{ $oxcmp_user->oxuser__oxlname->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxlname)}]
            <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]
            </p>
        [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxcompany}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxcompany) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="COMPANY" }][{if $oView->isFieldRequired(oxuser__oxcompany) }]*[{/if}]" type="text" size="37" maxlength="255" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany ) }][{ $invadr.oxuser__oxcompany }][{else }][{ $oxcmp_user->oxuser__oxcompany->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxcompany) }]
            <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcompany}]
            </p>
        [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxaddinfo}]class="invalid-field"[{/if}]>
        [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP"|oxmultilangassign }]
        <input [{if $oView->isFieldRequired(oxuser__oxaddinfo) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="ADDITIONAL_INFO" }][{if $oView->isFieldRequired(oxuser__oxaddinfo) }]*[{/if}]" type="text" size="37" maxlength="255" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{ $invadr.oxuser__oxaddinfo }][{else }][{ $oxcmp_user->oxuser__oxaddinfo->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxaddinfo) }]
            <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxaddinfo}]
            </p>
        [{/if}]
    </li>
    <li class="inline-elements first-big [{if $aErrors.oxuser__oxstreet}]invalid-field[{/if}]">
        <input class="bigField [{if $oView->isFieldRequired(oxuser__oxstreet) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="STREET" }][{if $oView->isFieldRequired(oxuser__oxstreet) }]*[{/if}]" type="text" data-fieldsize="pair-xsmall" maxlength="255" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet ) }][{ $invadr.oxuser__oxstreet }][{else }][{ $oxcmp_user->oxuser__oxstreet->value }][{/if}]">
        <input class="small-field absoluteRight [{if $oView->isFieldRequired(oxuser__oxstreetnr) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="HOUSE_NO" }]*" type="text" data-fieldsize="xsmall" maxlength="16" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr ) }][{ $invadr.oxuser__oxstreetnr }][{else }][{ $oxcmp_user->oxuser__oxstreetnr->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]
            </p>
        [{/if}]
    </li>
    <li class="inline-elements first-small [{if $aErrors.oxuser__oxzip}]invalid-field[{/if}]">
        <input class="small-field absoluteLeft [{if $oView->isFieldRequired(oxuser__oxzip) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="POSTAL_CODE" }][{if $oView->isFieldRequired(oxuser__oxzip) }]*[{/if}]" type="text" data-fieldsize="small" maxlength="16" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip ) }][{ $invadr.oxuser__oxzip }][{else }][{ $oxcmp_user->oxuser__oxzip->value }][{/if}]">
        <input class="bigField [{if $oView->isFieldRequired(oxuser__oxcity) }]js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{ oxmultilang ident="POSTAL_CITY" }][{if $oView->isFieldRequired(oxuser__oxcity) }]*[{/if}]" type="text" data-fieldsize="pair-small" maxlength="255" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity ) }][{ $invadr.oxuser__oxcity }][{else }][{ $oxcmp_user->oxuser__oxcity->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxzip}]
            </p>
        [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxustid}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxustid) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="VAT_ID_NUMBER" }][{if $oView->isFieldRequired(oxuser__oxustid) }]*[{/if}]" type="text" size="37" maxlength="255" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid ) }][{ $invadr.oxuser__oxustid }][{else}][{ $oxcmp_user->oxuser__oxustid->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxustid) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxustid}]
            </p>
        [{/if}]
    </li>
    [{block name="form_user_billing_country"}]
        <li [{if $aErrors.oxuser__oxcountryid}]class="invalid-field"[{/if}]>
            <div id="invCountry" class="dropdown">
                <input type="hidden" id="invCountrySelected" name="invadr[oxuser__oxcountryid]" value="[{$oxcmp_user->oxuser__oxcountryid->value}]" [{if $oView->isFieldRequired(oxuser__oxcountryid) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] />
                <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <a id="invCountryLabel" role="button" href="#">
                        <span id="countrySelected">[{oxmultilang ident="COUNTRY"}][{if $oView->isFieldRequired(oxuser__oxcountryid) }]*[{/if}]</span>
                        <i class="glyphicon-chevron-down"></i>
                    </a>
                </div>
                <ul class="dropdown-menu" role="menu" aria-labelledby="invCountryLabel">
                    [{foreach from=$oViewConf->getCountryList() item=country key=country_id }]
                        [{assign var=sCountryName value=$country->oxcountry__oxtitle->value}]
                        [{assign var=sCountryID value=$country->oxcountry__oxid->value}]
                        <li class="dropdown-option">
                            <a tabindex="-1" data-selection-id="[{$sCountryID}]">[{$sCountryName}]</a>
                        </li>
                        [{if (isset($invadr.oxuser__oxcountryid) && $invadr.oxuser__oxcountryid == $sCountryID) ||
                            (!isset($invadr.oxuser__oxcountryid) && $oxcmp_user->oxuser__oxcountryid->value == $sCountryID)}]
                        [{oxscript add="$('#invCountrySelected').val('$sCountryID');"}]
                        [{/if}]
                    [{/foreach}]
                </ul>
            </div>
            [{if $oView->isFieldRequired(oxuser__oxcountryid) }]
                <p class="validation-error">
                    <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcountryid}]
                </p>
            [{/if}]
        </li>
        <li class="stateBox">
            [{include file="form/fieldset/state.tpl"
            countryDropDown="invCountry"
            countrySelected="invCountrySelected"
            stateSelectName="invadr[oxuser__oxstateid]"
            selectedStateIdPrim=$invadr.oxuser__oxstateid
            selectedStateId=$oxcmp_user->oxuser__oxstateid->value
            }]
        </li>
        [{oxscript add="$('#invCountry.dropdown').oxDropDown();"}]
    [{/block}]


    <li [{if $aErrors.oxuser__oxfon}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxfon) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="PHONE" }]" type="tel" size="37" maxlength="128" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{ $invadr.oxuser__oxfon }][{else }][{ $oxcmp_user->oxuser__oxfon->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxfon) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfon}]
            </p>
        [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxfax}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxfax) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}]placeholder="[{ oxmultilang ident="FAX" }][{if $oView->isFieldRequired(oxuser__oxfax) }]*[{/if}]" type="tel" size="37" maxlength="128" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax ) }][{ $invadr.oxuser__oxfax }][{else }][{ $oxcmp_user->oxuser__oxfax->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxfax) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfax}]
            </p>
        [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxmobfon}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxmobfon) }] class="js-oxValidate js-oxValidate_notEmpty"[{/if}]placeholder="[{ oxmultilang ident="CELLUAR_PHONE" }][{if $oView->isFieldRequired(oxuser__oxmobfon) }]*[{/if}]" type="tel" size="37" maxlength="64" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon ) }][{$invadr.oxuser__oxmobfon }][{else}][{$oxcmp_user->oxuser__oxmobfon->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxmobfon) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxmobfon}]
            </p>
        [{/if}]
    </li>
    <li [{if $aErrors.oxuser__oxprivfon}]class="invalid-field"[{/if}]>
        <input [{if $oView->isFieldRequired(oxuser__oxprivfon) }] class="js-oxValidate js-oxValidate_notEmpty" [{/if}] placeholder="[{ oxmultilang ident="PERSONAL_PHONE" }][{if $oView->isFieldRequired(oxuser__oxprivfon) }]*[{/if}]" type="tel" size="37" maxlength="64" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]">
        [{if $oView->isFieldRequired(oxuser__oxprivfon) }]
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxprivfon}]
            </p>
        [{/if}]
    </li>
    [{if $oViewConf->showBirthdayFields() }]
        [{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
        [{oxscript include="js/widgets/oxdatepicker.js" priority=10}]
        [{oxscript add="$('#datePicker').oxDatePicker();"}]
        <li class="oxDate[{if $aErrors.oxuser__oxbirthdate}] invalid-field[{/if}]">
        <label>[{ oxmultilang ident="BIRTHDATE" }][{if $oView->isFieldRequired(oxuser__oxbirthdate) }]*[{/if}]</label>
            <div id="datePicker">
                <ul class="nav nav-pills nav-justified datepicker-container">
                    <li id="month">
                        <button class="btn" type="button">+</button>
                        <input name="invadr[oxuser__oxbirthdate][month]" type="hidden" value="[{if $iBirthdayMonth > 0 }][{$iBirthdayMonth }][{/if}]"/>
                        <input placeholder="[{ oxmultilang ident="MONTH" }]" type="text" readonly/>
                        <button class="btn" type="button">-</button>
                    </li>
                    <li id="day">
                        <button class="btn" type="button">+</button>
                        <input data-fieldsize="xsmall" id="oxDay" maxlength="2" name="invadr[oxuser__oxbirthdate][day]" placeholder="[{ oxmultilang ident="DAY" }]" type="number" value="[{if $iBirthdayDay > 0 }][{$iBirthdayDay }][{/if}]"/>
                        <button class="btn" type="button">-</button>
                    </li>
                    <li id="year">
                        <button class="btn" type="button">+</button>
                        <input data-fieldsize="small" id="oxYear" maxlength="4"  name="invadr[oxuser__oxbirthdate][year]" placeholder="[{ oxmultilang ident="YEAR" }]" type="number" value="[{if $iBirthdayYear }][{$iBirthdayYear }][{/if}]"/>
                        <button class="btn" type="button">-</button>
                    </li>
                    <li class="months">
                        <select id="months">
                            [{section name="month" start=1 loop=13 }]
                                <option value="[{$smarty.section.month.index}]" [{if $iBirthdayMonth == $smarty.section.month.index}] selected="selected" [{/if}]>[{oxmultilang ident="MONTH_NAME_"|cat:$smarty.section.month.index}]</option>
                            [{/section}]
                        </select>
                    </li>
                </ul>
                <p class="validation-error">
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxbirthdate}]
                </p>
            </div>
            <input id="modernDate" type="date" value="[{if $iBirthdayDay > 0 }][{$iBirthdayYear }]-[{if $iBirthdayMonth < 10 }]0[{/if}][{$iBirthdayMonth }]-[{$iBirthdayDay }][{/if}]"/>
        </li>
    [{/if}]

    <li class="alert alert-block">[{ oxmultilang ident="COMPLETE_MARKED_FIELDS" }]</li>
    [{if !$noFormSubmit}]
    <li class="formSubmit">
        <input class="btn" id="accUserSaveTop" type="submit" name="save" value="[{ oxmultilang ident="SAVE" }]"/>
    </li>
    [{/if}]