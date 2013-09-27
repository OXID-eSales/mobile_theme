[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="ORDER_HISTORY"|oxmultilangassign}]

<ul class="nav nav-list main-nav-list">
    <li>
        <a class="back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
            <span>[{oxmultilang ident="BACK"}]</span>
            <i class="glyphicon-chevron-left"></i>
        </a>
    </li>
</ul>
<h1 class="page-head">[{ oxmultilang ident="ORDER_HISTORY" }]</h1>

[{assign var=oOrders value=$oView->getOrderList()}]

[{block name="account_order_history"}]
[{if count($oOrders) > 0}]
    [{assign var=oArticleList value=$oView->getOrderArticleList()}]
    <ul id="orderList" class="order-history-list">
        [{foreach from=$oOrders item=order}]
            <li>
                <ul class="order-history-details">
                    <li>
                        <span id="accOrderDate_[{$order->oxorder__oxordernr->value}]" title="[{ oxmultilang ident="ORDER_DATE" }]" >[{ $order->oxorder__oxorderdate->value|date_format:"%d.%m.%Y" }]</span>
                        <strong>[{ oxmultilang ident="ORDER_NUMBER" }]:</strong>
                        <span id="accOrderNo_[{$order->oxorder__oxordernr->value}]">[{ $order->oxorder__oxordernr->value }]</span>
                    </li>
                    <li>
                        <strong>[{ oxmultilang ident="STATUS" }]</strong>
                        <span id="accOrderStatus_[{$order->oxorder__oxordernr->value}]">
                            [{if $order->oxorder__oxstorno->value}]
                                <span class="note">[{ oxmultilang ident="ORDER_IS_CANCELED" }]</span>
                            [{elseif $order->oxorder__oxsenddate->value !="-" }]
                                <span>[{ oxmultilang ident="SHIPPED" }]</span>
                            [{else}]
                                <span class="note">[{ oxmultilang ident="NOT_SHIPPED_YET" }]</span>
                            [{/if}]
                        </span>
                    </li>
                    [{if $order->getShipmentTrackingUrl()}]
                        <li>
                            <strong>[{ oxmultilang ident="TRACKING_ID" }]</strong>
                            <span id="accOrderTrack_[{$order->oxorder__oxordernr->value}]">
                                <a href="[{$order->getShipmentTrackingUrl()}]">[{ oxmultilang ident="TRACK_SHIPMENT" }]</a>
                            </span>
                        </li>
                    [{/if}]
                    <li>
                        <strong>[{ oxmultilang ident="SHIPMENT_TO" }]</strong>
                        <span id="accOrderName_[{$order->oxorder__oxordernr->value}]">
                        [{if $order->oxorder__oxdellname->value }]
                            [{ $order->oxorder__oxdelfname->value }]
                            [{ $order->oxorder__oxdellname->value }]
                        [{else }]
                            [{ $order->oxorder__oxbillfname->value }]
                            [{ $order->oxorder__oxbilllname->value }]
                        [{/if}]
                        </span>
                    </li>
                </ul>
                <ul class="order-history-articles">
                    [{foreach from=$order->getOrderArticles(true) item=orderitem name=testOrderItem}]
                        <li>
                            [{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value }]
                            [{assign var=oArticle value=$oArticleList[$sArticleId] }]
                                <span class="order-history-article-quantity" title="[{oxmultilang ident="QNT"}]">[{ $orderitem->oxorderarticles__oxamount->value }]</span>
                                [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]
                                    <a  id="accOrderLink_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ $oArticle->getLink() }]">
                                [{/if}]
                                    [{ $orderitem->oxorderarticles__oxtitle->value }]
                                    [{if $orderitem->oxorderarticles__oxselvariant->value}]
                                        <br /><span class="variants">[{ $orderitem->oxorderarticles__oxselvariant->value }]</span>
                                    [{/if}]
                                [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]</a>[{/if}]
                                [{* Commented due to Trusted Shops precertification. Enable if needed *}]
                                [{*
                                [{oxhasrights ident="TOBASKET"}]
                                [{if $oArticle->oxarticles__oxid->value && $oArticle->isBuyable() }]
                                    <a id="accOrderToBasket_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" params="fnc=tobasket&amp;aid=`$oArticle->oxarticles__oxid->value`&amp;am=1" }]" rel="nofollow">[{ oxmultilang ident="TO_CART" }]</a>
                                [{/if}]
                                [{/oxhasrights}]
                                *}]
                            [{if 'EE' == $oViewConf->oeThemeSwitcherGetEdition()}]
                                [{if $orderitem->getStatus()}]
                                    <div class="article-details">
                                        <strong>[{ oxmultilang ident="DELIVERY_STATUS" }]</strong>
                                        <ul>
                                            [{foreach from=$orderitem->getStatus() item=aStatus }]
                                                <li>
                                                    <strong>[{if $aStatus->STATUS == "ANG"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_ANG" }]
                                                    [{ elseif $aStatus->STATUS == "HAL"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_HAL" }]
                                                    [{ elseif $aStatus->STATUS == "BES"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_BES" }]
                                                    [{ elseif $aStatus->STATUS == "EIN"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_EIN" }]
                                                    [{ elseif $aStatus->STATUS == "AUS"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_AUS" }]
                                                    [{ elseif $aStatus->STATUS == "STO"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_STO" }]
                                                    [{ elseif $aStatus->STATUS == "NLB"}]
                                                      [{ oxmultilang ident="DELIVERY_STATUS_NLB" }]
                                                    [{else}]
                                                      [{ $aStatus->STATUS }]
                                                    [{/if}]</strong>
                                                    <span>([{ $aStatus->date|date_format:"%d.%m.%Y %H:%M" }]) </span>
                                                </li>
                                            [{/foreach}]
                                        </ul>
                                        [{if $aStatus->trackingid }]
                                            <strong>[{ oxmultilang ident="TRACKING_ID" }]</strong>
                                            <span>[{ $aStatus->trackingid }]</span>
                                        [{/if}]
                                    </div>
                                [{/if}]
                            [{/if}]
                        </li>
                    [{/foreach}]
                </ul>
            </li>
        [{/foreach}]
    </ul>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
[{else}]
    <div class="content">
        [{ oxmultilang ident="ORDER_EMPTY_HISTORY" }]
    </div>
[{/if}]
[{/block}]
[{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]