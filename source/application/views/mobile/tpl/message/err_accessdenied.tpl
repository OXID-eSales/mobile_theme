[{if $smarty.const.OXID_VERSION_EE}]
[{capture append="oxidBlock_content"}]
    <div class="alertPage alertPageError">
        <h4 class="alertPageHeader">[{ oxmultilang ident="ERROR" }]</h4>
        <div class="alertPageBody">[{ oxmultilang ident="ERROR_MESSAGE_ACCESS_DENIED" }] </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
[{/if}][{* OXID_VERSION_EE *}]
