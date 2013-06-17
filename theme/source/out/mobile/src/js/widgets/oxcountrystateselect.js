/**
 * #PHPHEADER_OXID_LICENSE_INFORMATION#
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (c) OXID eSales AG 2003-#OXID_VERSION_YEAR#
 * @version   SVN: $Id: oxcountrystateselect.js 35529 2011-05-23 07:31:20Z vilma $
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
                this.getStateDropDown().parent().show();
            } else {
                this.getStateDropDown().parent().hide();
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