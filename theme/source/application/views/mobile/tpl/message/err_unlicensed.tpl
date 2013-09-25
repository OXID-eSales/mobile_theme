[{if 'CE' == $oViewConf->oeThemeSwitcherGetEdition()}]

[{capture append="oxidBlock_pageBody"}]

<h1 class="page-head">[{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_OXIDESHOPERROR" }]</h1>
<div class="content">
    <div class="alert alert-error">
        [{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_VERSIONEXPIRED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_VERSIONEXPIRED2" }]</a> [{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_VERSIONEXPIRED3" }]
    </div>
</div>

[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}]