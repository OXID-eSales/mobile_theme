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
 * Class oeThemeSwitcherEvents defines activation events
 */
class oeThemeSwitcherEvents
{
    protected static function _getThemeName()
    {
        $sThemeName = oxRegistry::getConfig()->getConfigParam('sOEThemeSwitcherMobileTheme');
        if ( empty( $sThemeName ) ) {
            $sThemeName = 'mobile';
        }
        return $sThemeName;
    }

    /**
     * Adds theme config value
     */
    protected static function _addThemeConfig( $sShopId, $sThemeName, $sVarName, $sVarType, $sVarValue, $sVarGroup, $sVarConstrains, $iVarPos )
    {
        $sOxId = oxUtilsObject::getInstance()->generateUID();
        $sThemeName = 'theme:' . $sThemeName;

        $sConfigSQL = 'INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`) VALUES ( ?, ?, ?, ?, ?, ' . $sVarValue . ' )';
        oxDb::getDb()->execute( $sConfigSQL, array( $sOxId, $sShopId, $sThemeName, $sVarName, $sVarType) );

        if ( !empty( $sVarGroup ) ) {
            $sConfigDisplaySQL = 'INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`) VALUES ( ?, ?, ?, ?, ?, ? )';
            oxDb::getDb()->execute( $sConfigDisplaySQL, array( $sOxId, $sThemeName, $sVarName, $sVarGroup, $sVarConstrains, $iVarPos ) );
        }
    }

    /**
     * Is called on module activation. Writes out Mobile Theme config settings
     */
    public static function onActivate()
    {
        $iShopId = oxRegistry::getConfig()->getShopId();
        $sThemeName = self::_getThemeName();

        $aThemeConfigs = array(
            array('sVarName' => 'sIconsize', 'sVarType' => 'str', 'sVarValue' => '0x8064a213b1', 'sVarGroup' => 'images', 'sVarConstrains' => '', 'iVarPos' => 1 ),
            array('sVarName' => 'sThumbnailsize', 'sVarType' => 'str', 'sVarValue' => '0x170a3340d372be', 'sVarGroup' => 'images', 'sVarConstrains' => '', 'iVarPos' => 2 ),
            array('sVarName' => 'aDetailImageSizes', 'sVarType' => 'aarr', 'sVarValue' => '0x4dba326a73d2cdcb471b9533d7800b4b898873f7ae9dc29ed9e0e4f6bc678f00ea1438810efd6c1fe338a39dc20247d3a63beec4852106b7a1dd7cb1451f56975c3fd6159579cd2cab97104f17ae6c45a38a41e9a5bc59ceee828bfd6883e282aef2e55d00fb7ee9abb79b63c74cb7ba3fa76665f6a9294d8bf365bf7d3d0d56faf2355df145b02498b144bc6b0ab9fc9f74d2e1dd0ac7a4989184f58b7e2c58400bb4b92c9468f3d8ca7170cde789d6c1282016056e51005091e19803a859992a5549080378f64fff88ce4c1cbdf4afd32943b63877831b221ca302652eabe106a93f9f4d1ed363f2f33c1e29716b95b8541d2f79ec8a7a1d821a46270a1bb5f32622a06655b85a31d7ee2f52dbf963fd4426a6047b0e2bc4896143076e8dbc7dd8a7448ba2a5233ec8d166b611c288134420559cc4a6f4eec2835336d4f71df0ac899e314365a321d1d774bdb9', 'sVarGroup' => 'images', 'sVarConstrains' => '', 'iVarPos' => 3 ),
            array('sVarName' => 'blShowBirthdayFields', 'sVarType' => 'bool', 'sVarValue' => '0x07', 'sVarGroup' => 'display', 'sVarConstrains' => '', 'iVarPos' => 5 ),
            array('sVarName' => 'iNewBasketItemMessage', 'sVarType' => 'select', 'sVarValue' => '0x07', 'sVarGroup' => 'display', 'sVarConstrains' => '0|1|3', 'iVarPos' => 6 ),
            array('sVarName' => 'sDefaultListDisplayType', 'sVarType' => 'select', 'sVarValue' => '0x83cd10b7f09064ed', 'sVarGroup' => '', 'sVarConstrains' => '', 'iVarPos' => 0 ),
            array('sVarName' => 'sStartPageListDisplayType', 'sVarType' => 'select', 'sVarValue' => '0x83cd10b7f09064ed', 'sVarGroup' => '', 'sVarConstrains' => '', 'iVarPos' => 0 ),
            array('sVarName' => 'aNrofCatArticles', 'sVarType' => 'arr', 'sVarValue' => '0x4dba322c77e44ef7ced6aca1143e86a8198a16', 'sVarGroup' => 'display', 'sVarConstrains' => '', 'iVarPos' => 10 ),
            array('sVarName' => 'sCatPromotionsize', 'sVarType' => 'str', 'sVarValue' => '0xb06fb441c2bd94', 'sVarGroup' => 'images', 'sVarConstrains' => '', 'iVarPos' => 8 ),
        );

        foreach ( $aThemeConfigs as $aConfigInfo ){
            self::_addThemeConfig(
                $iShopId,
                $sThemeName,
                $aConfigInfo['sVarName'],
                $aConfigInfo['sVarType'],
                $aConfigInfo['sVarValue'],
                $aConfigInfo['sVarGroup'],
                $aConfigInfo['sVarConstrains'],
                $aConfigInfo['iVarPos']
            );
        }
    }

    /**
     * Is called on module deactivation. Deletes the theme settings. Note that after deactivation the settings
     * will be lost.
     */
    public static function onDeactivate()
    {
        $iShopId = oxRegistry::getConfig()->getShopId();
        $sThemeName = self::_getThemeName();

        $sDeleteSQL = "
            DELETE
                oxconfig.*,
                oxconfigdisplay.*
            FROM `oxconfig`
                LEFT JOIN `oxconfigdisplay`
                    ON ( `oxconfig`.`OXID` = `oxconfigdisplay`.`OXID` )
            WHERE `oxconfig`.`OXMODULE` = ? AND `oxconfig`.`oxshopid` = ?
        ";

        oxDb::getDb()->Execute( $sDeleteSQL, array( 'theme:' . $sThemeName, $iShopId ) );
    }
}
