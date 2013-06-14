[{capture append="oxidBlock_content"}]
    <ul class="nav nav-list main-nav-list">
        <li>
            <a class="back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
                <span>[{oxmultilang ident="BACK"}]</span>
                <i class="glyphicon-chevron-left"></i>
            </a>
        </li>
    </ul>
    [{assign var="template_title" value="PAGE_ACCOUNT_NOTICELIST_MYWISHLIST"|oxmultilangassign }]
     <h1 class="pageHead">[{ oxmultilang ident="PAGE_ACCOUNT_NOTICELIST_MYWISHLIST" }]</h1>
        [{if $oView->getNoticeProductList() }]
            [{include file="widget/product/list.tpl" type="line" listId="noticelistProductList" title="" products=$oView->getNoticeProductList() removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value}]
        [{else}]
            <div class="content">
                <div class="alert alert-error">
                  [{ oxmultilang ident="PAGE_ACCOUNT_NOTICELIST_EMPTYWISHLIST" }]
                </div>
            </div>
        [{/if}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="noticelist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]