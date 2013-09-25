[{if 'CE' == $oViewConf->oeThemeSwitcherGetEdition()}]

[{capture append="oxidBlock_pageBody"}]
    <h4 class="page-head">[{ oxmultilang ident="MESSAGE_ERR_EXPIRED_DAYS_OXIDESHOPERROR" }]</h4>
    <div class="content">
      <div class="alert alert-error">[{ oxmultilang ident="MESSAGE_ERR_EXPIRED_DAYS_VERSIONEXPIRED1" }] <a href="[{ oxmultilang ident="OXID_ESALES_URL" }]" title="[{ oxmultilang ident="OXID_ESALES_URL_TITLE" }]">[{ oxmultilang ident="MESSAGE_ERR_EXPIRED_DAYS_VERSIONEXPIRED2" }]</a> [{ oxmultilang ident="MESSAGE_ERR_EXPIRED_DAYS_VERSIONEXPIRED3" }]</div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]

[{/if}]