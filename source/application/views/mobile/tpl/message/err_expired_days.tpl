[{if !$smarty.const.OXID_VERSION_PE_CE}]

[{capture append="oxidBlock_pageBody"}]

<div class="alertPage alertPageError">
      <h4 class="alertPageHeader">[{ oxmultilang ident="ERROR_MESSAGE_OXID_SHOP_ERROR" }]</h4>
      <div class="alertPageBody">[{ oxmultilang ident="ERROR_MESSAGE_VERSION_EXPIRED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="ERROR_MESSAGE_OXID_ESALES" }]</a> [{ oxmultilang ident="FOR_MORE_INFORMATION" }]</div>
</div>

[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}] [{* !OXID_VERSION_PE_CE *}]