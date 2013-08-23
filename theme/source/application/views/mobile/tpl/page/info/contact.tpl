[{capture append="oxidBlock_content"}]
    [{if $oView->getContactSendStatus() }]
        [{assign var="_statusMessage" value="PAGE_INFO_CONTACT_THANKYOU1"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/success.tpl" statusMessage=$_statusMessage}]
    [{/if }]
    <h1 class="page-head">[{ $oxcmp_shop->oxshops__oxcompany->value }]</h1>
    <div class="content" id="contacts">
        [{ $oxcmp_shop->oxshops__oxstreet->value }]</br>
        [{ $oxcmp_shop->oxshops__oxzip->value }]&nbsp;[{ $oxcmp_shop->oxshops__oxcity->value }]</br>
        [{ $oxcmp_shop->oxshops__oxcountry->value }]</br>
        [{ if $oxcmp_shop->oxshops__oxtelefon->value}]
            [{ oxmultilang ident="PHONE" }] [{ $oxcmp_shop->oxshops__oxtelefon->value }]</br>
        [{/if}]
        [{ if $oxcmp_shop->oxshops__oxtelefax->value}]
            [{ oxmultilang ident="FAX" }] [{ $oxcmp_shop->oxshops__oxtelefax->value }]</br>
        [{/if}]
        [{ if $oxcmp_shop->oxshops__oxinfoemail->value}]
            [{ oxmultilang ident="EMAIL" }] [{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value encode="javascript"}]</br>
        [{/if}]
        [{include file="form/contact.tpl"}]
        [{ insert name="oxid_tracker" title=$template_title }]
    </div>
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
