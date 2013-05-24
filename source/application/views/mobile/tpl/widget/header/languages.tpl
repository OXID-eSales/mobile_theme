[{if $oView->isLanguageLoaded()}]
    [{capture name="languageList"}]
        [{foreach from=$oxcmp_lang item=_lng}]
            [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
            [{if $_lng->selected}]
                [{capture name="languageSelected"}]
                <a data-toggle="dropdown" class="flag [{$_lng->abbr }]" title="[{$_lng->name}]" href="#" hreflang="[{$_lng->abbr }]">
                    <span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')" >[{$_lng->name}]</span>
                </a>
                [{/capture}]
            [{/if}]
            <li>
                <a class="flag [{$_lng->abbr }] [{if $_lng->selected}]selected[{/if}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]">
                    <span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')">[{$_lng->name}]</span>
                </a>
            </li>
        [{/foreach}]
    [{/capture}]

    [{$smarty.capture.languageSelected}]
    <ul id="languages" class="dropdown-menu" role="menu">
        [{$smarty.capture.languageList}]
    </ul>
[{/if}]
[{oxscript widget=$oView->getClassName()}]