[{block name="widget_product_listitem_line"}]
    [{oxscript include="js/widgets/oxtriggerform.js" priority=10 }]
    [{oxscript add="$('.removeFromWishList button').oxFormTrigger();"}]
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->getVariants()||($oViewConf->showSelectListsInList()&&$product->getSelections(1))}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

<form name="tobasket.[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
    [{ $oViewConf->getNavFormParams() }]
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="pgNr" value="[{ $oView->getActPage() }]">
    [{if $recommid}]
        <input type="hidden" name="recommid" value="[{ $recommid }]">
    [{/if}]
    [{if $blShowToBasket}]
        [{oxhasrights ident="TOBASKET"}]
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            [{if $owishid}]
                <input type="hidden" name="owishid" value="[{$owishid}]">
            [{/if}]
            [{if $toBasketFunction}]
                <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
            [{else}]
                <input type="hidden" name="fnc" value="tobasket">
            [{/if}]
            <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
            [{if $altproduct}]
                <input type="hidden" name="anid" value="[{$altproduct}]">
            [{else}]
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
            <input id="am_[{$testid}]" type="hidden" name="am" value="1">
        [{/oxhasrights}]
    [{else}]
        <input type="hidden" name="cl" value="details">
        <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
    [{/if}]

    [{block name="widget_product_listitem_line_picturebox"}]
        <div class="pictureBox">
            <img src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
        </div>
    [{/block}]
    <div class="productListContainer">

        [{block name="widget_product_listitem_line_selections"}]
            <div class="poductListTitle">
                <a href="[{$_productLink}]" class="poductListTitleLink" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]"><span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span></a>
            </div>
            <div class="variants">
                [{if $aVariantSelections && $aVariantSelections.selections }]
                    <div id="variantselector_[{$testid}]" class="selectorsBox js-fnSubmit clear">
                        [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                            <label>[{$oSelectionList->getLabel()}] [{oxmultilang ident="SELECT"}]</label>
                        [{/foreach}]
                    </div>
                [{elseif $oViewConf->showSelectListsInList()}]
                    [{assign var="oSelections" value=$product->getSelections(1)}]
                    [{if $oSelections}]
                        <div id="selectlistsselector_[{$testid}]" class="selectorsBox js-fnSubmit clear">
                            [{foreach from=$oSelections item=oList name=selections}]
                                <label>[{$oList->getLabel()}] [{oxmultilang ident="SELECT"}]</label>
                            [{/foreach}]
                        </div>
                    [{/if}]
                [{/if}]
            </div>
        [{/block}]
        [{block name="widget_product_listitem_line_description"}]
        [{/block}]
        <div class="productListPrice">
            [{block name="widget_product_listitem_line_price"}]
                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{if $product->getTPrice()}]
                        <span class="oldPrice">
                            [{*oxmultilang ident="REDUCED_FROM_2"*}] <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                        </span>
                    [{/if}]
                    [{block name="widget_product_listitem_line_price_value"}]
                        <label id="productPrice_[{$testid}]" class="price">
                            <span>
                                [{if $product->isRangePrice()}]
                                                [{ oxmultilang ident="PRICE_FROM" }]
                                                [{if !$product->isParentNotBuyable() }]
                                                    [{ $product->getFMinPrice() }]
                                                [{else}]
                                                    [{ $product->getFVarMinPrice() }]
                                                [{/if}]
                                        [{else}]
                                                [{if !$product->isParentNotBuyable() }]
                                                    [{ $product->getFPrice() }]
                                                [{else}]
                                                    [{ $product->getFVarMinPrice() }]
                                                [{/if}]
                                        [{/if}]
                            </span> [{ $currency->sign}]
                            [{if $oView->isVatIncluded() }]
                                [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                            [{/if}]
                        </label>
                    [{/block}]
                [{/oxhasrights}]
            [{/block}]
            [{if $blShowToBasket}]
                [{block name="widget_product_listitem_line_tobasket"}]
                    [{oxhasrights ident="TOBASKET"}]
                        <div class="addToBasket">
                            <input class="quantity" id="amountToBasket_[{$testid}]" type="textbox" name="am" value="1" size="2" autocomplete="off" />
                            <button id="toBasket_[{$testid}]" type="submit">[{oxmultilang ident="DETAILS_ADDTOCART"}]</button>
                        </div>
                    [{/oxhasrights}]
                [{/block}]
            [{/if}]
            [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                [{block name="widget_product_listitem_line_removefromwishlist"}]
                    <div class="removeFromWishList">
                        <button data-form="remove_[{$removeFunction}][{$testid}]" type="submit" class="btn small remove"><i class="glyphicon-remove"></i></button>
                    </div>
                [{/block}]
            [{/if}]
        </div>
    </div>
</form>
[{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
    <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="remove_[{$removeFunction}][{$testid}]">
        <div>
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]" />
            <input type="hidden" name="fnc" value="[{$removeFunction}]" />
            <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]" />
            <input type="hidden" name="am" value="0" />
            <input type="hidden" name="itmid" value="[{$product->getItemKey()}]" />
            [{if $recommid}]
                <input type="hidden" name="recommid" value="[{$recommid}]" />
            [{/if}]
        </div>
    </form>
[{/if}]
[{/block}]
