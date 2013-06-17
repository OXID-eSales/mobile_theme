[{oxscript include="js/widgets/oxshowhide.js"}]
[{oxscript add="$('.product-description-container').oxShowHide();"}]

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
            <i class="glyphicon-chevron-down" data-toggle="glyphicon-chevron-up"></i>
        [{/if}]
        [{/oxhasrights}]
    [{/block}]
</div>
<div class="product-attributes row">
    [{* Attributes *}]
    [{block name="details_attributes"}]
        [{if $oView->getAttributes()}]
            <a class="product-attributes-switch" data-toggle="collapse" data-parent="#details_attributes" href="#attributes">
                [{oxmultilang ident="SPECIFICATION"}]
                <i class="glyphicon-chevron-down"></i>
            </a>
            <div id="attributes" class="collapse">
                [{include file="page/details/inc/attributes.tpl"}]
            </div>
        [{/if}]
    [{/block}]
</div>
