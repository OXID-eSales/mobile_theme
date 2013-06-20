[{capture append="oxidBlock_content"}]
[{capture append="oxidBlock_content"}]
    <h1 class="page-head">[{ oxmultilang ident="ERROR_MESSAGE_PERMISSION_DENIED" }]</h1>
    <div class="content">
        <div class="alert alert-error">
            [{ oxmultilang ident="ERROR_MESSAGE_ACCESS_DENIED" }]
        </div>
    </div>
    [{ insert name="oxid_tracker"}]
[{/capture}]

[{include file="layout/page.tpl"}]