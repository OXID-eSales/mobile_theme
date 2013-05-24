[{oxscript include="js/widgets/oxshowhide.js"}]
[{oxscript add="$('#detailsFullDescription').oxShowHide();"}]

<div id="detailsMain">
    [{include file="page/details/inc/productmain.tpl"}]
</div>
<div id="detailsFullDescription" class="row spacedUpper">
    <div class="span12">
        [{* Full description *}]
        [{block name="details_longdescription"}]
            [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
            [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
            [{assign var="oLongDescTrunc" value=$oLongdesc}]
            [{assign var="oChevronDown" value="<i class=\"glyphicon-chevron-down\"></i>"}]
            [{assign var="oChevronUp" value="<i class=\"glyphicon-chevron-up\"></i>"}]
            [{if $oLongdesc->value}]
                <div class="descriptionTrunc pointer">
                    [{oxeval var=$oLongDescTrunc|html_substr:100}]
                    [{$oChevronDown}]
                </div>
                <div class="descriptionFull pointer hidden">
                    [{oxeval var=$oLongDescTrunc}]
                    [{$oChevronUp}]
                </div>
            [{/if}]
            [{/oxhasrights}]
        [{/block}]
    </div>
</div>
<div id="detailsAttributes" class="row spacedUpper">
    <div class="span12">
        [{* Attributes *}]
        [{block name="details_attributes"}]
            [{if $oView->getAttributes()}]
                <a class="attributeSwitcher" data-toggle="collapse" data-parent="#details_attributes" href="#attributes">
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
<div id="detailsRelatedProducts" class="row">
    <div class="span12 well hidden">
        <span>Related products</span>
        [{include file="page/details/inc/related_products.tpl"}]
    </div>
</div>
