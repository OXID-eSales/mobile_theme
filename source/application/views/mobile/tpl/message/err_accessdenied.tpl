[{if 'EE' == $oViewConf->getEdition()}]
[{capture append="oxidBlock_content"}]
    <div class="alert-page alert-page-error">
        <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_ACCESSDENIEDTITLE" }]</h4>
        <div class="alertPageBody">[{ oxmultilang ident="MESSAGE_ERR_ACCESSDENIED" }] </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
[{/if}][{* OXID_VERSION_EE *}]
