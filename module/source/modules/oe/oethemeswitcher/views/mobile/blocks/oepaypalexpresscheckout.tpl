[{$smarty.block.parent}]
[{if $oViewConf->isExpressCheckoutEnabled() }]
    [{oxstyle include=$oViewConf->getModuleUrl('oepaypal','out/src/paypal_mobile.css')}]

    <div class="paypalExpressCheckoutBox">
        <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="oePayPalExpressCheckoutDispatcher">
            <input type="hidden" name="fnc" value="setExpressCheckout">
            <input class="paypalCheckoutBtn" type="image" name="paypalExpressCheckoutButton" src="[{$oViewConf->getModuleUrl('oepaypal','out/img/')}][{oxmultilang ident="OEPAYPAL_CHECKOUT_IMG_MOBILE"}]" title="[{$oViewConf->getPayPalPaymentDescription()|strip_tags:false|trim|oxescape}]">

            [{if $oViewConf->sendOrderInfoToPayPal()}]
        <input id="displayCartInPayPal" type="hidden" name="displayCartInPayPal" value="[{if $oViewConf->sendOrderInfoToPayPalDefault()}]1[{else}]0[{/if}]"  />
            [{/if}]
        </form>
    </div>

[{/if}]