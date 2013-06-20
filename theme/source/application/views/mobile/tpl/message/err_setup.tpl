[{capture append="oxidBlock_pageBody"}]
    <h4 class="page-head">[{ oxmultilang ident="MESSAGE_ERR_SETUP_OXIDESHOPERROR" }]</h4>
    <div class="content">
        <div  class="alert alert-error">[{ oxmultilang ident="MESSAGE_ERR_SETUP_VERSIONEXPIRED1" }] [{ $oViewConf->getBaseDir() }][{ oxmultilang ident="MESSAGE_ERR_SETUP_VERSIONEXPIRED2" }]</div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]
