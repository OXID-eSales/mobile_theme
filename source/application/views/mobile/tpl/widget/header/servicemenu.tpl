<div id="settings">
    <button data-parent="#header .container div" data-target="#settings > ul" data-toggle="collapse" class="btn btn-navbar" type="button">
        SETTINGS
    </button>
    <ul class="menu_block nav nav-collapse collapse">
        <li>
            <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]"><span>[{oxmultilang ident="LOGIN"}]</span></a>
        </li>
        <li>
            [{include file="widget/header/servicebox.tpl"}]
        </li>
    </ul>
</div>
[{oxscript widget=$oView->getClassName()}]