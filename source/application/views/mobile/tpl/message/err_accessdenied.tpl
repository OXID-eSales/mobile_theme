[{if $smarty.const.OXID_VERSION_EE}]
[{capture append="oxidBlock_content"}]
    <div class="alertPage alertPageError">
        <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_ACCESSDENIEDTITLE" }]</h4>
        <div class="alertPageBody">[{ oxmultilang ident="MESSAGE_ERR_ACCESSDENIED" }] </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
[{/if}][{* OXID_VERSION_EE *}]
