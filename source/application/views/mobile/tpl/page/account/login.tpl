[{assign var="template_title" value="LOGIN"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]
    <h1 class="title">[{ oxmultilang ident="LOGIN" }]</h1>
    <div id="loginAccount" class="content clearfix">
        <p>[{ oxmultilang ident="LOGIN_ALREADY_CUSTOMER" suffix="COLON" }]</p>

        [{include file="form/login_account.tpl"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]
