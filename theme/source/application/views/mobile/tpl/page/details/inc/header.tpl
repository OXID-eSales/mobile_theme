[{oxscript include="js/libs/cookie/jquery.cookie.js"}]

[{oxscript include="js/widgets/oxwishlistcontrol.js"}]
[{oxscript add="$('.wishlist-btn').oxWishlistControl();"}]


[{* Title/Brand/ShortDesc *}]
[{assign var="oManufacturer" value=$oView->getManufacturer()}]
<div class="product-header">

    [{* Alert placeholder *}]
    <div class="alert alert-info wishlist-alert">
        <a class="close" href="#">&times;</a>
        <span data-messages='{
                "done": "[{oxmultilang ident="SUCCESS"}]",
                "please_login": "[{oxmultilang ident="LOGIN_TO_ACCESS_WISH_LIST"}]",
                "adding_to_wishlist": "[{oxmultilang ident="ADDING_TO_WISHLIST"}]"
                }'>
        </span>
    </div>
    [{* Add to wishlist *}]
    [{if $oxcmp_user }]
        <a class="btn wishlist-btn pull-right" data-action="add" data-anid="[{"`$oDetailsProduct->oxarticles__oxnid->value`"}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]" rel="nofollow">
            <i class="glyphicon-star" data-title="[{oxmultilang ident='ADD_TO_WISH_LIST'}]"></i>
        </a>
    [{else}]
        <a class="btn wishlist-btn pull-right" data-action="login" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]" rel="nofollow">
            <i class="glyphicon-star" data-title="[{oxmultilang ident='LOGIN_TO_ACCESS_WISH_LIST'}]"></i>
        </a>
    [{/if}]
    <div class="product-header-info">
        [{block name="details_productmain_title"}]
            <div class="product-title">[{$oDetailsProduct->oxarticles__oxtitle->value}] [{$oDetailsProduct->oxarticles__oxvarselect->value}]</div>
        [{/block}]
        [{block name="details_productmain_manufacturersicon"}]
            [{if $oManufacturer->oxmanufacturers__oxtitle->value}]
                <div class="product-manufacturer-title">[{$oManufacturer->oxmanufacturers__oxtitle->value}]</div>
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
</div>
