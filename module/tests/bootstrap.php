<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   tests
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
  * @version   SVN: $Id: $
 */

if (getenv('oxPATH')) {
    define ('oxPATH', getenv('oxPATH'));
    /** DEPLOY_REMOVE_BEGIN **/

    define ('oxCCTempDir', '/tmp/oxCCTempDir/');

    if (!is_dir(oxCCTempDir)) {
        mkdir(oxCCTempDir, 0777, 1);
    }
    /** DEPLOY_REMOVE_END **/
} else {
    /** DEPLOY_REMOVE_BEGIN **/
    $sShopDir = realpath(dirname(__FILE__).'/../source/');
    //include_once $sShopDir.'/_version_define.php';
    define ('oxPATH', $sShopDir.'/');
    define ('oxCCTempDir', $sShopDir.'/tmp/');
    /** DEPLOY_REMOVE_END **/
}

if (!defined('oxPATH')) {
        die('oxPATH is not defined');
}

/** DEPLOY_REMOVE_BEGIN **/
if (file_exists(oxPATH . "/_version_define.php")) {
    include_once oxPATH . "/_version_define.php";
}
/** DEPLOY_REMOVE_END **/


if (!defined('OXID_VERSION_SUFIX')) {
    define('OXID_VERSION_SUFIX', '');
}


require_once 'unit/test_config.inc.php';

define('oxADMIN_LOGIN', oxDb::getDb()->getOne("select OXUSERNAME from oxuser where oxid='oxdefaultadmin'"));
if (getenv('oxADMIN_PASSWD')) {
    define('oxADMIN_PASSWD', getenv('oxADMIN_PASSWD'));
} else {
    define('oxADMIN_PASSWD', 'admin');
}


if ( getenv('CODECOVERAGE') && isset(PHPUnit_Util_Filter::$addUncoveredFilesFromWhitelist) ) {

    // PHPUnit_Util_Filter configuration
    PHPUnit_Util_Filter::$addUncoveredFilesFromWhitelist = true;
    /*
    PHPUnit_Util_Filter::addDirectoryToFilter(oxPATH);
    */

    //PHPUnit_Util_Filter::addDirectoryToWhitelist(oxPATH.'/admin');
    PHPUnit_Util_Filter::addDirectoryToWhitelist(oxPATH.'/core');
    PHPUnit_Util_Filter::addDirectoryToWhitelist(oxPATH.'/application');

    //PHPUnit_Util_Filter::addDirectoryToWhitelist(oxPATH.'/views/');

   //PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/admin/inc/');
    if ( !OXID_VERSION_EE ) :
        PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/phpdtaus/');
        PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/jpgraph/');
        PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/application/controllers/admin/reports/');
    endif;
    if ( !OXID_VERSION_PE_CE ) :
        PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/wysiwigpro/');
    endif;
    //PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/openid/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/adodblite/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/tcpdf/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/phpmailer/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/smarty/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/utils/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/facebook/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/application/views/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/out/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/tmp/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/objects/');
    /** DEPLOY_REMOVE_BEGIN **/
    // repeat filtered files unconditionally in this block for not deployed version
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/phpdtaus/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/wysiwigpro/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/core/jpgraph/');
    PHPUnit_Util_Filter::removeDirectoryFromWhitelist(oxPATH.'/application/controllers/admin/reports/');
    /** DEPLOY_REMOVE_END **/

    PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/admin/index.php');
    PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxerpbase.php');
    PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxerpcsv.php');
    if ( OXID_VERSION_EE ) :
        PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxerpinterface.php');
    endif;
    //PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxopeniddb.php');
    //PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxopenidhttpfetcher.php');
    //PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxopenidgenericconsumer.php');
    /** DEPLOY_REMOVE_BEGIN **/
    // repeat filtered files unconditionally in this block for not deployed version
    PHPUnit_Util_Filter::removeFileFromWhitelist(oxPATH.'/core/oxerpinterface.php');
    /** DEPLOY_REMOVE_END **/



    // add separate files
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/block.oxhasrights.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/emos.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxcontent.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxgetseourl.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxid_include_dynamic.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxinputhelp.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxmultilang.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxscript.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/function.oxvariantselect.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/insert.oxid_cmplogin.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/insert.oxid_cssmanager.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/insert.oxid_newbasketitem.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/insert.oxid_nocache.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/insert.oxid_tracker.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxaddparams.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxaddslashes.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxenclose.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxformdate.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxlower.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxmultilangassign.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxmultilangsal.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxnumberformat.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxtruncate.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxupper.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/modifier.oxwordwrap.php');
    PHPUnit_Util_Filter::addFileToWhitelist(oxPATH.'/core/smarty/plugins/oxemosadapter.php');
}


