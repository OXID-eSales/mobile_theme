[{oxscript include="js/widgets/oxenterpassword.js" priority=10 }]
[{oxscript add="$('.oxValidate_enterPass').oxEnterPassword();"}]
<li [{if $aErrors.oxuser__oxusername}]class="invalid-field"[{/if}]>
    <label>[{ oxmultilang ident="FORM_FIELDSET_USER_BILLING_EMAIL" }]*</label>
    <input class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email oxValidate_enterPass oxValidate_enterPassTarget[oxValidate_pwd] textbox" type="email" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername ) }][{ $invadr.oxuser__oxusername }][{else }][{ $oxcmp_user->oxuser__oxusername->value }][{/if }]" size="37">
    <p class="validation-error">
        <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
        <span class="js-oxError_email">[{ oxmultilang ident="EXCEPTION_INPUT_NOVALIDEMAIL" }]</span>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
    </p>
</li>
<li class="oxValidate_pwd[{if $aErrors.oxuser__oxpassword}] invalid-field[{/if}]" [{if !$aErrors.oxuser__oxpassword}]style="display:none;"[{/if}]>
    <label>[{oxmultilang ident="FORM_FIELDSET_USER_BILLING_PWD"}]*</label>
    <input class="js-oxValidate js-oxValidate_notEmpty textbox" type="password" size="37" name="user_password">
    <p class="validation-error">
        <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
        <span class="js-oxError_length">[{ oxmultilang ident="EXCEPTION_INPUT_PASSTOOSHORT" }]</span>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </p>
</li>