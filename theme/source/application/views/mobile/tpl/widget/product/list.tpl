[{if $products|@count gt 0}]
    [{oxscript include="js/widgets/oxarticlelist.js" priority=10}]
    [{oxscript add="$('.article-list').oxArticleList();"}]
    <ul id="[{$listId}]" class="content media-list article-list" >
        [{assign var="currency" value=$oView->getActCurrency()}]
        [{foreach from=$products item=_product name=productlist}]
            [{assign var="_sTestId" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
            <li class="media">[{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() anid=$_product->getId() sWidgetType=product sListType=listitem testid=$_sTestId blDisableToCart=$blDisableToCart currencySign=$currency->sign isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct}]</li>
        [{/foreach}]
    </ul>
[{/if}]
