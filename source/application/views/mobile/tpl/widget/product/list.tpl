[{oxscript include="js/widgets/oxarticlelist.js" priority=10}]
[{oxscript add="$('ul.lineView').oxArticleList();"}]
[{if $products|@count gt 0}]
    <ul class="content lineView" id="[{$listId}]" >
        [{foreach from=$products item=_product name=productlist}]
            <li class="productData clearfix">[{include file="widget/product/listitem.tpl" product=$_product testid=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration blDisableToCart=$blDisableToCart}]</li>
        [{/foreach}]
    </ul>
[{/if}]
