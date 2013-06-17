[{* Documentation: http://www.bootcss.com/p/bootstrap-v3/javascript.html#carousel *}]
[{oxscript include="js/widgets/oxcarouselswipe.js"}]
[{block name="details_productmain_pics"}]
    <div class="carousel slide" id="morePicsContainer">
        <div class="carousel-inner">
            <div class="item active">
                <img src="[{$oView->getActPicture()}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
            </div>
            [{if $oView->morePics()}]
                [{foreach from=$oView->getIcons() key=iPicNr item=oArtIcon name=sMorePics}]
                    <div class="item" id="morePics_[{$smarty.foreach.sMorePics.iteration}]" href="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]">
                        <img src="[{$oPictureProduct->getPictureUrl($iPicNr)}]" alt="" />
                    </div>
                [{/foreach}]
            [{/if}]
        </div>
        [{if $oView->morePics()}]
            <a class="carousel-control left" href=".carousel" data-slide="prev">
                <i class="glyphicon-chevron-left"></i>
            </a>
            <a class="carousel-control right" href=".carousel" data-slide="next">
                <i class="glyphicon-chevron-right"></i>
            </a>
        [{/if}]
    </div>
[{/block}]