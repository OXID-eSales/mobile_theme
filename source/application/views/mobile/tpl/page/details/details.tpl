[{capture append="oxidBlock_content"}]
  [{assign var="oDetailsProduct" value=$oView->getProduct()}]
  [{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]
  [{assign var="currency" value=$oView->getActCurrency()}]
  [{assign var="sPageHeadTitle" value=$oDetailsProduct->oxarticles__oxtitle->value|cat:' '|cat:$oDetailsProduct->oxarticles__oxvarselect->value}]

    <div id="details">
        [{ if $oView->getSearchTitle() }]
          [{ assign var="detailsLocation" value=$oView->getSearchTitle()}]
        [{else}]
          [{foreach from=$oView->getCatTreePath() item=oCatPath name="detailslocation"}]
          [{if $smarty.foreach.detailslocation.last}]

            [{assign var="detailsLocation" value=$oCatPath->oxcategories__oxtitle->value}]
            [{/if}]
          [{/foreach}]
        [{/if}]

        [{* details locator  *}]
        [{assign var="actCategory" value=$oView->getActiveCategory()}]
        [{include file="widget/backbutton.tpl" link=$actCategory->toListLink text="BACK"}]

        [{* RDFa offering*}]
        <div id="productinfo" class="content">
            [{include file="page/details/inc/fullproductinfo.tpl"}]
        </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
