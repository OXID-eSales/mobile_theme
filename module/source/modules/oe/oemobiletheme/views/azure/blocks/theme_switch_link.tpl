[{$smarty.block.parent}]
[{oxstyle include=$oViewConf->getModuleUrl('oemobiletheme','out/azure/src/css/oemobiletheme.css')}]
[{if $oViewConf->getActiveDeviceType() == 'mobile' }]
<div id="incBackLink">
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"themeType=mobile"}]">[{ oxmultilang ident="MOBILE_DISPLAY" }]</a>
</div>
[{/if}]