[{capture append="oxidBlock_pageBody"}]
    [{if count($Errors)>0 && count($Errors.default) > 0}]
        <div class="container">
            [{foreach from=$Errors.default item=oEr key=key }]
            <h2>[{ $oEr->getOxMessage()}]</h2>
            <div class="alert alert-error">
                <p class="exceptionStackTrace">[{ $oEr->getStackTrace()|nl2br }]</p>
            </div>
            [{/foreach}]
        </div>
    [{/if}]
[{/capture}]

[{include file="layout/base.tpl"}]