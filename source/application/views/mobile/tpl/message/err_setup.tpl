[{capture append="oxidBlock_pageBody"}]
        <div class="alertPage alertPageError">
            <h4 class="alertPageHeader">[{ oxmultilang ident="ERROR_MESSAGE_OXID_SHOP_ERROR" }]</h4>
            <div class="alertPageBody">[{ oxmultilang ident="MESSAGE_PLEASE_DELETE_DIRECTORY_SET" args=$oViewConf->getBaseDir()}]</div>
        </div>
[{/capture}]
[{include file="layout/base.tpl"}]
