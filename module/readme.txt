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
1. Copy the files from "module/source" to your shop directory.
2. Activate the module.
3. The "theme switch" module allows you to switch to any theme you want. To use a different theme then the default, enter the name of the theme that should be used with mobile devices in the module settings. This theme must be installed before configured in the theme switcher settings.
4. If you are using the varnish cache (EE only), please merge the file "device.vcl" with your existing varnish configuration file. If you're not running an EE you can ditch this file.