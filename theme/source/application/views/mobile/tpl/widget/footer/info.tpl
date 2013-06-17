[{block name="footer_information"}]
    <ul id="footerInformation" class="footer-nav nav nav-list">
        [{oxifcontent ident="oximpressum" object="_cont"}]
            <li><a href="[{ $_cont->getLink() }]">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
            <li><a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxagb" object="_cont"}]
        <li><a href="[{ $_cont->getLink() }]" rel="nofollow">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
        [{/oxifcontent}]
    </ul>
[{/block}]
