[{block name="widget_minibasket"}]
    [{if $oxcmp_basket->getItemsCount() > 0}]
        [{oxscript include="js/widgets/oxminibasket.js" priority=10 }]
        [{oxscript add="$( '#miniBasket' ).oxMiniBasket();"}]
        <a id="miniBasket" class="btn header-btn mini-basket" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]">
            <span class="badge mini-basket-count">
                [{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
                <span id="countValue">
                    [{$oxcmp_basket->getItemsCount()}]
                </span>
            </span>
    [{else}]
        <a id="miniBasket" class="btn header-btn mini-basket header-btn-disabled">
    [{/if}]
            <span id="[{$_prefix}]minibasketIcon" class="mini-basket-icon">Basket</span>
        </a>
[{/block}]
[{oxstyle widget=$oView->getClassName()}]