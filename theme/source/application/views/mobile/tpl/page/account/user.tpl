[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="BILLING_SHIPPING_SETTINGS"|oxmultilangassign }]
<ul class="nav nav-list main-nav-list">
    <li>
        <a class="back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
            <span>[{oxmultilang ident="BACK"}]</span>
            <i class="glyphicon-chevron-left"></i>
        </a>
    </li>
</ul>
<h1 id="addressSettingsHeader" class="page-head">[{ $template_title }]</h1>
<div class="content">
    [{block name="account_user_form"}]
        [{include file="form/user.tpl"}]
    [{/block}]
    [{ insert name="oxid_tracker" title=$template_title }]
</div>
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
	[{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]