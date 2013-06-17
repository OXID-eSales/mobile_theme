[{capture append="oxidBlock_pageBody"}]
    [{include file="layout/header.tpl"}]
    <div id="page">
        <div class="container">
            [{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
                [{include file="widget/promoslider.tpl" }]
            [{/if}]
            [{include file="message/errors.tpl"}]
            [{foreach from=$oxidBlock_content item="_block"}]
                [{$_block}]
            [{/foreach}]
        </div>
    </div>
    [{include file="layout/footer.tpl"}]
[{/capture}]
[{include file="layout/base.tpl"}]