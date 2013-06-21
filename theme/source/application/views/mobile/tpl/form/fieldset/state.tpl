[{if $selectedStateIdPrim}]
  [{assign var=selectedStateId value=$selectedStateIdPrim}]
[{/if}]

[{assign var=stateDropDown value=oxSelect_$countryDropDown}]
[{assign var=stateSelected value=oxStateSelected_$countryDropDown}]

[{if $currCountry }]
  [{assign var=showDiv value='true'}]
[{else}]
  [{assign var=showDiv value='false'}]
[{/if}]
[{oxscript include="js/widgets/oxcountrystateselect.js" priority=10 }]
[{oxscript add="$( '#`$stateDropDown`' ).oxCountryStateSelect({selectedStateId:'`$selectedStateId`', stateSelectedEl:'`$stateSelected`',countryDropDownEl:'`$countryDropDown`',countrySelectedEl:'`$countrySelected`'});"}]

<script type="text/javascript"><!--
    var allStates = new Array();
    var allStateIds = new Array();
    var allCountryIds = new Object();
    var cCount = 0;
    [{foreach from=$oViewConf->getCountryList() item=country key=country_id }]

        var states = new Array();
        var ids = new Array();
        var i = 0;

        [{assign var=countryStates value=$country->getStates()}]
        [{foreach from=$countryStates item=state key=state_id}]
            states[i] = '[{$state->oxstates__oxtitle->value}]';
            ids[i] = '[{$state->oxstates__oxid->value}]';
            i++;
        [{/foreach}]
        allStates[++cCount] = states;
        allStateIds[cCount]  = ids;
        allCountryIds['[{$country->getId()}]']  = cCount;
    [{/foreach}]

--></script>
<div id="[{$stateDropDown}]" class="dropdown">
    <input type="hidden" id="[{$stateSelected}]" name="[{$stateSelectName}]" value="[{$selectedStateId}]" />
    <div class="dropdown-toggle" data-toggle="dropdown" data-target="#">
        <a id="dLabel_[{$stateDropDown}]" role="button" href="#">
            <span id="stateSelected">[{oxmultilang ident="PLEASE_SELECT_STATE"}]</span>
            <i class="glyphicon-chevron-down"></i>
        </a>
    </div>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel_[{$stateDropDown}]">
    </ul>
</div>
[{oxscript add="$('#'+'$stateDropDown'+'.dropdown').oxDropDown();"}]