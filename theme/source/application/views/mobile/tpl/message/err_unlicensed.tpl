[{if 'CE' == $oViewConf->oeThemeSwitcherGetEdition()}]

[{capture append="oxidBlock_pageBody"}]

<h1 class="page-head">[{ oxmultilang ident="ERROR_MESSAGE_OXID_SHOP_ERROR" }]</h1>
<div class="content">
    <div class="alert alert-error">
        [{ oxmultilang ident="ERROR_MESSAGE_UNLICENSED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="FOR_MORE_INFORMATION" }]</a> [{ oxmultilang ident="ERROR_MESSAGE_VERSION_EXPIRED1" }]
    </div>
</div>

[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}]