[{oxscript include="js/widgets/oxshowhide.js"}]
[{oxscript add="$('.product-description-container').oxShowHide();"}]
[{oxscript add="$('.product-attributes').oxShowHide({content:'.product-attributes-content',moreBtn:'.product-attributes > i', maxHeight: 0});"}]

<div class="product-details">
    [{include file="page/details/inc/productmain.tpl"}]
</div>
<div class="product-description-container">
    [{* Full description *}]
    [{block name="details_longdescription"}]
        [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
        [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
        [{if $oLongdesc->value}]
            <div class="product-description">
                [{oxeval var=$oLongdesc}]
            </div>
            <i class="glyphicon-chevron-down" data-toggle-up="glyphicon-chevron-up" data-toggle-down="glyphicon-chevron-down"></i>
        [{/if}]
        [{/oxhasrights}]
    [{/block}]
</div>
<div class="product-attributes">
    [{* Attributes *}]
    [{block name="details_attributes"}]
        [{if $oView->getAttributes()}]
            <span class="product-attributes-switch">
                [{oxmultilang ident="SPECIFICATION"}]
            </span>
            <div id="attributes">
                [{include file="page/details/inc/attributes.tpl"}]
            </div>
            <i class="glyphicon-chevron-down" data-toggle-up="glyphicon-chevron-up" data-toggle-down="glyphicon-chevron-down"></i>
        [{/if}]
    [{/block}]
</div>
