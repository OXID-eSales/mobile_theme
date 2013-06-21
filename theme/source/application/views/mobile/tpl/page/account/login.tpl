[{assign var="template_title" value="LOGIN"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]
    <h1 class="page-head">[{ oxmultilang ident="PAGE_ACCOUNT_INC_LOGIN_LOGIN" }]</h1>
    <div id="loginAccount" class="content clearfix">
        <p>[{ oxmultilang ident="PAGE_ACCOUNT_INC_LOGIN_ALREADYCUSTOMER" }]</p>
        [{include file="form/login_account.tpl"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]
