[{capture append="oxidBlock_content"}]

    [{block name="checkout_thankyou_main"}]
        [{assign var="order" value=$oView->getOrder()}]
        [{assign var="basket" value=$oView->getBasket()}]

        <div class="checkout-thank-you content" id="thankyouPage">
            [{* ordering steps *}]
            [{include file="page/checkout/inc/steps.tpl" active=5 }]
            <h3 class="block-head">[{ oxmultilang ident="THANK_YOU" }]</h3>
            <div class="separator"></div>
            [{block name="checkout_thankyou_info"}]
                [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_THANKYOU1" }] [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_THANKYOU2" }] [{$oxcmp_shop->oxshops__oxname->value }]. <br>
                [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_REGISTEREDYOUORDERNO1" }] [{ $order->oxorder__oxordernr->value }] [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_REGISTEREDYOUORDERNO2" }]<br>
                [{if !$oView->getMailError() }]
                    [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_YOURECEIVEDORDERCONFIRM" }]<br>
                [{else}]<br>
                    [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_CONFIRMATIONNOTSUCCEED" }]<br>
                [{/if}]
                <br>
                [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_WEWILLINFORMYOU" }]<br><br>
            [{/block}]

            [{block name="checkout_thankyou_proceed"}]
                [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_YOUCANGO" }]
                <a id="backToShop" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getHomeLink() }]" class="link">[{ oxmultilang ident="BACK_TO_START_PAGE" }]</a>
                [{if $oxcmp_user->oxuser__oxpassword->value }]
                    [{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_OR" }]
                    <a id="orderHistory" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" class="link">[{ oxmultilang ident="CHECK_YOUR_ORDER_HISTORY" }]</a>.
                [{/if}]
            [{/block}]

            [{block name="checkout_thankyou_ts"}]
                [{if $oViewConf->showTs("THANKYOU") && $oViewConf->getTsId() }]
                    [{assign var="sTSRatingImg" value="https://www.trustedshops.com/bewertung/widget/img/bewerten_"|cat:$oView->getActiveLangAbbr()|cat:".gif"}]
                    <h3 class="block-head">[{ oxmultilang ident="TS_RATINGS" }]</h3>
                    [{ oxmultilang ident="TS_RATINGS_RATEUS" }]
                    <div class="etrustTsRatingButton">
                        <a href="[{ $oViewConf->getTsRatingUrl() }]" target="_blank" title="[{ oxmultilang ident="TS_RATINGS_URL_TITLE" }]">
                            <img src="[{$sTSRatingImg}]" border="0" alt="[{ oxmultilang ident="TS_RATINGS_BUTTON_ALT" }]" align="middle">
                        </a>
                    </div>
                [{/if}]
            [{/block}]
        </div>
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{include file="layout/page.tpl"}]