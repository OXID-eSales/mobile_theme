[{$smarty.block.parent}]
[{ assign var='oUserAgent' value=$oViewConf->getUserAgent() }]
[{if $oUserAgent->getDeviceType() == 'mobile' }]
[{oxstyle include=$oViewConf->getModuleUrl('oethemeswitcher','out/azure/src/css/oethemeswitcher.css')}]
<div id="incBackLink">
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"themeType=mobile"}]">[{ oxmultilang ident="OETHEMESWITCHER_MOBILE_DISPLAY" }]</a>
</div>
[{/if}]