[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]

[{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
    [{assign var="blAnon" value=0}]
    [{assign var="force_sid" value=$oViewConf->getSessionId()}]
[{else}]
    [{assign var="blAnon" value=1}]
[{/if}]

[{if $oxcmp_basket->getProductsCount()}]
    [{assign var="blAnon" value=0}]
    [{assign var="force_sid" value=$oViewConf->getSessionId()}]
[{else}]
    [{assign var="blAnon" value=1}]
[{/if}]

<div id="header" class="navbar navbar-inverse">
    <div class="container">
        <a id="logo" class="header-logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
            <img src="[{$oViewConf->getImageUrl('logo_small2.png')}]" alt="[{oxmultilang ident="OXID_ESALES_URL_TITLE"}]">
        </a>

        <div class="headerMenu clearfix">
            [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]

            [{include file="widget/header/search.tpl"}]
        </div>
    </div>
</div>