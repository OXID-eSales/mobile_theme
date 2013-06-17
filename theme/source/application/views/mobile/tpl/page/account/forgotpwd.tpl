[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_content"}]

    [{if $oView->showUpdateScreen() }]
        [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_UPDATETITLE"|oxmultilangassign}]
    [{elseif $oView->updateSuccess() }]
        [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_UPDATESUCCESSTITLE"|oxmultilangassign}]
    [{else}]
        [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_TITLE"|oxmultilangassign}]
    [{/if}]

    <h1 class="pageHead">[{$template_title}]</h1>

    <div class="content">
        [{if $oView->isExpiredLink() }]
            <div class="alert alert-error">[{ oxmultilang ident="FORGOTPWD_ERRLINKEXPIRED" }]</div>
        [{elseif $oView->showUpdateScreen() }]
            [{include file="form/forgotpwd_change_pwd.tpl"}]
        [{elseif $oView->updateSuccess() }]

            <div class="alert alert-success">[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_UPDATE_SUCCESS" }]</div>

            <div class="bar">
                <form action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
                    <div>
                        [{ $oViewConf->getHiddenSid() }]
                        <input type="hidden" name="cl" value="start">
                        <button id="backToShop" class="btn" type="submit">[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_BACKTOSHOP" }]</button>
                    </div>
                </form>
            </div>
        [{else}]
            [{if $oView->getForgotEmail()}]
                <div class="alert alert-success">[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_PWDWASSEND" }] [{$oView->getForgotEmail()}]</div>
                <form action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
                    [{ $oViewConf->getHiddenSid() }]
                    <input type="hidden" name="cl" value="start">
                    <button id="backToShop" class="btn" type="submit">[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_BACKTOSHOP" }]</button>
                 </form>
            [{else}]
                [{include file="form/forgotpwd_email.tpl"}]
            [{/if}]
        [{/if}]
    </div>

    [{if !$oView->isActive('PsLogin') }]
        [{insert name="oxid_tracker" title=$template_title }]
    [{/if}]
[{/capture}]
[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl"}]
[{/if}]

