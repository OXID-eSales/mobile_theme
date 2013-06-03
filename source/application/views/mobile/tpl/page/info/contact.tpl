[{capture append="oxidBlock_content"}]
    [{if $oView->getContactSendStatus() }]
        [{assign var="_statusMessage" value="PAGE_INFO_CONTACT_THANKYOU1"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/success.tpl" statusMessage=$_statusMessage}]
    [{/if }]
    <h1 class="pageHead">[{ $oxcmp_shop->oxshops__oxcompany->value }]</h1>
    <div class="content" id="contacts">
        <ul>
            <li>[{ $oxcmp_shop->oxshops__oxstreet->value }]</li>
            <li>[{ $oxcmp_shop->oxshops__oxzip->value }]&nbsp;[{ $oxcmp_shop->oxshops__oxcity->value }]</li>
            <li>[{ $oxcmp_shop->oxshops__oxcountry->value }]</li>
            [{ if $oxcmp_shop->oxshops__oxtelefon->value}]
                <li>[{ oxmultilang ident="PAGE_INFO_CONTACT_PHONE" }] [{ $oxcmp_shop->oxshops__oxtelefon->value }]</li>
            [{/if}]
            [{ if $oxcmp_shop->oxshops__oxtelefax->value}]
                <li>[{ oxmultilang ident="PAGE_INFO_CONTACT_FAX" }] [{ $oxcmp_shop->oxshops__oxtelefax->value }]</li>
            [{/if}]
            [{ if $oxcmp_shop->oxshops__oxinfoemail->value}]
                <li>[{ oxmultilang ident="PAGE_INFO_CONTACT_EMAIL" }] [{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value encode="javascript"}]</li>
            [{/if}]
        </ul>
        [{include file="form/contact.tpl"}]
        [{ insert name="oxid_tracker" title=$template_title }]
    </div>
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
