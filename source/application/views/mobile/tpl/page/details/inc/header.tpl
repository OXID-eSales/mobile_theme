[{oxscript include="js/libs/cookie/jquery.cookie.js"}]

[{oxscript include="js/widgets/oxwishlistcontrol.js"}]
[{oxscript add="$('.wishlistStar').oxWishlistControl();"}]


[{* Alert placeholder *}]
<div class="row wishlistAlert hidden">
    <div class="alert alert-info fade in">
        <a class="close" href="#">&times;</a>
        <span></span>
    </div>
</div>

[{* Title/Brand/ShortDesc *}]
[{ assign var="oManufacturer" value=$oView->getManufacturer()}]
<div id="detailsHeader">
    <div class="headerShortInfo">
        [{block name="details_productmain_title"}]
            <div class="productTitle">[{$oDetailsProduct->oxarticles__oxtitle->value}] [{$oDetailsProduct->oxarticles__oxvarselect->value}]</div>
        [{/block}]
        [{block name="details_productmain_manufacturersicon"}]
            [{if $oManufacturer->oxmanufacturers__oxtitle->value}]
                <div class="manufacturerTitle">[{ $oManufacturer->oxmanufacturers__oxtitle->value}]</div>
            [{/if}]
        [{/block}]
        [{block name="details_productmain_shortdesc"}]
            [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
            [{if $oDetailsProduct->oxarticles__oxshortdesc->value}]
                <div class="productShortDescription">[{$oDetailsProduct->oxarticles__oxshortdesc->value}]</div>
            [{/if}]
            [{/oxhasrights}]
        [{/block}]
    </div>
[{* Add to wishlist *}]
    <div class="wishlistStar" data-anid=[{"`$oDetailsProduct->oxarticles__oxnid->value`"}]>
        [{* Add to wishlist action link *}]
        [{if $oxcmp_user }]
            <a class="btn wishlistControl wishlistAdder" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow"><i class="glyphicon-star" data-title="[{ oxmultilang ident='ADD_TO_WISH_LIST' }]"></i></a>
        [{else}]
            <a class="btn wishlistControl wishlistLogin" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow"><i class="glyphicon-star" data-title="[{ oxmultilang ident='LOGIN_TO_ACCESS_WISH_LIST' }]"></i></a>
        [{/if}]
    </div>
</div>
