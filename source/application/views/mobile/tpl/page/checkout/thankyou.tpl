[{capture append="oxidBlock_content"}]

    [{block name="checkout_thankyou_main"}]
        [{assign var="order" value=$oView->getOrder()}]
        [{assign var="basket" value=$oView->getBasket()}]

        <div class="content" id="thankyouPage">
            [{* ordering steps *}]
            [{include file="page/checkout/inc/steps.tpl" active=5 }]
            <h3 class="blockHead">[{ oxmultilang ident="THANK_YOU" }]</h3>
            <div class="separator"></div>
            [{block name="checkout_thankyou_info"}]
                [{ oxmultilang ident="THANK_YOU_FOR_ORDER" }] [{ $oxcmp_shop->oxshops__oxname->value }]. <br>
                [{ oxmultilang ident="REGISTERED_YOUR_ORDER" args=$order->oxorder__oxordernr->value}] <br>
                [{if !$oView->getMailError() }]
                    [{ oxmultilang ident="MESSAGE_YOU_RECEIVED_ORDER_CONFIRM" }]<br>
                [{else}]<br>
                    [{ oxmultilang ident="MESSAGE_CONFIRMATION_NOT_SUCCEED" }]<br>
                [{/if}]
                <br>
                [{ oxmultilang ident="MESSAGE_WE_WILL_INFORM_YOU" }]<br><br>
            [{/block}]

            [{block name="checkout_thankyou_proceed"}]
                [{ oxmultilang ident="YOU_CAN_GO" }]
                <a id="backToShop" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getHomeLink() }]" class="link">[{ oxmultilang ident="BACK_TO_START_PAGE" }]</a>
                [{if $oxcmp_user->oxuser__oxpassword->value }]
                    [{ oxmultilang ident="OR" }]
                    <a id="orderHistory" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" class="link">[{ oxmultilang ident="CHECK_YOUR_ORDER_HISTORY" }]</a>.
                [{/if}]
            [{/block}]

            [{block name="checkout_thankyou_ts"}]
                [{if $oViewConf->showTs("THANKYOU") && $oViewConf->getTsId() }]
                    [{assign var="sTSRatingImg" value="https://www.trustedshops.com/bewertung/widget/img/bewerten_"|cat:$oView->getActiveLangAbbr()|cat:".gif"}]
                    <h3 class="blockHead">[{ oxmultilang ident="TRUSTED_SHOPS_CUSTOMER_RATINGS" }]</h3>
                    [{ oxmultilang ident="RATE_OUR_SHOP" }]
                    <div class="etrustTsRatingButton">
                        <a href="[{ $oViewConf->getTsRatingUrl() }]" target="_blank" title="[{ oxmultilang ident="TRUSTED_SHOPS_RATINGS" }]">
                            <img src="[{$sTSRatingImg}]" border="0" alt="[{ oxmultilang ident="WRITE_REVIEW_2" }]" align="middle">
                        </a>
                    </div>
                [{/if}]
            [{/block}]
        </div>
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{include file="layout/page.tpl"}]