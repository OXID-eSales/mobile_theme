<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   lang
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: lang.php 28697 2010-06-29 11:09:58Z vilma $
 */


/* -----------------------
--  ADAPTING THIS FILE  --
--------------------------
If you want to adapt this language file, use cust_lang.php instead.
Further information is available in the manual at
http://www.oxid-esales.com/en/resources/help-faq/eshop-manual/editing-language-files
*/

$sLangName  = "Deutsch";

// -------------------------------
// RESOURCE IDENTIFIER = STRING
// -------------------------------
$aLang = array(

    'charset'                                                     => "ISO-8859-15",
    'FILTER_LIST'                                                 => "Filtern & sortieren",
    'STANDARD_WEBSITE'                                            => "Zur Standard-Website wechseln",
    'STEPS_BASKET'                                                => "Warenkorb", //use CART
    'STEPS_ORDER'                                                 => "Überprüfen", // CHECK key ? Siehe
    'STEPS_PAY'                                                   => "Zahlung & Versand",
    'STEPS_SEND'                                                  => "Adressen",  // use ADDRESSES
    'STREET'                                                      => "Straße",   // split STREET STREET_NO, use them
    'HOUSE_NO'                                                    => "Hausnummer",
    'BACK'                                                        => "Zurück", // move to generic
    'ERROR_MESSAGE_ACCESS_DENIED'                                 => "Zugang verweigert",
    'ERROR_MESSAGE_PERMISSION_DENIED'                              => "Der Zugang wurde Ihnen verweigert",
    'USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS'                      => "An Rechnungsanschrift schicken",
    'CONTINUE_TO_NEXT_STEP'                                       => "Weiter", // make CONTINUE key, translate to Weiter
    'OK'                                                          => "OK" // move to generic
);
