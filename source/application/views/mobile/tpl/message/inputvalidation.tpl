[{foreach from=$aErrors item=oError }]
    <span class="js-oxError_postError alert alert-error">[{oxmultilang ident=$oError->getMessage()}]</span>
[{/foreach}]