[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{oxscript include="js/widgets/oxarticlebox.js" priority=10}]
[{oxscript add="$( '#content' ).oxArticleBox();"}]

[{assign var="actCategory" value=$oView->getActiveCategory()}]
[{assign var="parentCategory" value=$actCategory->getParentCategory()}]

[{capture append="oxidBlock_content"}]

    <div id="subcat_list">
        [{if $parentCategory}][{assign var="backLink" value=$parentCategory->getLink()}][{else}][{assign var="backLink" value=$oViewConf->getHomeLink()}][{/if}]
        [{include file="widget/backbutton.tpl" link=$backLink text="BACK"}]

        [{if $oView->hasVisibleSubCats()}]
            <ul class="mainNavList nav nav-list">
                [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                    <li>
                        [{if $category->getIsVisible()}]
                            <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{$category->getLink()}]">
                                [{$category->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                                <i class="glyphicon-chevron-right"></i>
                            </a>
                        [{/if}]
                    </li>
                [{/foreach}]
            </ul>
        [{/if}]
    </div>

    [{if $actCategory}]
        <h1>[{$actCategory->getTitle()}]</h1>
    [{/if}]

    [{if $oView->getArticleList()|@count > 0}]
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true sort=true}]
        [{* List types: grid|line|infogrid *}]
        [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList() blDisableToCart=true}]
        [{include file="widget/locator/listlocator.tpl" locator=$oView->generatePageNavigation(5) place="bottom"}]
    [{/if}]
    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left" tree_path=$oView->getTreePath()}]
