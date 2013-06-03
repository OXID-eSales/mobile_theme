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
[{/if}]

[{* To basket form start *}]
[{oxhasrights ident="TOBASKET"}]
<form class="js-oxProductForm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
        <input type="hidden" name="panid" value="">
        [{if !$oDetailsProduct->isNotBuyable()}]
            <input type="hidden" name="fnc" value="tobasket">
        [{/if}]
    </div>
    [{/oxhasrights}]

<div id="detailsMain" class="container">
    [{* Header *}]
    [{include file="page/details/inc/header.tpl"}]
    [{* Pictures *}]
    <div id="detailsPictures" class="row">
        [{include file="page/details/inc/pics.tpl"}]
    </div>
    <div id="detailsRatingsNPrice">
        [{* Ratings *}]
        [{if $oView->ratingIsActive()}]
            [{block name="details_productmain_ratings"}]
                <div class="detailsRatings pull-left">
                    [{*<div class="ratingPlaceholder"></div>
                    include file="widget/reviews/rating.tpl" itemid="anid=`$oDetailsProduct->oxarticles__oxnid->value`" sRateUrl=$oDetailsProduct->getLink()*}]
                </div>
            [{/block}]
        [{/if}]
        [{*Price Info*}]
        [{oxhasrights ident="SHOWARTICLEPRICE"}]
        <div class="detailsPriceBox pull-right">
            [{block name="details_productmain_tprice"}]
                [{if $oDetailsProduct->getTPrice()}]
                    <label class="detailsOldPrice">
                        <strong><del>[{$oDetailsProduct->getFTPrice()}] [{$currency->sign}]</del></strong>
                    </label>
                [{/if}]
            [{/block}]
            [{block name="details_productmain_price"}]
                [{if $oDetailsProduct->getFPrice()}]
                    <label class="detailsPrice price">
                        [{assign var="sFrom" value=""}]
                        [{assign var="fPrice" value=$oDetailsProduct->getFPrice()}]
                        [{if $oDetailsProduct->isParentNotBuyable() }]
                            [{assign var="fPrice" value=$oDetailsProduct->getFVarMinPrice()}]
                            [{if $oDetailsProduct->isRangePrice() }]
                                [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                            [{/if}]
                        [{/if}]
                        <strong >
                            <span>[{$sFrom}] [{$fPrice}]</span>
                            <span>[{ $currency->sign}]</span>
                            [{if $oView->isVatIncluded() }]
                                <span>*</span>
                            [{/if}]
                        </strong>
                    </label>
                [{/if}]
            [{/block}]
            [{* Delivery info *}]
            <div class="detailsDeliveryinfo">
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
    <div id="detailsVariants" class="row">
        <div class="span12">
            [{* Variant Selector *}]
            [{assign var="blCanBuy" value=true}]
            [{* Variants | md variants *}]
            [{block name="details_productmain_variantselections"}]
                [{if $aVariantSelections && $aVariantSelections.selections }]
                    [{oxscript include="js/widgets/oxajax.js" priority=10 }]
                    [{oxscript include="js/widgets/oxarticlevariant.js" priority=10 }]
                    [{oxscript add="$( '#variants' ).oxArticleVariant();"}]
                    [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
                    <div id="variants" class="selectorsBox js-fnSubmit clear spacedBottom">
                        [{assign var="blHasActiveSelections" value=false}]
                        [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
                            [{if $oList->getActiveSelection()}]
                                [{assign var="blHasActiveSelections" value=true}]
                            [{/if}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
                        [{/foreach}]
                    </div>
                    [{if !$blCanBuy }]
                        <p class="variantMessage">[{oxmultilang ident="DETAILS_CHOOSEVARIANT"}]</div>
                    [{/if}]
                [{/if}]
            [{/block}]
            [{* Selection lists *}]
            [{block name="details_productmain_selectlists"}]
                [{if $oViewConf->showSelectLists()}]
                    [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
                    [{if $oSelections}]
                        <div class="selectorsBox js-fnSubmit clear" id="productSelections">
                            [{foreach from=$oSelections item=oList name=selections}]
                                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                            [{/foreach}]
                        </div>
                    [{/if}]
                [{/if}]
            [{/block}]
        </div>
    </div>
    [{* Add to basket *}]
    <div id="detailsAddToBasket" class="row">
        <div class="span12">
            [{* Persistent parameters *}]
            [{block name="details_productmain_persparams"}]
            [{if $oView->isPersParam()}]
                <div class="persparamBox clear spacedBottom">
                    <label for="persistentParam">[{ oxmultilang ident="LABEL"  }]</label><input type="text" id="persistentParam" name="persparam[details]" value="[{$oDetailsProduct->aPersistParam.text }]" size="35">
                </div>
            [{/if}]
            [{/block}]
            <div class="tobasketFunction clear">
                [{block name="details_productmain_tobasket"}]
                    [{oxhasrights ident="TOBASKET"}]
                    [{if !$oDetailsProduct->isNotBuyable()}]
                        <input class="hidden" id="amountToBasket" type="text" name="am" value="1" size="3" autocomplete="off" class="textbox">
                        <button id="toBasket" type="submit" [{if !$blCanBuy}]disabled="disabled"[{/if}] class="submitButton largeButton btn[{if !$blCanBuy}] disabled[{/if}]">[{oxmultilang ident="DETAILS_ADDTOCART"}]</button>
                    [{/if}]
                    [{/oxhasrights}]
                [{/block}]
            </div>
        </div>
    </div>


</div>

[{* To basket form end *}]
[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]