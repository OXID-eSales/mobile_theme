[{capture append="oxidBlock_content"}]
    <ul class="nav nav-list main-nav-list">
        <li>
            <a class="back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
                <span>[{oxmultilang ident="BACK"}]</span>
                <i class="glyphicon-chevron-left"></i>
            </a>
        </li>
    </ul>
    [{assign var="template_title" value="NEWSLETTER_SETTINGS"|oxmultilangassign}]
    <h1 id="newsletterSettingsHeader" class="page-head">[{ oxmultilang ident="NEWSLETTER_SETTINGS"}]</h1>
    <div class="content">
        [{if $oView->getSubscriptionStatus() != 0}]
            [{if $oView->getSubscriptionStatus() == 1}]
                <div class="alert alert-success">[{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_SUCCESS"}]</div>
            [{else}]
                <div class="alert alert-success">[{ oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED"}]</div>
            [{/if}]
        [{/if}]
        [{include file="form/account_newsletter.tpl"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]