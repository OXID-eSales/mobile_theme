[{* Variant pre-assigns *}]
[{assign var="aVariantSelections" value=$oView->getVariantSelections()}]

[{if $aVariantSelections && $aVariantSelections.rawselections}]
    [{assign var="_sSelectionHashCollection" value=""}]
    [{foreach from=$aVariantSelections.rawselections item=oSelectionList key=iKey}]
        [{assign var="_sSelectionHash" value=""}]
        [{foreach from=$oSelectionList item=oListItem key=iPos}]
            [{assign var="_sSelectionHash" value=$_sSelectionHash|cat:$iPos|cat:":"|cat:$oListItem.hash|cat:"|"}]
        [{/foreach}]
        [{if $_sSelectionHash}]
            [{if $_sSelectionHashCollection}][{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:","}][{/if}]
            [{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:"'`$_sSelectionHash`'"}]
        [{/if}]
    [{/foreach}]
    [{oxscript add="var oxVariantSelections  = [`$_sSelectionHashCollection`];"}]

    <form class="js-oxWidgetReload" action="[{$oView->getWidgetLink()}]" method="get">
        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oView->getClassName()}]">
            <input type="hidden" name="oxwparent" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="listtype" value="[{$oView->getListType()}]">
            <input type="hidden" name="nocookie" value="1">
            <input type="hidden" name="cnid" value="[{$oView->getCategoryId()}]">
            <input type="hidden" name="anid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="actcontrol" value="[{$oViewConf->getTopActiveClassName()}]">
        </div>
    </form>
[{/if}]

[{* To basket form start *}]
[{oxhasrights ident="TOBASKET"}]
<form class="js-oxProductForm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
        <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
        <input type="hidden" name="panid" value="">
        [{if !$oDetailsProduct->isNotBuyable()}]
            <input type="hidden" name="fnc" value="tobasket">
        [{/if}]
    </div>
    [{/oxhasrights}]

