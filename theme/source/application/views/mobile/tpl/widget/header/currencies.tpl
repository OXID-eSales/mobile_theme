[{if $oView->loadCurrency()}]
    [{capture name="currencyList"}]
        [{foreach from=$oxcmp_cur item=_cur}]
            [{if $_cur->selected}]
                [{assign var="selectedCurrency" value=$_cur->name}]
                [{capture name="currencySelected"}]
                    <a data-toggle="dropdown" href="#" title="[{ $_cur->name }]">
                        <span>[{ $_cur->name }]</span>
                    </a>
                [{/capture}]
            [{/if}]
            <li>
                <a[{if $_cur->selected}] class="selected"[{/if}] href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{ $_cur->name }]" rel="nofollow">
                <span>[{ $_cur->name }]</span>
                </a>
            </li>
        [{/foreach}]
    [{/capture}]

    [{$smarty.capture.currencySelected}]
    <ul id="currencies" class="dropdown-menu">
        <li class="active">[{$smarty.capture.currencySelected}]</li>
        [{$smarty.capture.currencyList}]
    </ul>
[{/if}]
[{oxscript widget=$oView->getClassName()}]