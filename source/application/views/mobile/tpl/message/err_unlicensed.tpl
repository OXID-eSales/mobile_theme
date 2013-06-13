[{if !$smarty.const.OXID_VERSION_PE_CE}]

[{capture append="oxidBlock_pageBody"}]

<div class="alert-page alert-page-error">
    <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_OXIDESHOPERROR" }]</h4>
    <div class="alertPageBody">[{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_VERSIONEXPIRED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_VERSIONEXPIRED2" }]</a> [{ oxmultilang ident="MESSAGE_ERR_UNLICENSED_VERSIONEXPIRED3" }]</div>
</div>

[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}] [{* !OXID_VERSION_PE_CE *}]