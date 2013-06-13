[{oxscript include="js/libs/cookie/jquery.cookie.js"}]

[{oxscript include="js/widgets/oxwishlistcontrol.js"}]
[{oxscript add="$('.wishlist-star').oxWishlistControl();"}]


[{* Alert placeholder *}]
<div class="row wishlist-alert hidden">
    <div class="alert alert-info fade in">
        <a class="close" href="#">&times;</a>
        <span></span>
    </div>
    <div class="hidden alert-messages">
        <div class="done">[{oxmultilang ident="SUCCESS"}]</div>
        <div class="please_login">[{oxmultilang ident="LOGIN_TO_ACCESS_WISH_LIST"}]</div>
        <div class="adding_to_wishlist">[{oxmultilang ident="ADDING_TO_WISHLIST"}]</div>
    </div>
</div>

[{* Title/Brand/ShortDesc *}]
[{ assign var="oManufacturer" value=$oView->getManufacturer()}]
<div class="product-header">
    <div class="product-header-info">
        [{block name="details_productmain_title"}]
            <div class="product-title">[{$oDetailsProduct->oxarticles__oxtitle->value}] [{$oDetailsProduct->oxarticles__oxvarselect->value}]</div>
        [{/block}]
        [{block name="details_productmain_manufacturersicon"}]
            [{if $oManufacturer->oxmanufacturers__oxtitle->value}]
                <div class="product-manufacturer-title">[{ $oManufacturer->oxmanufacturers__oxtitle->value}]</div>
            [{/if}]
        [{/block}]
        [{block name="details_productmain_shortdesc"}]
            [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
            [{if $oDetailsProduct->oxarticles__oxshortdesc->value}]
                <div class="product-description-short">[{$oDetailsProduct->oxarticles__oxshortdesc->value}]</div>
            [{/if}]
            [{/oxhasrights}]
        [{/block}]
    </div>
[{* Add to wishlist *}]
    <div class="wishlist-star" data-anid=[{"`$oDetailsProduct->oxarticles__oxnid->value`"}]>
        [{* Add to wishlist action link *}]
        [{if $oxcmp_user }]
            <a class="btn wishlist-control wishlist-adder" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow"><i class="glyphicon-star" data-title="[{ oxmultilang ident='ADD_TO_WISH_LIST' }]"></i></a>
        [{else}]
            <a class="btn wishlist-control wishlist-login" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow"><i class="glyphicon-star" data-title="[{ oxmultilang ident='LOGIN_TO_ACCESS_WISH_LIST' }]"></i></a>
        [{/if}]
    </div>
</div>
