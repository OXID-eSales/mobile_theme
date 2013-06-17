[{oxscript include="js/widgets/oxdropdown.js" priority=10 }]
[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
[{if $oSelections}]
    <div class="dropdown">
        <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
            <a id="dLabel" role="button" href="#">
                [{if $oActiveSelection}]
                    <span>[{$oActiveSelection->getName()}]</span>
                [{elseif !$blHideDefault}]
                    <span [{if $blInDetails}]class="selectMessage"[{/if}]>[{$oSelectionList->getLabel()}]
                    [{if $sFieldName == "sel" }]
                        [{ oxmultilang ident="WIDGET_PRODUCT_ATTRIBUTES_PLEASECHOOSE" }]
                    [{else}]
                        [{ oxmultilang ident="CHOOSE_VARIANT" }]
                    [{/if}]
                    </span>
                [{/if}]
                <i class="glyphicon-chevron-down"></i>
            </a>
        </div>
        [{if $editable !== false}]
            <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection }][{$oActiveSelection->getValue()}][{/if}]">
            <ul class="dropdown-menu [{$sSelType|default:"vardrop"}]" role="menu" aria-labelledby="dLabel">
                [{if $oActiveSelection && !$blHideDefault}]
                    <li class="dropdown-option"><a tabindex="-1" data-selection-id="" href="#">
                            [{$oSelectionList->getLabel()}] [{if $sFieldName == "sel"}][{oxmultilang ident="PLEASE_CHOOSE"}][{else}][{oxmultilang ident="CHOOSE_VARIANT"}][{/if}]
                    </a></li>
                [{/if}]
                [{foreach from=$oSelections item=oSelection}]
                    <li class="dropdown-option [{if $oSelection->isDisabled()}]js-disabled disabled[{/if}]">
                        <a tabindex="-1" data-selection-id="[{$oSelection->getValue()}]" href="#">[{$oSelection->getName()}]</a>
                    </li>
                [{/foreach}]
            </ul>
        [{/if}]
    </div>
    [{oxscript add="$('div.dropdown').oxDropDown();" }]
[{else}]
    <a href="[{$_productLink}]" class="product-variants-message">
        [{if $sFieldName == "sel" }]
            [{oxmultilang ident="WIDGET_PRODUCT_ATTRIBUTES_PLEASECHOOSE"}]
        [{else}]
            [{oxmultilang ident="CHOOSE_VARIANT"}]
        [{/if}]
    </a>
[{/if}]