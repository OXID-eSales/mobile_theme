<div class="agb">
    [{if $oView->isActive('PsLogin') || !$oView->isConfirmAGBActive()}]
        <input type="hidden" name="ord_agb" value="1">
    [{else}]
        <input type="hidden" name="ord_agb" value="0">
    [{/if}]
    <input type="hidden" name="oxdownloadableproductsagreement" value="0">
    <input type="hidden" name="oxserviceproductsagreement" value="0">

    [{if !$hideButtons}]

        [{if !$oView->isActive('PsLogin')}]
            [{if $oView->isConfirmAGBActive()}]
                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                    <h3 class="heading section-heading">
                        <span>[{$oContent->oxcontents__oxtitle->value}]</span>
                    </h3>
                    <div class="checkbox">
                        <input id="checkAgbTop" type="checkbox" name="ord_agb" value="1">
                        <label class="glyphicon-ok" for="checkAgbTop"></label>
                    </div>
                    <label for="checkAgbTop" class="checkout-agb-label">
                        [{$oContent->oxcontents__oxcontent->value}]
                    </label>
                    <div class="clearfix"></div>
                [{/oxifcontent}]
            [{else}]
                [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                    <h3 class="heading section-heading">
                        <span>[{$oContent->oxcontents__oxtitle->value}]</span>
                    </h3>
                    <p class="checkout-agb-label">
                        [{$oContent->oxcontents__oxcontent->value}]
                    </p>
                    <div class="clearfix"></div>
                [{/oxifcontent}]
            [{/if}]
        [{/if}]

        [{if $oViewConf->isFunctionalityEnabled('blEnableIntangibleProdAgreement') }]
            [{assign var="oExplanationMarks" value=$oView->getBasketContentMarkGenerator() }]
            [{if $oxcmp_basket->hasArticlesWithDownloadableAgreement() }]
                [{oxifcontent ident="oxdownloadableproductsagreement" object="oContent"}]
                    <div id="noteForDownloadableArticles" class="checkbox">
                        <input id="oxdownloadableproductsagreement" type="checkbox" name="oxdownloadableproductsagreement" value="1">
                        <label class="glyphicon-ok" for="oxdownloadableproductsagreement"></label>
                    </div>
                    <label for="oxdownloadableproductsagreement" class="checkout-agb-label">
                        [{$oExplanationMarks->getMark('downloadable')}] [{$oContent->oxcontents__oxcontent->value}]
                    </label>
                    <div class="clearfix"></div>
                [{/oxifcontent}]
            [{/if}]
            [{if $oxcmp_basket->hasArticlesWithIntangibleAgreement() }]
                [{oxifcontent ident="oxserviceproductsagreement" object="oContent"}]
                    <div id="noteForIntangibleArticles" class="checkbox">
                        <input id="oxserviceproductsagreement" type="checkbox" name="oxdownloadableproductsagreement" value="1">
                        <label class="glyphicon-ok" for="oxserviceproductsagreement"></label>
                    </div>
                    <label for="oxserviceproductsagreement" class="checkout-agb-label">
                        [{$oExplanationMarks->getMark('intangible')}] [{$oContent->oxcontents__oxcontent->value}]
                    </label>
                    <div class="clearfix"></div>
                [{/oxifcontent}]
            [{/if}]
        [{/if}]
    [{/if}]
</div>


[{oxscript add="$('#checkAgbTop').click(function(){ $('input[name=ord_agb]').val(parseInt($('input[name=ord_agb]').val())^1);});"}]
[{oxscript add="$('#oxdownloadableproductsagreement').click(function(){ $('input[name=oxdownloadableproductsagreement]').val(parseInt($('input[name=oxdownloadableproductsagreement]').val())^1);});"}]
[{oxscript add="$('#oxserviceproductsagreement').click(function(){ $('input[name=oxserviceproductsagreement]').val(parseInt($('input[name=oxserviceproductsagreement]').val())^1);});"}]