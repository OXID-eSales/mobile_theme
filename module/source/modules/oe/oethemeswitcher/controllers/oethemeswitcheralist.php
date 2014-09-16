<?php
/**
 * This file is part of OXID eSales theme switcher module.
 *
 * OXID eSales theme switcher module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales theme switcher module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales theme switcher module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
 */

/**
 * List of articles for a selected product group.
 * Collects list of articles, according to it generates links for list gallery,
 * meta tags (for search engines). Result - "list.tpl" template.
 * OXID eShop -> (Any selected shop product category).
 */
class oeThemeSwitcherAList extends oeThemeSwitcherAList_parent
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
        if ($this->_blShowFilter == null) {
            $this->_blShowFilter = false;
            if ($this->getConfig()->getRequestParameter('showFilter') == 'true') {
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
        $sViewId .= $this->getConfig()->oeThemeSwitcherGetActiveThemeId();

        return $sViewId;
    }
}
