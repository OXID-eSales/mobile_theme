[{if 'EE' == $oViewConf->oeThemeSwitcherGetEdition()}]
[{capture append="oxidBlock_content"}]
    <h4 class="page-head">[{ oxmultilang ident="ERROR" }]</h4>
    <div class="content">
        <div class="alert alert-error">[{ oxmultilang ident="ERROR_MESSAGE_ACCESS_DENIED" }] </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
[{/if}]
