[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="CHANGE_PASSWORD"|oxmultilangassign }]

<ul class="nav nav-list main-nav-list">
    <li>
        <a class="back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
            <span>[{oxmultilang ident="BACK"}]</span>
            <i class="glyphicon-chevron-left"></i>
        </a>
    </li>
</ul>
[{if $oView->isPasswordChanged() }]
     <div class="alert alert-success">
      [{ oxmultilang ident="PAGE_ACCOUNT_PASSWORD_PASSWORDCHANGED" }]
     </div>
[{/if}]
[{if count($Errors) > 0 && count($Errors.user) > 0}]
<div class="alert alert-error">
    [{foreach from=$Errors.user item=oEr key=key }]
        <p>[{ $oEr->getOxMessage()}]</p>
    [{/foreach}]
</div>
[{/if}]
<h1 id="personalSettingsHeader">[{ oxmultilang ident="CHANGE_PASSWORD_2" }]</h1>
<div class="content">
    [{include file="form/user_password.tpl"}]
    [{insert name="oxid_tracker" title=$template_title }]
</div>
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="password"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
