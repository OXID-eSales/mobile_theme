[{capture append="oxidBlock_pageBody"}]
    <div id="page">
        <div class="container">
            [{foreach from=$oxidBlock_content item="_block"}][{$_block}][{/foreach}]
        </div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]