[{capture append="oxidBlock_pageBody"}]
    [{if count($Errors)>0 && count($Errors.default) > 0}]
        <div class="alert-page alert-page-error">
            <div class="alertPageBody">
                [{foreach from=$Errors.default item=oEr key=key }]
                    <p class="exceptionMessage">[{ $oEr->getOxMessage()}]</p>
                    <p class="exceptionStackTrace">[{ $oEr->getStackTrace()|nl2br }]</p>
                [{/foreach}]
            </div>
        </div>
    [{/if}]
[{/capture}]

[{include file="layout/base.tpl"}]