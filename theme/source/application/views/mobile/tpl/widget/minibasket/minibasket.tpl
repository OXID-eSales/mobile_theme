[{block name="widget_minibasket"}]
    <a id="miniBasket" class="btn header-btn mini-basket" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]">
        [{if $oxcmp_basket->getItemsCount() > 0}]
        [{oxscript include="js/widgets/oxminibasket.js" priority=10 }]
        [{oxscript add="$( '#miniBasket' ).oxMiniBasket();"}]
            <span class="badge mini-basket-count">
                [{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
                <span id="countValue">
                    [{$oxcmp_basket->getItemsCount()}]
                </span>
            </span>
        [{/if}]
        <span id="[{$_prefix}]minibasketIcon" class="mini-basket-icon">Basket</span>
    </a>
[{/block}]
[{oxstyle widget=$oView->getClassName()}]