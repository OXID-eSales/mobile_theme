[{if $attributes}]
    [{oxscript include="js/widgets/oxdropdown.js" priority=10}]
    <div class="headerContent">
        <div class="form" id="filterBoxClosed">
            <input class="btn" type="button" value="[{oxmultilang ident="FILTER_LIST"}]">
        </div>
        <div id="filterBoxOpened">
            <div class="filterHeader">
                <span class="filterClose"><i class="glyphicon-remove"></i></span>
                <span class="filterOpenTitle">[{oxmultilang ident="FILTER_LIST"}]</span>
            </div>
            <div class="filterData">
                <form method="post" action="[{ $oViewConf->getSelfActionLink() }]" name="_filterlist" id="filterList">
                    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                    <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
                    <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
                    <input type="hidden" name="fnc" value="executefilter">
                    <input type="hidden" name="fname" value="">
                    <input type="hidden" name="showFilter" value="false">
                    [{assign var="blFilterOpen" value=false}]
                    [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                        <label class="filterTitle">[{$oFilterAttr->getTitle()}]:</label>
                        <div class="dropdown">
                            <input type="hidden" name="attrfilter[[{$sAttrID}]]" value="[{$oFilterAttr->getActiveValue()}]">
                            <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                                <span>
                                    [{if $oFilterAttr->getActiveValue()}]
                                        [{$oFilterAttr->getActiveValue()}]
                                        [{assign var="blFilterOpen" value=true}]
                                    [{else}]
                                        [{oxmultilang ident="WIDGET_PRODUCT_ATTRIBUTES_PLEASECHOOSE"}]
                                    [{/if}]
                                </span>
                                <i class="glyphicon-chevron-down"></i>
                            </div>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                [{if $oFilterAttr->getActiveValue() }]
                                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="">[{oxmultilang ident="WIDGET_PRODUCT_ATTRIBUTES_PLEASECHOOSE" }]</a></li>
                                [{/if}]
                                [{foreach from=$oFilterAttr->getValues() item=sValue}]
                                    <li class="dropDownOption"><a tabindex="-1" data-selection-id="[{$sValue}]" [{if $oFilterAttr->getActiveValue() == $sValue }]class="selected"[{/if}] >[{$sValue}]</a></li>
                                [{/foreach}]
                            </ul>
                        </div>
                    [{/foreach}]
                </form>
            </div>
        </div>
    </div>
    [{if !$blFilterOpen}]
        [{assign var="blFilterOpen" value=$oView->getShowFilter()}]
    [{/if}]
    [{oxscript add="$('div.dropdown').oxDropDown();"}]
    [{oxscript include="js/widgets/oxattribute.js" priority=10 }]
    [{oxscript add="$('.headerContent').oxAttribute({blShowFilter:'$blFilterOpen'});"}]
[{/if}]