[{assign var="template_title" value="PAGE_ACCOUNT_DASHBOARD_MYACCOUNT"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]
<div id="cat_list">
    <ul class="main-nav-list nav nav-list">
        [{block name="account_dashboard_col1"}]
        <li>
            <a id="linkAccountPassword" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password" }]" rel="nofollow">
                <span>[{ oxmultilang ident="CHANGE_PASSWORD" }]</span>
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        <li>
            <a id="linkAccountNewsletter" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter" }]" rel="nofollow">
                <span>[{ oxmultilang ident="NEWSLETTER_SETTINGS" }]</span>
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        <li>
            <a id="linkAccountBillship" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user" }]" rel="nofollow">
                <span>[{ oxmultilang ident="BILLING_SHIPPING_SETTINGS" }]</span>
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        <li>
            <a id="linkAccountOrder" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" rel="nofollow">
                <span>[{ oxmultilang ident="ORDER_HISTORY" }]</span>
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        [{if $oView->isEnabledDownloadableFiles()}]
        <li>
            <a id="linkAccountDownloads" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]" rel="nofollow">
                <span>[{ oxmultilang ident="MY_DOWNLOADS" }]</span>
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        [{/if}]
        [{/block}]
        [{block name="account_dashboard_col2"}]
        <li>
            <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow">
                <span>[{ oxmultilang ident="MY_WISH_LIST" }]</span>
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        [{if $oViewConf->getShowWishlist()}]
            <li>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow">
                    <span>[{ oxmultilang ident="MY_GIFT_REGISTRY" }]</span>
                    <i class="glyphicon-chevron-right"></i>
                </a>
            </li>
        [{/if}]
        [{if $oViewConf->getShowCompareList()}]
            <li>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow">
                    <span>[{ oxmultilang ident="MY_PRODUCT_COMPARISON" }]</span>
                    <i class="glyphicon-chevron-right"></i>
                </a>
            </li>
        [{/if}]
        [{if $oViewConf->getShowListmania()}]
            <li>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]">
                    <span>[{ oxmultilang ident="MY_LISTMANIA" }]</span>
                    <i class="glyphicon-chevron-right"></i>
                </a>
            </li>
        [{/if}]
        [{/block}]
    </ul>
    [{insert name="oxid_tracker" title=$template_title }]
</div>
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]