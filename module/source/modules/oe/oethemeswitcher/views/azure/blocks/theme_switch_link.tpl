[{$smarty.block.parent}]
[{oxstyle include=$oViewConf->getModuleUrl('oethemeswitcher','out/azure/src/css/oethemeswitcher.css')}]
[{ assign var='oUserAgent' value=$oViewConf->getUserAgent() }]
[{if $oUserAgent->getDeviceType() == 'mobile' }]
<div id="incBackLink">
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"themeType=mobile"}]">[{ oxmultilang ident="OETHEMESWITCHER_MOBILE_DISPLAY" }]</a>
</div>
[{/if}]