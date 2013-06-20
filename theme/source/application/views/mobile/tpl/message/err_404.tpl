[{capture append="oxidBlock_content"}]
    <h1 class="page-head">[{ oxmultilang ident="MESSAGE_ERR_404TITLE" }]</h1>
    <div class="content">
        <div class="alert alert-error">
            [{if $sUrl}]
                [{assign var="sModifiedUrl" value=$sUrl|escape }]
                [{assign var="sModifiedUrl" value="<i><strong>'"|cat:$sModifiedUrl|cat:"'</strong></i>"}]
                [{ oxmultilang ident="MESSAGE_ERR_404_PREURL" }][{ $sModifiedUrl }]
            [{else}]
                [{ oxmultilang ident="MESSAGE_ERR_404"}]
            [{/if}]
        </div>
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]