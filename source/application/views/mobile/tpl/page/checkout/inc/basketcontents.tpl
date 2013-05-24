[{* basket contents *}]
[{oxscript include="js/widgets/oxarticlelist.js" priority=10}]
[{oxscript add="$('ul.lineView').oxArticleList();"}]

[{assign var="currency" value=$oView->getActCurrency()}]
<form name="basket[{ $basketindex}]" action="[{ $oViewConf->getSelfActionLink()}]" method="post">
    [{ $oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="basket">
    <input type="hidden" name="fnc" value="changebasket">
    <input type="hidden" name="CustomError" value='basket'>
    <ul id="basket" class="lineView basketitems[{if $oViewConf->getActiveClassName() == 'order'}] orderBasketItems[{/if}]">
        [{* basket items *}]
        [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
            [{block name="checkout_basketcontents_basketitem"}]
                [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                [{assign var="oArticle" value=$basketitem->getArticle()}]
                [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]

                <li id="cartItem_[{$smarty.foreach.basketContents.iteration}]" class="productData clearfix">

                    [{block name="checkout_basketcontents_basketitem_image"}]
                        [{* product image *}]
                        <div class="pictureBox">
                            <a href="[{$basketitem->getLink()}]" rel="nofollow">
                                <img src="[{$basketitem->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]">
                            </a>
                        </div>
                    [{/block}]

                    <div class="productListContainer">
                        [{block name="checkout_basketcontents_basketitem_removecheckbox"}]
                            [{if $editable }]
                            <div class="basketRemove">
                                <input type="hidden" name="aproducts[[{ $basketindex }]][remove]" value="0">
                                <button type="button" name="removeBtn" class="btn small remove"><i class="glyphicon-remove"></i></button>
                            </div>
                            [{/if}]
                        [{/block}]

                        [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                            [{* product title & number *}]
                            <p class="poductListTitle">
                                <a class="poductListTitleLink" rel="nofollow" href="[{$basketitem->getLink()}]"><b>[{$basketitem->getTitle()}]</b></a>[{if $basketitem->isSkipDiscount()}] <sup><a rel="nofollow" href="#SkipDiscounts_link" >**</a></sup>[{/if}]
                            </p>
                            <p class="attributes">
                                [{assign var=sep value=", "}]
                                [{assign var=result value=""}]
                                [{foreach key=oArtAttributes from=$oAttributes->getArray() item=oAttr name=attributeContents}]
                                    [{assign var=temp value=$oAttr->oxattribute__oxvalue->value}]
                                    [{assign var=result value=$result$temp$sep}]
                                [{/foreach}]
                                [{$result|trim:$sep}]
                            </p>

                            [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                [{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
                                [{if $oSelections}]
                                    <div class="selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
                                    [{foreach from=$oSelections item=oList name=selections}]
                                        [{if $oViewConf->showSelectListsInList()}]
                                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="aproducts[`$basketindex`][sel]" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                                        [{else}]
                                            [{assign var="oActiveSelection" value=$oList->getActiveSelection()}]
                                            [{if $oActiveSelection}]
                                                <input type="hidden" name="aproducts[[{$basketindex}]][sel][[{$smarty.foreach.selections.index}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
                                                <div>[{$oList->getLabel()}]: [{$oActiveSelection->getName()}]</div>
                                            [{/if}]
                                        [{/if}]
                                    [{/foreach}]
                                    </div>
                                [{/if}]
                            [{/if}]

                            [{if !$editable}]
                                <p class="persparamBox">
                                    [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                        [{if !$smarty.foreach.persparams.first}]<br />[{/if}]
                                        <strong>
                                            [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                                [{ oxmultilang ident="LABEL" suffix="COLON"}]
                                            [{else}]
                                                [{ $sVar}] :
                                            [{/if}]
                                        </strong> [{ $aParam}]
                                    [{/foreach}]
                                </p>
                            [{else}]
                                [{if $basketproduct->oxarticles__oxisconfigurable->value}]
                                    [{if $basketitem->getPersParams()}]
                                        <br />
                                        [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                            <p>
                                                <label class="persParamLabel">
                                                    [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                                        [{ oxmultilang ident="LABEL" suffix="COLON"}]
                                                    [{else}]
                                                        [{ $sVar}]:
                                                    [{/if}]
                                                </label>
                                                <input class="textbox persParam" type="text" name="aproducts[[{ $basketindex}]][persparam][[{ $sVar}]]" value="[{ $aParam}]">
                                            </p>
                                        [{/foreach}]
                                    [{else}]
                                         <p>
                                             <label class="persParamLabel">
                                                 [{ oxmultilang ident="LABEL" suffix="COLON"}]
                                             </label>
                                             <input class="textbox persParam" type="text" name="aproducts[[{ $basketindex}]][persparam][details]" value="">
                                         </p>
                                    [{/if}]
                                [{/if}]
                            [{/if}]
                        [{/block}]

                        [{block name="checkout_basketcontents_basketitem_wrapping"}]
                        [{/block}]

                        [{block name="checkout_basketcontents_basketitem_quantity"}]
                            [{* product quantity manager *}]
                            <p>
                                [{if $editable}]
                                    <input type="hidden" name="aproducts[[{ $basketindex}]][aid]" value="[{ $basketitem->getProductId()}]">
                                    <input type="hidden" name="aproducts[[{ $basketindex}]][basketitemid]" value="[{ $basketindex}]">
                                    <input type="hidden" name="aproducts[[{ $basketindex}]][override]" value="1">
                                    [{if $basketitem->isBundle()}]
                                        <input type="hidden" name="aproducts[[{ $basketindex}]][bundle]" value="1">
                                    [{/if}]

                                    [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                        <input class="quantity" id="am_[{$smarty.foreach.basketContents.iteration}]" type="textbox" name="aproducts[[{ $basketindex}]][am]" value="[{ $basketitem->getAmount()}]" size="2">
                                    [{/if}]
                                [{else}]
                                    [{ $basketitem->getAmount()}]
                                [{/if}]
                                [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle())}]
                                    +[{ $basketitem->getdBundledAmount()}]
                                [{/if}]
                            </p>
                        [{/block}]

                        <div class="productListPrice">
                            [{block name="checkout_basketcontents_basketitem_unitprice"}]
                            [{/block}]

                            [{block name="checkout_basketcontents_basketitem_vat"}]
                                [{* product VAT percent *}]
                                <span class="vatPercent">
                                    ([{ $basketitem->getVatPercent()}]%)
                                </span>
                            [{/block}]

                            [{block name="checkout_basketcontents_basketitem_totalprice"}]
                                [{* product quantity * price *}]
                                <span class="price">
                                    [{ $basketitem->getFTotalPrice()}]&nbsp;[{ $currency->sign}]
                                </span>
                            [{/block}]
                        </div>
                    </div>
                </li>
            [{/block}]

            [{* packing unit *}]
            [{if $smarty.const.OXID_VERSION_EE}]
                [{block name="checkout_basketcontents_itemvpe"}]
                [{/block}]
            [{/if}][{* OXID_VERSION_EE *}]

            [{block name="checkout_basketcontents_itemerror"}]
                [{foreach from=$Errors.basket item=oEr key=key}]
                    [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
                        [{* display only the exceptions for the current article *}]
                        [{if $basketindex == $oEr->getValue('basketIndex')}]
                            <li class="basketError">
                                <span class="inlineError">[{ $oEr->getOxMessage()}] <strong>[{ $oEr->getValue('remainingAmount')}]</strong></span>
                            </li>
                        [{/if}]
                    [{/if}]
                    [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
                        [{if $basketitem->getProductId() == $oEr->getValue('productId')}]
                            <li class="basketError">
                                <span class="inlineError">[{ $oEr->getOxMessage()}]</span>
                            </li>
                        [{/if}]
                    [{/if}]
                [{/foreach}]
            [{/block}]
        [{*  basket items end  *}]
        [{/foreach}]

         [{block name="checkout_basketcontents_giftwrapping"}]
          [{/block}]
    </ul>

    [{block name="checkout_basketcontents_basketfunctions"}]
        [{if $editable}]
            <div id="basketFn" class="basketFunctions">
                [{*  basket update/delete buttons  *}]
                <button id="basketUpdate" class="btn small" type="submit" name="updateBtn"><i class="glyphicon-refresh"></i></button> <label for="basketUpdate">[{ oxmultilang ident="UPDATE"}]</label>
            </div>
        [{/if}]
    [{/block}]

    [{block name="checkout_basketcontents_summary"}]
        <div id="basketSummary" class="summary[{if $oViewConf->getActiveClassName() == 'order'}] orderSummary[{/if}]">
            [{*  basket summary  *}]
            <table>
                [{if !$oxcmp_basket->getDiscounts()}]
                    [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                        <tr>
                            <th>[{ oxmultilang ident="TOTAL_NET" suffix="COLON"}]</th>
                            <td id="basketTotalProductsNetto">[{ $oxcmp_basket->getProductsNetPrice()}]&nbsp;[{ $currency->sign}]</td>
                        </tr>
                    [{/block}]

                    [{block name="checkout_basketcontents_nodiscountproductvats"}]
                        [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key}]
                            <tr>
                                <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</th>
                                <td>[{ $VATitem}]&nbsp;[{ $currency->sign}]</td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{block name="checkout_basketcontents_nodiscounttotalgross"}]
                        <tr>
                            <th>[{ oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                            <td id="basketTotalProductsGross">[{ $oxcmp_basket->getFProductsPrice()}]&nbsp;[{ $currency->sign}]</td>
                        </tr>
                    [{/block}]
                [{else}]
                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_discounttotalnet"}]
                            <tr>
                                <th>[{ oxmultilang ident="TOTAL_NET" suffix="COLON"}]</th>
                                <td id="basketTotalProductsNetto">[{ $oxcmp_basket->getProductsNetPrice()}]&nbsp;[{ $currency->sign}]</td>
                            </tr>
                        [{/block}]
                    [{else}]
                         [{block name="checkout_basketcontents_discounttotalgross"}]
                            <tr>
                                <th>[{ oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                                <td id="basketTotalProductsGross">[{ $oxcmp_basket->getFProductsPrice()}]&nbsp;[{ $currency->sign}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_basketcontents_discounts"}]
                        [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                            <tr>
                                <th>
                                    <b>[{if $oDiscount->dDiscount < 0}][{ oxmultilang ident="SURCHARGE"}][{else}][{ oxmultilang ident="DISCOUNT"}][{/if}]&nbsp;</b>
                                    [{ $oDiscount->sDiscount}]
                                </th>
                                <td>
                                    [{if $oDiscount->dDiscount < 0}][{ $oDiscount->fDiscount|replace:"-":""}][{else}]-[{ $oDiscount->fDiscount}][{/if}]&nbsp;[{ $currency->sign}]
                                </td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if !$oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_totalnet"}]
                            <tr>
                                <th>[{ oxmultilang ident="TOTAL_NET" suffix="COLON"}]</th>
                                <td id="basketTotalNetto">[{ $oxcmp_basket->getProductsNetPrice()}]&nbsp;[{ $currency->sign}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_basketcontents_productvats"}]
                        [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key}]
                            <tr>
                                <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</th>
                                <td>[{ $VATitem}]&nbsp;[{ $currency->sign}]</td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_totalgross"}]
                            <tr>
                                <th>[{ oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                                <td id="basketTotalGross">[{ $oxcmp_basket->getFProductsPrice()}]&nbsp;[{ $currency->sign}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]
                [{/if}]

                [{block name="checkout_basketcontents_voucherdiscount"}]
                [{/block}]

                [{block name="checkout_basketcontents_delcosts"}]
                    [{if $oxcmp_basket->getDelCostNet() }]
                        <tr>
                            <th>[{ oxmultilang ident="SHIPPING_NET" suffix="COLON" }]</th>
                            <td id="basketDeliveryNetto">[{ $oxcmp_basket->getDelCostNet() }]&nbsp;[{ $currency->sign }]</td>
                        </tr>
                        [{if $oxcmp_basket->getDelCostVat() }]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oxcmp_basket->getDelCostVatPercent() }]
                                    [{/if}]
                                    <td id="basketDeliveryVat">[{ $oxcmp_basket->getDelCostVat() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                        [{/if }]
                    [{elseif $oxcmp_basket->getFDeliveryCosts() }]
                        <tr>
                            <th>[{ oxmultilang ident="SHIPPING_COST" }]</th>
                            <td id="basketDeliveryGross">[{ $oxcmp_basket->getFDeliveryCosts() }]&nbsp;[{ $currency->sign }]</td>
                        </tr>
                    [{/if }]
                [{/block}]

                [{block name="checkout_basketcontents_paymentcosts"}]
                    [{if $oxcmp_basket->getPayCostNet() }]
                        <tr>
                            <th>[{if $oxcmp_basket->getPaymentCosts() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" }]</th>
                            <td id="basketPaymentNetto">[{ $oxcmp_basket->getPayCostNet() }]&nbsp;[{ $currency->sign }]</td>
                        </tr>
                        [{if $oxcmp_basket->getPayCostVat() }]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                    <th>[{ oxmultilang ident="SURCHARGE_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oxcmp_basket->getPayCostVatPercent() }]</th>
                                [{/if}]
                                <td id="basketPaymentVat">[{ $oxcmp_basket->getPayCostVat() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                        [{/if }]
                    [{elseif $oxcmp_basket->getFPaymentCosts() }]
                        <tr>
                            <th>[{if $oxcmp_basket->getPaymentCosts() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" }]</th>
                            <td id="basketPaymentGross">[{ $oxcmp_basket->getFPaymentCosts() }]&nbsp;[{ $currency->sign }]</td>
                        </tr>
                    [{/if }]
                [{/block}]

                [{block name="checkout_basketcontents_ts"}]
                [{/block}]

                [{block name="checkout_basketcontents_wrappingcosts"}]
                [{/block}]

                [{block name="checkout_basketcontents_grandtotal"}]
                    <tr id="basketGrandTotal">
                        <th><strong>[{ oxmultilang ident="GRAND_TOTAL" suffix="COLON" }]</strong></th>
                        <td><strong>[{ $oxcmp_basket->getFPrice() }]&nbsp;[{ $currency->sign }]</strong></td>
                    </tr>
                [{/block}]

                [{if $oxcmp_basket->hasSkipedDiscount()}]
                    <tr>
                        <td class="note">**</span> [{ oxmultilang ident="MESSAGE_COUPON_NOT_APPLIED_FOR_ARTICLES"}]</td>
                    </tr>
                [{/if}]
            </table>
        </div>
    [{/block}]
 </form>