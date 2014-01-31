/**
 * This file is part of OXID eSales mobile theme.
 *
 * OXID eSales mobile theme is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales mobile theme is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales mobile theme.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
 */

(function ($) {

    oxCountryStateSelect = {
        options: {
            selectedStateId: "selectedStateId",
            stateSelectedEl: "stateSelectedEl",
            countryDropDownEl: "countryDropDownEl",
            countrySelectedEl: "countrySelectedEl"
        },

        _create: function () {

            var self = this;

            this.head = self.element;
            this.oCountryDropDown = this.getCountryDropDown();
            this.oCountrySelected = this.getCountrySelected();
            this.oStateSelected = this.getStateSelected();

            self.manageStateSelect(
                self.getStates(allStates, allCountryIds),
                self.getStatesValues(allStateIds, allCountryIds),
                self.options.selectedStateId
            );

            $(this.oCountrySelected).on("change", function () {
                self.manageStateSelect(
                    self.getStates(allStates, allCountryIds),
                    self.getStatesValues(allStateIds, allCountryIds),
                    self.options.selectedStateId
                );
            });
        },

        /**
         * show / hide select add/remove options
         *
         * @return object
         */
        manageStateSelect: function (aStates, aStatesValues, sSelectedStateId) {

            this.removeSelectOptions();

            if (aStates != null && aStates.length > 0) {
                this.addSelectOptions(aStatesValues, aStates, sSelectedStateId);
                this.getStateDropDown().parent().removeClass('hide');
            } else {
                this.getStateDropDown().parent().addClass('hide');
            }
        },

        /**
         * get country drop down element
         *
         * @return object
         */
        getCountryDropDown: function () {
            var oCountryDropDown = $('#' + this.options.countryDropDownEl);
            return oCountryDropDown;
        },

        /**
         * get country selected element
         *
         * @return object
         */
        getCountrySelected: function () {
            var oCountrySelected = this.oCountryDropDown.find('#' + this.options.countrySelectedEl);
            return oCountrySelected;
        },

        /**
         * get states drop down element
         *
         * @return object
         */
        getStateDropDown: function () {
            var oStateDropDown = this.head;
            return oStateDropDown;
        },

        /**
         * get state selected element
         *
         * @return object
         */
        getStateSelected: function () {
            var oStateSelected = this.getStateDropDown().find('#' + this.options.stateSelectedEl);
            return oStateSelected;
        },

        /**
         * get state selections menu
         *
         * @return object
         */
        getStateSelectionMenu: function () {
            var oStateSelectionMenu = this.getStateDropDown().find('.dropdown-menu');
            return oStateSelectionMenu;
        },

        /**
         * get state selections
         *
         * @return object
         */
        getStateSelections: function () {
            var oStateSelections = this.getStateDropDown().find('.dropdown-option');
            return oStateSelections;
        },

        /**
         * add options
         */
        addSelectOptions: function (aValues, aLables, sSelectedStateId) {
            var oStateSelectionMenu = this.getStateSelectionMenu();
            for (var x = 0; x < aValues.length; x++) {
                var oSelectionOption = this.createSelectionOption(aLables[x], aValues[x]);
                $(oStateSelectionMenu).append(oSelectionOption);
                if (sSelectedStateId == aValues[x]) {
                    $(oSelectionOption).click();
                }
            }
        },

        /**
         * remove all select options except first list promt string
         */
        removeSelectOptions: function () {
            var oStateSelections = this.getStateSelections();
            oStateSelections.remove().end();
        },

        /**
         * create selection option
         *
         * @return object
         */
        createSelectionOption: function (sName, sValue) {
            var oSelectionOption = document.createElement('li');
            $(oSelectionOption).addClass('dropdown-option');

            var oSelectionOptionData = document.createElement('a');
            $(oSelectionOptionData).attr({
                'tabindex': -1,
                'data-selection-id': sValue
            });
            $(oSelectionOptionData).html(sName);

            $(oSelectionOption).append(oSelectionOptionData);

            return oSelectionOption;
        },

        /**
         * get Country state names
         *
         * @return array
         */
        getStates: function (allStates, allCountryIds) {
            var sCountry = this.oCountrySelected.val();
            return allStates[allCountryIds[sCountry]];
        },

        /**
         * get Country state ids
         *
         * @return array
         */
        getStatesValues: function (allStatesIds, allCountryIds) {
            var sCountry = this.oCountrySelected.val();
            return allStatesIds[allCountryIds[sCountry]];
        }

    };

    $.widget("ui.oxCountryStateSelect", oxCountryStateSelect);

})(jQuery);