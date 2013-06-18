[{oxscript include="js/libs/cookie/jquery.cookie.js"}]
[{oxscript include="js/widgets/oxwishlistcontrol.js" priority=10}]
[{oxscript add="$('.wishlist-btn').oxWishlistControl();"}]
[{oxscript include="js/widgets/oxtriggerform.js" priority=10 }]
[{oxscript add="$('.wishlist-btn').oxFormTrigger();"}]
[{block name="widget_product_listitem_line"}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{if $showMainLink}]
    [{assign var='_productLink' value=$product->getMainLink()}]
[{else}]
    [{assign var='_productLink' value=$product->getLink()}]
[{/if}]
[{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
[{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
[{if $blDisableToCart || $product->isNotBuyable() || ($aVariantSelections && $aVariantSelections.selections) || $product->getVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1))}]
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
        <div class="pull-left">
            <img src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
        </div>
    [{/block}]
    <div class="media-body">

        [{block name="widget_product_listitem_line_selections"}]
            <h4 class="media-heading">
                [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                    [{block name="widget_product_listitem_line_removefromwishlist"}]
                        <div class="article-list-remove">
                            <button data-form="remove_[{$removeFunction}][{$testid}]" class="btn remove wishlist-btn" data-action="remove" data-anid="[{$product->oxarticles__oxnid->value}]" name="wishlist_remove_button"><i class="glyphicon-remove"></i></button>
                        </div>
                    [{/block}]
                [{/if}]
                <a href="[{$_productLink}]" class="media-heading-link" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                    <span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span>
                </a>
            </h4>
            <div class="variants">
                [{if $aVariantSelections && $aVariantSelections.selections }]
                    <p id="variantselector_[{$testid}]" class="js-fnSubmit clear">
                        [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey name=variantSelection}]
                            [{$oSelectionList->getLabel()}][{if !$smarty.foreach.variantSelection.first}], [{/if}]
                        [{/foreach}]
                        [{oxmultilang ident="SELECT"}]
                    </p>
                [{elseif $oViewConf->showSelectListsInList()}]
                    [{assign var="oSelections" value=$product->getSelections(1)}]
                    [{if $oSelections}]
                        <div id="selectlistsselector_[{$testid}]" class="js-fnSubmit clear">
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
        <p class="article-list-price">
            [{block name="widget_product_listitem_line_price"}]
                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{assign var=tprice value=$product->getTPrice()}]
                    [{assign var=price  value=$product->getPrice()}]
                    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                        <span class="old-price">
                            <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                        </span>
                    [{/if}]
                    [{block name="widget_product_listitem_line_price_value"}]
                        <span id="productPrice_[{$testid}]" class="main-price">
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
                        </span>
                    [{/block}]
                [{/oxhasrights}]
            [{/block}]
        </p>
        [{if $blShowToBasket}]
            [{block name="widget_product_listitem_line_tobasket"}]
                [{oxhasrights ident="TOBASKET"}]
                    <div class="add-to-basket">
                        <input class="quantity" id="amountToBasket_[{$testid}]" type="number" name="am" value="1" size="2" autocomplete="off" />
                        <button id="toBasket_[{$testid}]" name="add_to_basket_button" class="btn">[{oxmultilang ident="DETAILS_ADDTOCART"}]</button>
                    </div>
                [{/oxhasrights}]
            [{/block}]
        [{/if}]
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
