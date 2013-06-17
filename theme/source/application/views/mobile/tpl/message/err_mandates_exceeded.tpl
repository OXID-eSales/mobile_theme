[{if 'EE' == $oViewConf->getEdition()}]

[{capture append="oxidBlock_pageBody"}]
    <h4 class="pageHead">[{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_OXIDESHOPERROR" }]</h4>
    <div class="content">
          <div class="alert alert-error">[{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_VERSIONEXPIRED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_VERSIONEXPIRED2" }]</a> [{ oxmultilang ident="MESSAGE_ERR_MANDATES_EXCEEDED_VERSIONEXPIRED3" }]</div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}][{* OXID_VERSION_EE *}]