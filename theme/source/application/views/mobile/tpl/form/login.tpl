[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
[{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]
<form class="js-oxValidate" name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <div>
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
    </div>
    <ul class="form">
        <li [{if $aErrors}]class="invalid-field"[{/if}]>
            <input type="email" name="lgn_usr" class="js-oxValidate js-oxValidate_notEmpty" placeholder="[{ oxmultilang ident="EMAIL_ADDRESS"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            </p>
        </li>
        <li [{if $aErrors}]class="invalid-field"[{/if}]>
            <input type="password" name="lgn_pwd" class="js-oxValidate js-oxValidate_notEmpty" placeholder="[{ oxmultilang ident="PASSWORD" }]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            </p>
        </li>
        <li><input type="submit" class="btn" value="[{ oxmultilang ident="LOGIN" }]" /></li>
        <li class="text-right"><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a></li>
    </ul>
</form>
