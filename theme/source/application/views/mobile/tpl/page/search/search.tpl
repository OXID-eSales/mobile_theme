[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{capture append="oxidBlock_content"}]
[{assign var="search_title" value="SEARCH"|oxmultilangassign}]
[{assign var="searchparamforhtml" value=$oView->getSearchParamForHtml() }]
[{assign var="template_title" value="$search_title - $searchparamforhtml"}]
[{assign var="search_head" value="HITS_FOR"|oxmultilangassign}]
[{assign var="search_head" value=$oView->getArticleCount()|cat:" "|cat:$search_head|cat:" &quot;"|cat:$oView->getSearchParamForHtml()|cat:"&quot;"}]
[{assign var='rsslinks' value=$oView->getRssLinks() }]

  <h1 class="page-head">
      [{$oView->getArticleCount()}] [{oxmultilang ident="HITS_FOR"}] &quot;[{$oView->getSearchParamForHtml()}]&quot;
  </h1>
  [{block name="search_results"}]
  [{if $oView->getArticleCount() }]
    <div class="listRefine clear bottomRound">
        [{block name="search_top_listlocator"}]
        [{include file="widget/locator/listlocator.tpl"  locator=$oView->getPageNavigationLimitedTop() listDisplayType=true sort=true }]
        [{/block}]
    </div>
  [{else}]
    <div class="content">
        <p>[{ oxmultilang ident="NO_ITEMS_FOUND" }]</div>
  [{/if}]
  [{if $oView->getArticleList() }]
    [{foreach from=$oView->getArticleList() name=search item=product}]
      [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="searchList" products=$oView->getArticleList() showMainLink=true blDisableToCart=true}]
    [{/foreach}]
  [{/if}]
  [{if $oView->getArticleCount() }]
    [{include file="widget/locator/listlocator.tpl" locator=$oView->generatePageNavigation(5) place="bottom"}]
  [{/if}]
  [{/block}]
[{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{assign var="template_title" value="SEARCH"|oxmultilangassign}]

[{include file="layout/page.tpl" title=$template_title location="SEARCH"|oxmultilangassign sidebar="Left"}]