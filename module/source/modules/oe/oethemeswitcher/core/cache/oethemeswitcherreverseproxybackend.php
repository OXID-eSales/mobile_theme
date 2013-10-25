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
 * Class oeThemeSwitcherReverseProxyBackend defines activation events
 */
class oeThemeSwitcherReverseProxyBackend extends oeThemeSwitcherReverseProxyBackend_parent
{
    /**
     * Return hashed environment key. If no parameters are in key,
     * null will be returned.
     *
     * @return string
     */
    protected function _getEnvironmentKey()
    {
        $oManager = oxNew( 'oeThemeSwitcherThemeManager' );
        $oUserAgent = $oManager->getUserAgent();

        $this->_addParamToEnvironmentKey( $oManager->getThemeType(), "#oethemeswitcher_1#" );
        $this->_addParamToEnvironmentKey( $oUserAgent->getDeviceType(), "#oethemeswitcher_2#" );

        return parent::_getEnvironmentKey();
    }
}
