[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_INFO_CLEARCOOKIE_TITLE"|oxmultilangassign}]
    <h1 class="page-head">[{ oxmultilang ident="PAGE_INFO_CLEARCOOKIE_TITLE" }]</h1>
    <div class="content">
        <p>
            [{oxifcontent ident="oxcookiesexplanation" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
            [{ insert name="oxid_tracker" title=$template_title }]
        </p>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]