[{block name="footer_main"}]
    <div id="footer">
        <div class="container">
            <div id="panel">

                <ul class="nav nav-pills nav-justified footer-nav">
                    [{if $oxcmp_user->oxuser__oxpassword->value}]
                        <li><a href="[{ $oViewConf->getLogoutLink() }]">[{ oxmultilang ident="LOGOUT" }]</a></li>
                    [{else}]
                        <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">[{ oxmultilang ident="LOGIN" }]</a></li>
                    [{/if}]
                    <li [{if $oView->getClassName() == "account"}]class="active"[{/if}]><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">[{ oxmultilang ident="MY_ACCOUNT" }]</a></li>
                    <li><a href="[{ $oViewConf->getHomeLink() }]">[{ oxmultilang ident="HOME" }]</a></li>
                </ul>

                <ul class="nav nav-list footer-nav">
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"themeType=desktop"}]">[{oxmultilang ident="STANDARD_WEBSITE"}]</a></li>
                </ul>

                [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]

                [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}]

            </div>
            [{*<div id="copyright">
                <img src="[{$oViewConf->getImageUrl('logo_small.png')}]" alt="[{oxmultilang ident="OXID_ESALES_URL_TITLE"}]">
            </div>*}]
        </div>
    </div>
[{/block}]
