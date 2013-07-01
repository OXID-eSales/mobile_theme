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
1. copy files from "module/source" to your shop directory.
2. activate the module.
3. the "theme switch" module allows you to switch to any theme you want, so if there is need to use different theme, in module settings, enter the name of the theme that shall be used with mobile devices (this theme must be installed before).
4. if you are using varnish cache (EE only), please merge the file "device.vcl" with your existing varnish configuration file. If you"re not running an EE you can ditch this file.