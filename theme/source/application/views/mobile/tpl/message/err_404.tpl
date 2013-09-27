[{capture append="oxidBlock_content"}]
    <h1 class="page-head">[{ oxmultilang ident="ERROR" }]</h1>
    <div class="content">
        <div class="alert alert-error">
            [{if $sUrl}]
                [{assign var="sModifiedUrl" value=$sUrl|escape }]
                [{assign var="sModifiedUrl" value="<i><strong>'"|cat:$sModifiedUrl|cat:"'</strong></i>"}]
                [{ oxmultilang ident="ERROR_404" }][{ $sModifiedUrl }]
            [{else}]
                [{ oxmultilang ident="ERROR_404"}]
            [{/if}]
        </div>
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]