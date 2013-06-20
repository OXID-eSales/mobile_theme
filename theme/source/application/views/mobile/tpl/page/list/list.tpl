[{assign var="actCategory" value=$oView->getActiveCategory()}]
[{assign var="parentCategory" value=$actCategory->getParentCategory()}]

[{capture append="oxidBlock_content"}]

    <div id="subcat_list">

        <ul class="nav nav-list main-nav-list">
            <li>
                <a class="back" href="[{if $parentCategory}][{$parentCategory->getLink()}][{else}][{$oViewConf->getHomeLink()}][{/if}]">
                    <span>[{oxmultilang ident="BACK"}]</span>
                    <i class="glyphicon-chevron-left"></i>
                </a>
            </li>
            [{if $oView->hasVisibleSubCats()}]
                [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                    <li>
                        [{if $category->getIsVisible()}]
                            <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{$category->getLink()}]">
                                <span>
                                    [{$category->oxcategories__oxtitle->value}]
                                    [{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                                </span>
                                <i class="glyphicon-chevron-right"></i>
                            </a>
                        [{/if}]
                    </li>
                [{/foreach}]
            [{/if}]
        </ul>
    </div>

    [{if $actCategory}]
        <h1 class="page-head">[{$actCategory->getTitle()}]</h1>
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
