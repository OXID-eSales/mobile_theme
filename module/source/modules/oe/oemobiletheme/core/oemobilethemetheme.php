<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   core
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: $
 */

/**
 * Class handling shop themes
 *
 */
class oeMobileThemeTheme extends oeMobileThemeTheme_parent
{
    /**
     * get theme info item
     *
     * @param string $sName name of info item to retrieve
     *
     * @return mixed
     */
    public function getInfo($sName)
    {
        if ( $sName == 'active' && $this->getId() == $this->getConfig()->getConfigParam('sMobileTheme') ) {
            return true;
        }
        if (!isset($this->_aTheme[$sName])) {
            return null;
        }
        return $this->_aTheme[$sName];
    }

}

