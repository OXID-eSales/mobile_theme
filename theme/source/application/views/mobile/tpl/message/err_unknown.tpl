[{capture append="oxidBlock_pageBody"}]

<h1 class="page-head">[{ oxmultilang ident="MESSAGE_ERR_UNKNOWN_OXIDESHOPERROR" }] #[{ $oView->getErrorNumber() }] !</h1>
<div class="content">
    <div class="alert alert-error">
        [{ oxmultilang ident="MESSAGE_PLEASE_CONTACT_SUPPORT" }]
    </div>
</div>
[{/capture}]
[{include file="layout/base.tpl"}]