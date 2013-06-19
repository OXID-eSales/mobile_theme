[{if $pages->changePage}]
    <div class="pagination-container">
        <ul class="pagination" id="itemsPager[{$place}]">
            [{if $pages->previousPage }]
                <li>
                    <a class="prev" href="[{$pages->previousPage}]"><i class="glyphicon-chevron-left"></i></a>
                </li>
            [{/if}]
            [{assign var="i" value=1}]
            [{foreach key=iPage from=$pages->changePage item=page}]
                [{if $iPage == $i}]
                   <li><a href="[{$page->url}]" class="pagination-page[{if $iPage == $pages->actPage }] active[{/if}]">[{$iPage}]</a></li>
                   [{assign var="i" value=$i+1}]
                [{elseif $iPage > $i}]
                   <li>
                       <a class="pagination-separator">...</a>
                   </li>
                   <li>
                        <a href="[{$page->url}]" class="pagination-page[{if $iPage == $pages->actPage }] active[{/if}]">[{$iPage}]</a>
                   </li>
                   [{assign var="i" value=$iPage+1}]
                [{elseif $iPage < $i}]
                    <li>
                        <a href="[{$page->url}]" class="pagination-page[{if $iPage == $pages->actPage }] active[{/if}]">[{$iPage}]</a>
                    </li>
                    <li>
                        <a class="pagination-separator">...</a>
                        [{assign var="i" value=$iPage+1}]
                    </li>
                [{/if}]
            [{/foreach}]
            [{if $pages->nextPage }]
                <li>
                    <a class="next" href="[{$pages->nextPage}]"><i class="glyphicon-chevron-right"></i></a>
                </li>
            [{/if}]
         </ul>
    </div>
[{/if}]
