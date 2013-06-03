[{capture append="oxidBlock_pageBody"}]
        <div class="alertPage alertPageError">
            <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_SETUP_OXIDESHOPERROR" }]</h4>
        <div  class="alertPageBody">[{ oxmultilang ident="MESSAGE_ERR_SETUP_VERSIONEXPIRED1" }] [{ $oViewConf->getBaseDir() }][{ oxmultilang ident="MESSAGE_ERR_SETUP_VERSIONEXPIRED2" }]</div>
        </div>
[{/capture}]
[{include file="layout/base.tpl"}]
