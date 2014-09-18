[{oxscript include="js/widgets/oxcarouselswipe.js" priority=10}]
[{assign var=oBanners value=$oView->getBanners() }]
[{assign var="currency" value=$oView->getActCurrency()}]
[{if $oBanners|@count}]
    <div class="carousel slide">
        <!-- Carousel items -->
        <div class="carousel-inner">
            [{foreach from=$oBanners item=oBanner name=banner}]
            [{assign var=oArticle value=$oBanner->getBannerArticle() }]
            <div class="item[{if $smarty.foreach.banner.first}] active[{/if}]">
                [{assign var=sBannerLink value=$oBanner->getBannerLink() }]
                [{if $sBannerLink }]
                <a href="[{$sBannerLink}]">
                [{/if}]
                [{assign var=sBannerPictureUrl value=$oBanner->getBannerPictureUrl() }]
                [{if $sBannerPictureUrl }]
                <img src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]">
                [{if $oArticle }]
                    [{assign var="sFrom" value=""}]
                    [{assign var="oPrice" value=$oArticle->getPrice()}]
                    [{if $oArticle->isParentNotBuyable() }]
                        [{assign var="oPrice" value=$oArticle->getVarMinPrice()}]
                        [{if $oArticle->isRangePrice() }]
                            [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                        [{/if}]
                    [{/if}]
                    <div class="carousel-caption">
                        <strong>[{$sFrom}] [{oxprice price=$oPrice  currency=$currency}]</strong>
                        <strong>[{$oArticle->oxarticles__oxtitle->value}]</strong>
                    </div>
                [{/if}]
                [{/if}]
                [{if $sBannerLink }]
                </a>
                [{/if}]
            </div>
            [{/foreach}]
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href=".carousel" data-slide="prev"><i class="glyphicon-chevron-left"></i></a>
        <a class="carousel-control right" href=".carousel" data-slide="next"><i class="glyphicon-chevron-right"></i></a>
    </div>
[{/if}]
