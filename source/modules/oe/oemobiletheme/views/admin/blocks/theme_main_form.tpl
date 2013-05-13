<table cellspacing="10" width="98%">
    <tr>
        <td width="20%" valign="top"><img src="[{ $oViewConf->getBaseDir() }]/out/[{$oTheme->getInfo('id')}]/[{$oTheme->getInfo('thumbnail')}]" hspace="20" vspace="10"></td>
        <td width="50%" valign="top">
            <h1 style="color:#000;font-size:25px;">[{$oTheme->getInfo('title')}]</h1>
            <p>[{$oTheme->getInfo('description')}]</p>
            [{if $oTheme->getInfo('parentTheme')}]
            <strong>[{ oxmultilang ident="THEME_PARENT_THEME_TITLE" }]: </strong>
            [{assign var='_oParent' value=$oTheme->getParent()}]
            [{if $_oParent}]
                <a class="themetitle" href="[{$oViewConf->getSelfLink()}]&amp;cl=theme_main&amp;oxid=[{$oTheme->getInfo('parentTheme')}]&amp;updatelist=1">[{$_oParent->getInfo('title')}]</a>
                [{else}]
                <span class="error">[{$oTheme->getInfo('parentTheme')}]</span>
                [{/if}]
            <br>
            <strong>[{ oxmultilang ident="THEME_PARENT_VERSIONS" }]: </strong> [{', '|implode:$oTheme->getInfo('parentVersions')}]
            [{/if}]
            <hr>
            <p style="color:#aaa;">
                <b>[{ oxmultilang ident="THEME_AUTHOR" }]</b> [{$oTheme->getInfo('author')}]<br><br>
                [{ oxmultilang ident="THEME_VERSION" }] [{$oTheme->getInfo('version')}]
            </p>
        </td>
        [{if !$oTheme->isActive() || $oTheme->getInfo('mobile')}]
        <td width="1%">
            <img src="[{ $oViewConf->getImageUrl() }]/grayline_vert.gif" width="2" height="270" alt="" border="0">
        </td>
        [{/if}]
        <td width="19%" valign="top">
            [{assign var='_sError' value=$oTheme->checkForActivationErrors()}]
            [{if !$_sError}]
            <form name="myedit" id="myedit" action="[{ $oViewConf->getSelfLink() }]" method="post">
                <p>
                    [{ $oViewConf->getHiddenSid() }]
                    <input type="hidden" name="cl" value="theme_main">
                    <input type="hidden" name="updatelist" value="1">
                    <input type="hidden" name="oxid" value="[{$oTheme->getInfo('id')}]">
                    [{if !$oTheme->isActive()}]
                    <input type="hidden" name="fnc" value="setTheme">
                    <input type="submit" value="[{ oxmultilang ident="THEME_ACTIVATE" }]">
                    [{elseif $oTheme->getInfo('mobile')}]
                    <input type="hidden" name="fnc" value="disableTheme">
                    <input type="submit" value="[{ oxmultilang ident="THEME_DEACTIVATE" }]">
                    [{/if}]
                </p>
            </form>
            [{else}]
            <div class="error">[{ oxmultilang ident=$_sError }]</div>
            [{/if}]
        </td>
    </tr>
</table>