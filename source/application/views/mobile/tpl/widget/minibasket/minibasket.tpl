[{oxscript include="js/widgets/oxminibasket.js" priority=10 }]
[{oxscript add="$( '#miniBasket' ).oxMiniBasket();"}]

[{block name="widget_minibasket"}]
    <div id="miniBasket">
        [{if $oxcmp_basket->getItemsCount() > 0}]
        <a  class="btn headerBtn" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]">
            <span class="counter articlesCounter">
                [{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
                <span id="countValue">
                    [{$oxcmp_basket->getItemsCount()}]
                </span>
            </span>
        <img src="[{$oViewConf->getImageUrl('basket_small.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket">
        </a>
        [{else}]
        <span  class="btn headerBtn">
            <img src="[{$oViewConf->getImageUrl('basket_small.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket">
        </span>
        [{/if}]
    </div>
[{/block}]
[{oxstyle widget=$oView->getClassName()}]