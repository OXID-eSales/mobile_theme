[{block name="checkout_user_options"}]
    <div class="checkout-options">
        [{block name="checkout_options_login"}]
            <div id="optionLogin" class="checkout-option">
                [{ include file="form/login.tpl"}]
            </div>
        [{/block}]

        [{block name="checkout_options_reg"}]
            <div id="optionRegistration" class="checkout-option">
                <form class="form" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                    <div>
                        [{ $oViewConf->getHiddenSid() }]
                        [{ $oViewConf->getNavFormParams() }]
                        <input type="hidden" name="cl" value="user" />
                        <input type="hidden" name="fnc" value="" />
                        <input type="hidden" name="option" value="3" />
                    </div>
                    <input type="submit" class="btn" value="[{ oxmultilang ident="OPEN_ACCOUNT" }]" />
                </form>
            </div>
        [{/block}]

        [{block name="checkout_options_noreg"}]
            [{if $oView->getShowNoRegOption() }]
                <div id="optionNoRegistration" class="checkout-option">
                    <form class="form" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                        <div>
                            [{ $oViewConf->getHiddenSid() }]
                            [{ $oViewConf->getNavFormParams() }]
                            <input type="hidden" name="cl" value="user" />
                            <input type="hidden" name="fnc" value="" />
                            <input type="hidden" name="option" value="1" />
                        </div>
                        <input type="submit" class="btn" value="[{ oxmultilang ident="PURCHASE_WITHOUT_REGISTRATION" }]" />
                        <p class="checkout-option-about">[{ oxmultilang ident="PURCHASE_WITHOUT_REGISTRATION_EXPLANED" }]</p>
                    </form>
                </div>
            [{/if}]
        [{/block}]
    </div>
[{/block}]
