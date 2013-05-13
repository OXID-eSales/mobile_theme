[{cycle values="listitem,listitem2" assign="zebra"}]
[{ if $listitem->getInfo('id') == $oxid }]
[{assign var="zebra" value=listitem4 }]
[{ /if}]
<td valign="top" class="[{$zebra}][{ if $listitem->isActive()}] active[{/if}]" height="15">
    <div class="listitemfloating">
        <a href="Javascript:top.oxid.admin.editThis('[{ $listitem->getInfo('id') }]');">&nbsp;</a></div></td>
</div>
</td>
<td valign="top" class="[{$zebra}]" height="15">
    <div class="listitemfloating">
        <a href="Javascript:top.oxid.admin.editThis('[{ $listitem->getInfo('id') }]');">[{ $listitem->getInfo('title') }]</a>
    </div>
</td>