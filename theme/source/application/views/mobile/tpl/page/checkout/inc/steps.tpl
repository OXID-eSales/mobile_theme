[{block name="checkout_steps_main"}]
    <ul class="steps [{ if $active == 5}] last-step[{/if}]">
        [{if $oxcmp_basket->getProductsCount() }]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_basket"}]
            <li class="step1[{ if $active == 1}] active [{elseif $active > 1}] passed [{/if}]">
                [{if $showStepLinks}]<a rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]">[{/if}]
                    <span class="step-number">01</span>
                    <span class="step-name">
                        [{ oxmultilang ident="STEPS_BASKET" }]
                    </span>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount() }]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_send"}]
            <li class="step2[{ if $active == 2}] active [{elseif $active > 2}] passed [{/if}]">
                [{if $showStepLinks}]<a rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getOrderLink() }]">[{/if}]
                    <span class="step-number">02</span>
                    <span class="step-name">
                        [{ oxmultilang ident="STEPS_SEND" }]
                    </span>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if $active != 1 && $oxcmp_user && !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount() }]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_pay"}]
            <li class="step3[{ if $active == 3}] active [{elseif $active > 3}] passed [{/if}]">
                [{if $showStepLinks}]<a rel="nofollow" [{if $oViewConf->getActiveClassName() == "user"}]id="paymentStep"[{/if}] href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]">[{/if}]
                    <span class="step-number">03</span>
                    <span class="step-name">
                        [{ oxmultilang ident="STEPS_PAY" }]
                    </span>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
            [{oxscript add="$('#paymentStep').click( function() { $('#userNextStepBottom').click();return false;});"}]
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if $active != 1 && $oxcmp_user && $oxcmp_basket->getProductsCount() && $oView->getPaymentList() && !$oView->isLowOrderPrice()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_order"}]
            <li class="step4[{ if $active == 4}] active [{elseif $active > 4}] passed [{/if}]">
                [{if $showStepLinks}]<a rel="nofollow" [{if $oViewConf->getActiveClassName() == "payment"}]id="orderStep"[{/if}] href="[{ if $oViewConf->getActiveClassName() == "payment"}]javascript:document.forms.order.submit();[{else}][{ oxgetseourl ident=$oViewConf->getOrderConfirmLink() }][{/if}]">[{/if}]
                    <span class="step-number">04</span>
                    <span class="step-name">
                        [{ oxmultilang ident="STEPS_ORDER" }]
                    </span>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
            [{oxscript add="$('#orderStep').click( function() { $('#paymentNextStepBottom').click();return false;});"}]
        [{/block}]

        [{block name="checkout_steps_laststep"}]
            [{if $active == 5}]
                <li class="step5 active">
                    <span class="step-number">05</span>
                    <span class="step-name">[{ oxmultilang ident="READY" }]</span>
                </li>
            [{else}]
                <li class="step5">
                    <span class="step-number last">[{ oxmultilang ident="OK" }]</span>
                </li>
            [{/if}]
        [{/block}]
    </ul>
[{/block}]