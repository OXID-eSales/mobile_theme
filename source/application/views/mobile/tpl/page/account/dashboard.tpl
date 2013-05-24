[{assign var="template_title" value="MY_ACCOUNT"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]
<div id="cat_list">
    <ul class="mainNavList nav nav-list">
        [{block name="account_dashboard_col1"}]
        <li>
            <a id="linkAccountPassword" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password" }]" rel="nofollow">
                [{ oxmultilang ident="CHANGE_PASSWORD" }]
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        <li>
            <a id="linkAccountNewsletter" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter" }]" rel="nofollow">
                [{ oxmultilang ident="NEWSLETTER_SETTINGS" }]
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        <li>
            <a id="linkAccountBillship" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user" }]" rel="nofollow">
                [{ oxmultilang ident="BILLING_SHIPPING_SETTINGS" }]
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        <li>
            <a id="linkAccountOrder" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" rel="nofollow">
                [{ oxmultilang ident="ORDER_HISTORY" }]
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        [{if $oView->isEnabledDownloadableFiles()}]
        <li>
            <a id="linkAccountDownloads" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]" rel="nofollow">
                [{ oxmultilang ident="MY_DOWNLOADS" }]
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        [{/if}]
        [{/block}]
        [{block name="account_dashboard_col2"}]
        <li>
            <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow">
                [{ oxmultilang ident="MY_WISH_LIST" }]
                <i class="glyphicon-chevron-right"></i>
            </a>
        </li>
        [{if $oViewConf->getShowWishlist()}]
            <li>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow">
                    [{ oxmultilang ident="MY_GIFT_REGISTRY" }]
                    <i class="glyphicon-chevron-right"></i>
                </a>
            </li>
        [{/if}]
        [{if $oViewConf->getShowCompareList()}]
            <li>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow">
                    [{ oxmultilang ident="MY_PRODUCT_COMPARISON" }]
                    <i class="glyphicon-chevron-right"></i>
                </a>
            </li>
        [{/if}]
        [{if $oViewConf->getShowListmania()}]
            <li>
                <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]">
                    [{ oxmultilang ident="MY_LISTMANIA" }]
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