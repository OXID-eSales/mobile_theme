[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]
    <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">

    [{assign var="_sMetaTitlePrefix" value=$oView->getTitlePrefix() }]
    [{assign var="_sMetaTitleSuffix" value=$oView->getTitleSuffix() }]
    [{assign var="_sMetaTitlePageSuffix" value=$oView->getTitlePageSuffix() }]
    [{assign var="_sMetaTitle" value=$oView->getTitle() }]
    [{if !$_sMetaTitle }]
        [{assign var="_sMetaTitle" value=$template_title }]
    [{/if}]

    <title>[{ $_sMetaTitlePrefix }][{if $_sMetaTitlePrefix && $_sMetaTitle }] | [{/if}][{$_sMetaTitle|strip_tags}][{if $_sMetaTitleSuffix && ($_sMetaTitlePrefix || $_sMetaTitle) }] | [{/if}][{$_sMetaTitleSuffix}] [{if $_sMetaTitlePageSuffix }] | [{ $_sMetaTitlePageSuffix }] [{/if}]</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    <meta name="apple-mobile-web-app-capable" content="yes">

    [{if $oView->noIndex() == 1 }]
        <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
    [{elseif $oView->noIndex() == 2 }]
        <meta name="ROBOTS" content="NOINDEX, FOLLOW">
    [{/if}]
    [{if $oView->getMetaDescription()}]
        <meta name="description" content="[{$oView->getMetaDescription()}]">
    [{/if}]
    [{if $oView->getMetaKeywords()}]
        <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
    [{/if}]

    [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
    [{if $canonical_url }]
        <link rel="canonical" href="[{ $canonical_url }]">
    [{/if}]
    <link rel="shortcut icon" href="[{ $oViewConf->getImageUrl('favicon.ico') }]">

    [{block name="base_style"}]
        [{oxstyle include="http://fonts.googleapis.com/css?family=Montserrat:400,700"}]
        [{oxstyle include="css/oxid.css"}]
    [{/block}]

    [{assign var='rsslinks' value=$oView->getRssLinks() }]
    [{if $rsslinks}]
        [{foreach from=$rsslinks item='rssentry'}]
            <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
        [{/foreach}]
    [{/if}]

    [{block name="head_css"}]
        [{foreach from=$oxidBlock_head item="_block"}]
            [{$_block}]
        [{/foreach}]
    [{/block}]

[{/capture}]
<!DOCTYPE HTML>
[{assign var="sLanguage" value=$oView->getActiveLangAbbr()}]
<html [{if $sLanguage}]lang="[{$sLanguage}]"[{/if}]>
<head>
    [{foreach from=$oxidBlock_pageHead item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{oxstyle}]
</head>
<body>
    [{foreach from=$oxidBlock_pageBody item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{foreach from=$oxidBlock_pagePopup item="_block"}]
        [{$_block}]
    [{/foreach}]

    [{block name="base_js"}]
        [{oxscript include="js/libs/jquery.min.js" priority=1}]
        [{oxscript include="js/libs/jquery.mobile.custom.min.js" priority=1}]
        [{oxscript include="js/libs/bootstrap.js" priority=1}]
    [{/block}]

    <!--[if lt IE 9]>
    <script type="text/javascript" src="[{ $oViewConf->getResourceUrl('js/libs/respond.min.js') }]"></script>
    <![endif]-->

    [{ oxscript }]
    [{ oxid_include_dynamic file="widget/dynscript.tpl" }]

    [{foreach from=$oxidBlock_pageScript item="_block"}]
        [{$_block}]
    [{/foreach}]

</body>
</html>