[{if $blOrderRemark}]
    [{oxscript include="js/widgets/oxinnerlabel.js" priority=10 }]
    [{oxscript add="$( '#orderRemark' ).oxInnerLabel();"}]
    <li>
        <label>[{ oxmultilang ident="FORM_FIELDSET_USER_YOURMESSAGE" }]</label>
        <textarea cols="60" id="orderRemark" placeholder="[{ oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE" }]" rows="7" name="order_remark" class="areabox" >[{$oView->getOrderRemark()}]</textarea>
    </li>
[{/if}]