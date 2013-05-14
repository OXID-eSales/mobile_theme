[{$smarty.block.parent}]

[{if $oViewConf->getActiveDeviceType() == 'mobile' }]
<div id="incBackLink">
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"themeType=mobile"}]">[{ oxmultilang ident="MOBILE_DISPLAY" }]</a>
</div>
[{/if}]