[{capture append="oxidBlock_pageBody"}]

    <div class="alertPage alertPageError">
        <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_UNKNOWN_OXIDESHOPERROR" }] #[{ $oView->getErrorNumber() }] !</h4>
        <div class="alertPageBody">[{ oxmultilang ident="MESSAGE_PLEASE_CONTACT_SUPPORT" }]</div>
    </div>

[{/capture}]
[{include file="layout/base.tpl"}]