[{$smarty.block.parent}]
[{ assign var='oUserAgent' value=$oViewConf->oeThemeSwitcherGetUserAgent() }]
[{if $oUserAgent->getDeviceType() == 'mobile' }]
[{oxstyle include=$oViewConf->getModuleUrl('oethemeswitcher','out/azure/src/css/oethemeswitcher.css')}]
<div id="incBackLink">
    <form action="[{oxgetseourl ident=$oViewConf->getSelfLink()}]" method="post">
        <input type="hidden" name="themeType" value="mobile" />
        <button class="btn">[{oxmultilang ident="OETHEMESWITCHER_MOBILE_DISPLAY"}]</button>
    </form>
</div>
[{/if}]