<div id="detailsMain" class="product-details container">
    [{* Header *}]
    [{include file="page/details/inc/header.tpl"}]
    [{* Pictures *}]
    <div id="product-pictures" class="row">
        [{include file="page/details/inc/pics.tpl"}]
    </div>
    <div class="product-footer">
        [{* Ratings *}]
        [{if $oView->ratingIsActive()}]
            [{block name="details_productmain_ratings"}]
            [{/block}]
        [{/if}]
        [{*Price Info*}]
        [{oxhasrights ident="SHOWARTICLEPRICE"}]
        <div class="product-price-container pull-right">
            <div class="pull-right">
                [{block name="details_productmain_tprice"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{assign var=tprice value=$oDetailsProduct->getTPrice()}]
                        [{assign var=price  value=$oDetailsProduct->getPrice()}]
                        [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                            <div class="product-price-old pull-left">
                                <strong><del>[{$oDetailsProduct->getFTPrice()}] [{$currency->sign}]</del></strong>
                            </div>
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]

                [{block name="details_productmain_price"}]
                    [{if $oDetailsProduct->getFPrice()}]
                        <div class="product-price price pull-right">
                            [{assign var="sFrom" value=""}]
                            [{assign var="fPrice" value=$oDetailsProduct->getFPrice()}]
                            [{if $oDetailsProduct->isParentNotBuyable() }]
                                [{assign var="fPrice" value=$oDetailsProduct->getFVarMinPrice()}]
                                [{if $oDetailsProduct->isRangePrice() }]
                                    [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                                [{/if}]
                            [{/if}]
                            <strong>
                                <span>[{$sFrom}] [{$fPrice}]</span>
                                <span>[{ $currency->sign}]</span>
                                [{if $oView->isVatIncluded() }]
                                    <span>*</span>
                                [{/if}]
                            </strong>
                        </div>
                    [{/if}]
                [{/block}]
            </div>
            [{* Additional info *}]
            <div class="product-additional-info">
                [{block name="details_productmain_priceperunit"}]
                    [{if $oDetailsProduct->getPricePerUnit()}]
                        <span class="product-price-per-unit">[{$oDetailsProduct->getPricePerUnit()}] [{$currency->sign}]/[{$oDetailsProduct->getUnitName()}]</span>
                    [{/if}]
                [{/block}]
                [{* Stock status *}]
                [{block name="details_productmain_stockstatus"}]
                    [{if $oDetailsProduct->getStockStatus() == -1}]
                        <span class="product-stock-flag no-stock">
                            [{if $oDetailsProduct->oxarticles__oxnostocktext->value}]
                                [{$oDetailsProduct->oxarticles__oxnostocktext->value}]
                            [{elseif $oViewConf->getStockOffDefaultMessage()}]
                                [{oxmultilang ident="MESSAGE_NOT_ON_STOCK"}]
                            [{/if}]
                            [{if $oDetailsProduct->getDeliveryDate()}]
                                [{oxmultilang ident="AVAILABLE_ON"}] [{$oDetailsProduct->getDeliveryDate()}]
                            [{/if}]
                        </span>
                    [{elseif $oDetailsProduct->getStockStatus() == 1}]
                        <span class="product-stock-flag low-stock">
                            [{oxmultilang ident="LOW_STOCK"}]
                        </span>
                    [{elseif $oDetailsProduct->getStockStatus() == 0}]
                        <span class="product-stock-flag">
                            [{if $oDetailsProduct->oxarticles__oxstocktext->value}]
                                [{$oDetailsProduct->oxarticles__oxstocktext->value}]
                            [{elseif $oViewConf->getStockOnDefaultMessage()}]
                                [{oxmultilang ident="READY_FOR_SHIPPING"}]
                            [{/if}]
                        </span>
                    [{/if}]
                [{/block}]
                [{* Delivery time *}]
                [{block name="details_productmain_deliverytime"}]
                    [{oxhasrights ident="TOBASKET"}]
                        [{if $oDetailsProduct->isBuyable() }]
                            [{include file="page/details/inc/deliverytime.tpl"}]
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]
            </div>

            [{* Delivery info *}]
            <div class="product-delivery-info">
                [{block name="details_productmain_deliveryinfo"}]
                    [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                    [{if $oView->isVatIncluded()}]
                        <a href="[{ $oCont->getLink() }]" rel="nofollow">* [{ oxmultilang ident="PLUS_SHIPPING" }] [{ oxmultilang ident="PLUS_SHIPPING2" }]</a>
                    [{else}]
                        <a href="[{ $oCont->getLink() }]" rel="nofollow">* [{ oxmultilang ident="PLUS" }] [{ oxmultilang ident="PLUS_SHIPPING2" }]</a>
                    [{/if}]
                    [{/oxifcontent}]
                [{/block}]
            </div>
        </div>
        [{/oxhasrights}]
    </div>
    <div id="product-variants-container" class="row">
        [{* Variant Selector *}]
        [{assign var="blCanBuy" value=true}]
        [{* Variants | md variants *}]
        [{block name="details_productmain_variantselections"}]
            [{if $aVariantSelections && $aVariantSelections.selections }]
                [{oxscript include="js/widgets/oxajax.js" priority=10 }]
                [{oxscript include="js/widgets/oxarticlevariant.js" priority=10 }]
                [{oxscript add="$( '#variants' ).oxArticleVariant();"}]
                [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
                <ul id="variants" class="form js-fnSubmit clear">
                    [{assign var="blHasActiveSelections" value=false}]
                    [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
                        <li>
                            [{if $oList->getActiveSelection()}]
                                [{assign var="blHasActiveSelections" value=true}]
                            [{/if}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
                        </li>
                    [{/foreach}]
                </ul>
                [{if !$blCanBuy }]
                    <p class="product-variants-message">[{oxmultilang ident="CHOOSE_VARIANT"}]</p>
                [{/if}]
            [{/if}]
        [{/block}]
        [{* Selection lists *}]
        [{block name="details_productmain_selectlists"}]
            [{if $oViewConf->showSelectLists()}]
                [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
                [{if $oSelections}]
                    <div class="js-fnSubmit clear" id="productSelections">
                        [{foreach from=$oSelections item=oList name=selections}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                        [{/foreach}]
                    </div>
                [{/if}]
            [{/if}]
        [{/block}]
    </div>
    [{* Add to basket *}]
    <ul id="productAddToBasket" class="form">
        [{* Persistent parameters *}]
        [{block name="details_productmain_persparams"}]
        [{if $oView->isPersParam()}]
            <li id="persparamBox">
                <input type="text" id="persistentParam" name="persparam[details]" value="[{$oDetailsProduct->aPersistParam.text }]" size="35" placeholder="[{ oxmultilang ident="LABEL" }]" />
            </li>
        [{/if}]
        [{/block}]
        <li id="tobasketFunction">
            [{block name="mb_details_productmain_tobasket"}]
                [{oxhasrights ident="TOBASKET"}]
                [{if !$oDetailsProduct->isNotBuyable()}]
                    <input id="amountToBasket" type="hidden" name="am" value="1" size="3" autocomplete="off" class="textbox">
                    <button id="toBasket" type="submit" [{if !$blCanBuy}]disabled="disabled"[{/if}] class="submitButton largeButton btn[{if !$blCanBuy}] disabled[{/if}]">[{oxmultilang ident="TO_CART"}]</button>
                [{/if}]
                [{/oxhasrights}]
            [{/block}]
        </li>
    </ul>
</div>

[{* To basket form end *}]
[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]

[{* More pics block *}]
[{block name="mb_details_productmain_morepics"}]
[{/block}]
