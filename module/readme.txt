==Title==
OXID eShop theme switch

==Author==
OXID eSales AG

==Prefix==
oe

==Version==
1.0.0

==Link==
http://www.oxid-esales.com

==Mail==
info@oxid-esales.com

==Description==
OXID eShop theme switch is a module which switches between two eShop themes, depending on client user agent.

==Extend==
*oxConfig
--getConfigParam
*oxTheme
--getInfo
*oxViewConfig
*oxLang
--_getLangFilesPathArray
--_getLangFileCacheName
--_getLanguageMap
*ManufacturerList
*aList
--getViewId
*Content
--getViewId
*Details
--getViewId
*Review
--getViewId
*Rss
*Start
*Tag
*VendorList

==Installation==
1. copy files from 'module/source' dir to shop directory
2. activate module
3. in module settings write themes name which to use for mobile devices(theme must be installed before)
4. if you are using varnish cache, you need to merge 'device.vcl' file with your current varnish configuration file