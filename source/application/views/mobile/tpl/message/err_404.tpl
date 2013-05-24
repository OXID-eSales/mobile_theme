[{capture append="oxidBlock_content"}]
    <div class="alertPage alertPageError404">
        <h4 class="alertPageHeader">[{ oxmultilang ident="ERROR" }]</h4>
        <div class="alertPageBody">
            [{if $sUrl}]
                [{assign var="sModifiedUrl" value=$sUrl|escape }]
                [{assign var="sModifiedUrl" value="<i><strong>'"|cat:$sModifiedUrl|cat:"'</strong></i>"}]
                [{ oxmultilang ident="ERROR_404" args=$sModifiedUrl }]
            [{else}]
                [{ oxmultilang ident="ERROR_404" args=''}]
            [{/if}]
        </div>
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]