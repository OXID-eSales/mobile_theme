[{capture append="oxidBlock_content"}]

    <div class="content">
        [{* ordering steps *}]
        [{include file="page/checkout/inc/steps.tpl" active=1 }]

        [{block name="checkout_basket_main"}]
            [{assign var="currency" value=$oView->getActCurrency() }]
            [{if !$oxcmp_basket->getProductsCount()  }]
                [{block name="checkout_basket_emptyshippingcart"}]
                    <div class="alert alert-error">[{oxmultilang ident="BASKET_EMPTY"}]</div>
                [{/block}]
            [{else }]
                [{* basket btn next *}]
                [{block name="checkout_basket_next_step_top"}]
                    [{if !$oxcmp_basket->isBelowMinOrderPrice() }]
                        <div id="btnNextStepTop">
                        [{block name="mb_basket_btn_next_top"}]
                            <form class="form" action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="user">
                                <input type="submit" class="btn nextStep" value="[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]" />
                            </form>
                        [{/block}]
                        </div>
                    [{/if}]
                [{/block}]

                [{include file="page/checkout/inc/basketcontents.tpl" editable=true}]

                [{if $oViewConf->getShowVouchers()}]
                    [{block name="checkout_basket_vouchers"}]
                    [{/block}]
                [{/if}]


                [{block name="checkout_basket_next_step_bottom"}]
                    [{if $oView->showBackToShop()}]
                        [{block name="checkout_basket_backtoshop_bottom"}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="backtoshop">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="basket">
                                    <input type="hidden" name="fnc" value="backtoshop">
                                    <button type="submit" class="btn">[{oxmultilang ident="CONTINUE_SHOPPING"}]</button>
                                </div>
                            </form>
                        [{/block}]
                    [{/if}]

                    [{* basket btn next *}]
                    [{if $oxcmp_basket->isBelowMinOrderPrice() }]
                        [{block name="checkout_basket_loworderprice_bottom"}]
                        <div class="alert alert-error">[{oxmultilang ident="MIN_ORDER_PRICE"}] [{oxprice price=$oxcmp_basket->getMinOrderPrice() currency=$currency}]</div>
                        [{/block}]
                    [{else}]
                        <div id="btnNextStepBottom">
                        [{block name="mb_basket_btn_next_bottom"}]
                            <form class="form" action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="user">
                                <input type="submit" class="btn nextStep" value="[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]" />
                            </form>
                        [{/block}]
                        </div>
                    [{/if}]
                [{/block}]
            [{/if}]
        [{/block}]
        [{insert name="oxid_tracker" title=$template_title }]
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]