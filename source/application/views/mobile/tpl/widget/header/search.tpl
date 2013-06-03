[{block name="widget_header_search_form"}]
[{if $oView->showSearch() }]
    <a class="btn headerBtn" data-target="#search" data-toggle="collapse" href="#">
        <i class="glyphicon-search"></i>
    </a>
    <div id="search" class="searchBox nav collapse">
        <form  action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="search" >
            <button class="btn"><i class="glyphicon-search"></i></button>
            [{block name="header_search_field"}]
                <input  placeholder="[{oxmultilang ident="SEARCH_TITLE" }]" type="text" id="searchParam" name="searchparam" value="[{$oView->getSearchParamForHtml()}]">
            [{/block}]
        </form>
    </div>
[{/if}]
[{/block}]