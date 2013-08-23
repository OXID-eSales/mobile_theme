[{assign var="template_title" value="LOGIN"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]
    <h1 class="page-head">[{ oxmultilang ident="REGISTER" }]</h1>
    <div id="loginAccount" class="content clearfix">
        <p>[{ oxmultilang ident="LOGIN_ALREADY_CUSTOMER" }]</p>
        [{include file="form/login_account.tpl"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]
