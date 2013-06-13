<div class="radio">
    <input id="mr_[{$name}]" name="[{$name}]"[{if $value|lower  == "mr"  or $value2|lower == "mr" }] CHECKED[{/if}] type="radio" value="MR" checked/>
    <label class="glyphicon-ok" for="mr_[{$name}]"></label>
</div>
<label for="mr_[{$name}]">[{ oxmultilang ident="MR"  }]</label>
<div class="radio">
    <input id="mrs_[{$name}]" name="[{$name}]"[{if $value|lower  == "mrs"  or $value2|lower == "mrs" }] CHECKED[{/if}] type="radio" value="MRS"/>
    <label class="glyphicon-ok" for="mrs_[{$name}]"></label>
</div>
<label for="mrs_[{$name}]">[{ oxmultilang ident="MRS" }]</label>
