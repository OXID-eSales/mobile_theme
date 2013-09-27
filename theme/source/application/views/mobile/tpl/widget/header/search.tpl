[{oxscript include="js/widgets/oxsearch.js" priority=10 }]
[{oxscript add="$( '#search' ).oxSearch();"}]
[{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]

[{block name="widget_header_search_form"}]
[{if $oView->showSearch() }]
    <a class="btn header-btn search-toggle" href="#">
        <i class="glyphicon-search"></i>
    </a>
    <div id="search" class="search-box-container">
        <form class="search-box" action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="search" >
            <button class="btn search-btn"><i class="glyphicon-search"></i></button>
            [{block name="header_search_field"}]
                <input  placeholder="[{oxmultilang ident="SEARCH" }]" type="search" id="searchParam" name="searchparam" value="[{$oView->getSearchParamForHtml()}]">
            [{/block}]
        </form>
    </div>
[{/if}]
[{/block}]