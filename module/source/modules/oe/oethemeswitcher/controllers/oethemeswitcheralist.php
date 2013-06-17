<?php
/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   views
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id$
 */

/**
 * List of articles for a selected product group.
 * Collects list of articles, according to it generates links for list gallery,
 * meta tags (for search engines). Result - "list.tpl" template.
 * OXID eShop -> (Any selected shop product category).
 */
class oeThemeSwitcheraList extends oeThemeSwitcheraList_parent
{
    /**
     * If filter should be displayed
     *
     * @var bool
     */
    protected $_blShowFilter = null;

    /**
     * Check if filter was selected
     *
     * @return bool
     */
    public function getShowFilter()
    {
        if ( $this->_blShowFilter == null ) {
            $this->_blShowFilter = false;
            if ( $this->getConfig()->getRequestParameter( 'showFilter' ) == 'true' ) {
                $this->_blShowFilter = true;
            }
        }
        return $this->_blShowFilter;
    }

    /**
     * Returns view ID (for template engine caching).
     *
     * @return string   $this->_sViewId view id
     */
    public function getViewId()
    {
        $sViewId = parent::getViewId();
        $sViewId .= $this->getConfig()->getActiveThemeId();

        return $sViewId;
    }

}
