[{if $products|@count gt 0}]
    [{oxscript include="js/widgets/oxarticlelist.js" priority=10}]
    [{oxscript add="$('.article-list').oxArticleList();"}]
    <ul id="[{$listId}]" class="content media-list article-list" >
        [{foreach from=$products item=_product name=productlist}]
            <li class="media">[{include file="widget/product/listitem.tpl" product=$_product testid=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration blDisableToCart=$blDisableToCart}]</li>
        [{/foreach}]
    </ul>
[{/if}]
