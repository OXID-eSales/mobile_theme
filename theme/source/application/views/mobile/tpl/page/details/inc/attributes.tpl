<div class="product-attributes-content">
    [{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
        <dl>
            <dt id="attrTitle_[{$smarty.foreach.attribute.iteration}]"><strong>[{$oAttr->title}]</strong></dt>
            <dd id="attrValue_[{$smarty.foreach.attribute.iteration}]">[{$oAttr->value}]</dd>
        </dl>
    [{/foreach}]
</div>