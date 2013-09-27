[{if $attributes}]
    [{oxscript include="js/widgets/oxdropdown.js" priority=10}]
    <div id="filterItems" class="filter-box">
        <div class="filter-box-closed" id="filterBoxClosed">
            <input class="btn" type="button" value="[{oxmultilang ident="FILTER_LIST"}]">
        </div>
        <div id="filterBoxOpened" class="filter-box-opened">
            <div class="filter-header">
                <span class="filter-close"><i class="glyphicon-remove"></i></span>
                <span class="filter-open-title">[{oxmultilang ident="FILTER_LIST"}]</span>
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
                        <label class="filter-title">[{$oFilterAttr->getTitle()}]:</label>
                        <div class="dropdown">
                            <input type="hidden" name="attrfilter[[{$sAttrID}]]" value="[{$oFilterAttr->getActiveValue()}]">
                            <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                                <span>
                                    [{if $oFilterAttr->getActiveValue()}]
                                        [{$oFilterAttr->getActiveValue()}]
                                        [{assign var="blFilterOpen" value=true}]
                                    [{else}]
                                        [{oxmultilang ident="PLEASE_CHOOSE"}]
                                    [{/if}]
                                </span>
                                <i class="glyphicon-chevron-down"></i>
                            </div>
                            <ul class="dropdown-menu" role="menu">
                                [{if $oFilterAttr->getActiveValue() }]
                                    <li class="dropdown-option"><a tabindex="-1" data-selection-id="">[{oxmultilang ident="PLEASE_CHOOSE" }]</a></li>
                                [{/if}]
                                [{foreach from=$oFilterAttr->getValues() item=sValue}]
                                    <li class="dropdown-option"><a tabindex="-1" data-selection-id="[{$sValue}]" [{if $oFilterAttr->getActiveValue() == $sValue }]class="selected"[{/if}] >[{$sValue}]</a></li>
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
    [{oxscript add="$('#filterItems').oxAttribute({blShowFilter:'$blFilterOpen'});"}]
    [{oxscript add="$('#sortItems').oxAttribute({blShowFilter:'$blFilterOpen'});"}]
[{/if}]