[{oxscript include="js/widgets/oxdropdown.js" priority=10 }]
[{oxscript add="$('div.dropdown').oxDropDown();" }]
<form class="form" action="[{ $oViewConf->getSelfActionLink() }]" name="newsletter" method="post">
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="subscribe">
    <input type="hidden" name="cl" value="account_newsletter">
    [{if $oView->isNewsletter() == 2}]
        <div class="alert">[{ oxmultilang ident="MESSAGE_SENT_CONFIRMATION_EMAIL" }]</div>
    [{/if}]
    <label for="status">[{ oxmultilang ident="FORM_USER_NEWSLETTER_SUBSCRIPTION" }]</label>
    <div id="status" class="dropdown">
        <input type="hidden" name="status" value="" />
        <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
            <a role="button" href="#">
                <span>[{if $oView->isNewsletter() }][{ oxmultilang ident="FORM_USER_NEWSLETTER_YES" }][{else}][{ oxmultilang ident="FORM_USER_NEWSLETTER_NO" }][{/if}]</span>
                <i class="glyphicon-chevron-down"></i>
            </a>
        </div>
        <ul class='dropdown-menu'>
            <li class="dropdown-option">
                <a data-selection-id="1">[{ oxmultilang ident="FORM_USER_NEWSLETTER_YES" }]</a>
            </li>
            <li class="dropdown-option" >
                <a data-selection-id="0" >[{ oxmultilang ident="FORM_USER_NEWSLETTER_NO" }]</a>
            </li>
        </ul>
    </div>
    <button id="newsletterSettingsSave" type="submit" class="btn">[{ oxmultilang ident="SAVE" }]</button>
</form>
<p>[{ oxmultilang ident="FORM_USER_NEWSLETTER_MESSAGE" }]</p>
[{oxscript add="$('#status.dropdown').oxDropDown();"}]