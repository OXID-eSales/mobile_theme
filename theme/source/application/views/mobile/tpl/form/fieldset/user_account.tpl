<li [{if $aErrors.oxuser__oxusername}]class="invalid-field"[{/if}]>
    [{block name="user_account_username"}]
        <label class="req">[{ oxmultilang ident="FORM_FIELDSET_USER_ACCOUNT_EMAIL" }]</label>
    <input id="userLoginName" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" type="email" name="lgn_usr" value="[{ $oView->getActiveUsername()}]" size="37" >
    <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
            <span class="js-oxError_email">[{ oxmultilang ident="EXCEPTION_INPUT_NOVALIDEMAIL" }]</span>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
    </p>
    [{/block}]
</li>
<li [{if $aErrors.oxuser__oxpassword}]class="invalid-field"[{/if}]>
    [{block name="user_account_password"}]
        <label class="req">[{ oxmultilang ident="FORM_FIELDSET_USER_ACCOUNT_PWD" }]</label>
    <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    <input id="userPassword" class="textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd" value="[{$lgn_pwd}]" size="37">
    <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
            <span class="js-oxError_length">[{ oxmultilang ident="EXCEPTION_INPUT_PASSTOOSHORT" }]</span>
            <span class="js-oxError_match">[{ oxmultilang ident="EXCEPTION_USER_PWDDONTMATCH" }]</span>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </p>
    [{/block}]
</li>
<li [{if $aErrors.oxuser__oxpassword}]class="invalid-field"[{/if}]>
    [{block name="user_account_confirmpwd"}]
        <label class="req">[{ oxmultilang ident="FORM_FIELDSET_USER_ACCOUNT_CONFIRMPWD" }]</label>
    <input id="userPasswordConfirm" class="textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" size="37">
    <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
            <span class="js-oxError_length">[{ oxmultilang ident="EXCEPTION_INPUT_PASSTOOSHORT" }]</span>
            <span class="js-oxError_match">[{ oxmultilang ident="EXCEPTION_USER_PWDDONTMATCH" }]</span>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </p>
    [{/block}]
</li>
<li>
    [{block name="user_account_newsletter"}]
    [{/block}]
</li>