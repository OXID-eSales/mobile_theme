[{oxscript include="js/widgets/oxminibasket.js" priority=10 }]
[{oxscript add="$( '#miniBasket' ).oxMiniBasket();"}]

[{block name="widget_minibasket"}]
    <div id="miniBasket" class="mini-basket">
        [{if $oxcmp_basket->getItemsCount() > 0}]
        <a class="btn header-btn" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]">
            <span class="badge mini-basket-count">
                [{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
                <span id="countValue">
                    [{$oxcmp_basket->getItemsCount()}]
                </span>
            </span>
        <img src="[{$oViewConf->getImageUrl('basket_small.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket">
        </a>
        [{else}]
        <a class="btn header-btn header-btn-disabled">
            <img src="[{$oViewConf->getImageUrl('basket_small.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket">
        </a>
        [{/if}]
    </div>
[{/block}]
[{oxstyle widget=$oView->getClassName()}]