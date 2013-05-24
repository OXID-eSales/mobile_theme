[{assign var="oxcmp_categories" value=$oxcmp_categories}]
<div id="cat_list">
    <ul class="mainNavList nav nav-list" >
        [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
            [{if $ocat->getIsVisible()}]
                <li>
                    <a href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]<i class="glyphicon-chevron-right"></i></a>
                </li>
            [{/if}]
        [{/foreach}]
    </ul>
</div>
