[{capture append="oxidBlock_content"}]
    <div class="alert-page alert-page-error">
        <h4 class="alertPageHeader">[{ oxmultilang ident="ERROR_MESSAGE_PERMISSION_DENIED" }]</h4>
        <div class="alertPageBody">[{ oxmultilang ident="ERROR_MESSAGE_ACCESS_DENIED" }]</div>
    </div>
    [{ insert name="oxid_tracker"}]
[{/capture}]

[{include file="layout/page.tpl"}]