[{oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
[{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]
<form name="login" class="js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
    <div>
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{if $oViewConf->getActiveClassName() != 'login'}][{ $oViewConf->getActiveClassName() }][{/if}]">
        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
        <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
        [{if $oView->getArticleId()}]
          <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
        [{/if}]
        [{if $oView->getProduct()}]
          [{assign var="product" value=$oView->getProduct() }]
          <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        [{/if}]
    </div>

    <ul class="form">
        <li [{if $aErrors}]class="invalid-field"[{/if}]>
            <input placeholder="[{ oxmultilang ident="EMAIL"}]*" id="loginUser" class="js-oxValidate js-oxValidate_notEmpty" type="email" name="lgn_usr" value="" size="37" >
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            </p>
        </li>
        <li [{if $aErrors}]class="invalid-field"[{/if}]>
            <input placeholder="[{ oxmultilang ident="PASSWORD" }]*" id="loginPwd" class="js-oxValidate js-oxValidate_notEmpty textbox" type="password" name="lgn_pwd" value="" size="37">
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            </p>
        </li>
        [{if $oView->showRememberMe()}]
        <li>
            <div class="checkbox">
                <input id="loginCookie" type="checkbox" name="lgn_cook" value="1">
                <label for="loginCookie" class="glyphicon-ok"></label>
            </div>
            <label for="loginCookie">[{ oxmultilang ident="KEEP_LOGGED_IN" }]</label>
        </li>
        [{/if}]

        <li class="formSubmit">
            <input id="loginButton" type="submit" class="btn" value="[{ oxmultilang ident="LOGIN" }]" />
        </li>
    </ul>
</form>

<a id="openAccountLink" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" class="textLink" rel="nofollow">[{ oxmultilang ident="OPEN_ACCOUNT" }]</a><br />
<a id="forgotPasswordLink" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]" class="textLink" rel="nofollow">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a>
