[{if 'EE' == $oViewConf->getEdition()}]
[{capture append="oxidBlock_content"}]
    <h4 class="pageHead">[{ oxmultilang ident="MESSAGE_ERR_ACCESSDENIEDTITLE" }]</h4>
    <div class="content">
        <div class="alert alert-error">[{ oxmultilang ident="MESSAGE_ERR_ACCESSDENIED" }] </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
[{/if}][{* OXID_VERSION_EE *}]
