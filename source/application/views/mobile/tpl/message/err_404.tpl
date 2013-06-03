[{capture append="oxidBlock_content"}]
    <div class="alertPage alertPageError404">
        <h4 class="alertPageHeader">[{ oxmultilang ident="MESSAGE_ERR_404TITLE" }]</h4>
        <div class="alertPageBody">
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