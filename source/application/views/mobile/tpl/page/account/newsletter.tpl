[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="NEWSLETTER_SETTINGS"|oxmultilangassign }]
<h1 id="newsletterSettingsHeader" class="pageHead">[{ oxmultilang ident="NEWSLETTER_SETTINGS" }]</h1>
<div class="content">
    [{if $oView->getSubscriptionStatus() != 0 }]
        [{if $oView->getSubscriptionStatus() == 1 }]
          <div class="alert alert-success">[{ oxmultilang ident="PAGE_ACCOUNT_NEWSLETTER_SUBSCRIPTIONSUCCESS" }]</div>
        [{else }]
          <div class="alert alert-success">[{ oxmultilang ident="PAGE_ACCOUNT_NEWSLETTER_SUBSCRIPTIONREJECT" }]</div>
        [{/if }]
    [{/if }]
    [{include file="form/account_newsletter.tpl"}]
</div>
[{insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]