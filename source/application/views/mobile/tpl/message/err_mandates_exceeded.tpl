[{if $smarty.const.OXID_VERSION_EE}]

[{capture append="oxidBlock_pageBody"}]

<div class="alertPage alertPageError">
      <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_OXIDESHOPERROR" }]</h4>
      <div class="alertPageBody">[{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_VERSIONEXPIRED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_VERSIONEXPIRED2" }]</a> [{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_VERSIONEXPIRED3" }]</div>
</div>
[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}][{* OXID_VERSION_EE *}]