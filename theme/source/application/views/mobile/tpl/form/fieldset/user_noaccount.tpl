    <li [{if $aErrors.oxuser__oxusername}]class="invalid-field"[{/if}]>
        [{block name="user_noaccount_email"}]
        <label>[{ oxmultilang ident="EMAIL_ADDRESS" }]*</label>
        <input id="userLoginName" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" type="email" name="lgn_usr" value="[{ $oView->getActiveUsername() }]" size="37" >
        <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            <span class="js-oxError_email">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL" }]</span>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        </p>
        [{/block}]
    </li>
     <li>
        [{block name="user_noaccount_newsletter"}]
        [{/block}]
    </li>