[{oxscript include="js/widgets/oxshowhide.js"}]
[{oxscript add="$('.product-description-container').oxShowHide();"}]

<div class="product-details">
    [{include file="page/details/inc/productmain.tpl"}]
</div>
<div class="product-description-container" class="row">
    <div class="span12">
        [{* Full description *}]
        [{block name="details_longdescription"}]
            [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
            [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
            [{assign var="oLongDescTrunc" value=$oLongdesc}]
            [{assign var="oChevronDown" value="<i class=\"glyphicon-chevron-down\"></i>"}]
            [{assign var="oChevronUp" value="<i class=\"glyphicon-chevron-up\"></i>"}]
            [{if $oLongdesc->value}]
                <div class="product-description-truncated">
                    [{oxeval var=$oLongDescTrunc|html_substr:100}]
                    [{$oChevronDown}]
                </div>
                <div class="product-description-full hidden">
                    [{oxeval var=$oLongDescTrunc}]
                    [{$oChevronUp}]
                </div>
            [{/if}]
            [{/oxhasrights}]
        [{/block}]
    </div>
</div>
<div class="product-attributes row">
    <div class="span12">
        [{* Attributes *}]
        [{block name="details_attributes"}]
            [{if $oView->getAttributes()}]
                <a class="product-attributes-switch" data-toggle="collapse" data-parent="#details_attributes" href="#attributes">
                    [{oxmultilang ident="SPECIFICATION"}]
                    [{$oChevronDown}]
                </a>
                <div id="attributes" class="collapse">
                    [{include file="page/details/inc/attributes.tpl"}]
                </div>
            [{/if}]
        [{/block}]
    </div>
</div>
<div id="product-related-products" class="row">
    <div class="span12 well hidden">
        <span>Related products</span>
        [{include file="page/details/inc/related_products.tpl"}]
    </div>
</div>
