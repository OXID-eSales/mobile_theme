[{capture append="oxidBlock_pageBody"}]
    <h4 class="page-head">[{ oxmultilang ident="ERROR_MESSAGE_OXID_SHOP_ERROR" }]</h4>
    <div class="content">
        <div  class="alert alert-error">[{ oxmultilang ident="MESSAGE_PLEASE_DELETE_DIRECTORY" }] [{ $oViewConf->getBaseDir() }][{ oxmultilang ident="MESSAGE_PLEASE_DELETE_DIRECTORY_SETUP" }]</div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]
