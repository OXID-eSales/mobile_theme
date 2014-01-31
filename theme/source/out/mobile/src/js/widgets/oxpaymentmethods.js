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

    oxPaymentMethods = {

        options: {
            paymentForm:        '#payment',
            activePaymentClass: 'active-payment'
        },

        _create: function () {
            var self = this;

            $(this.element).on("click", '.dropdown-option > a', function () {
                self.select($(this).data('selection-id'));
            });
        },

        /**
         * activate selected payment method
         *
         * @return null
         */
        select: function (sSelectionId) {
            $(this.getActivePayment()).removeClass(this.options.activePaymentClass);
            $(this.getPaymentOption(sSelectionId)).addClass(this.options.activePaymentClass);
            $(this.getPayment(sSelectionId)).prop('checked', true);
        },

        /**
         * Get payment form
         *
         * @return object
         */
        getPaymentForm: function () {
            return $(this.options.paymentForm);
        },

        /**
         * Get active payment
         *
         * @return object
         */
        getActivePayment: function () {
            return $('.payment-option.' + this.options.activePaymentClass, this.getPaymentForm());
        },

        /**
         * Get payment
         *
         * @return object
         */
        getPayment: function (sSelectionId) {
            return $('#payment_' + sSelectionId, this.getPaymentForm());
        },

        /**
         * Get payment option
         *
         * @return object
         */
        getPaymentOption: function (sSelectionId) {
            return $('#paymentOption_' + sSelectionId, this.getPaymentForm());
        }
    }

    $.widget("ui.oxPaymentMethods", oxPaymentMethods);

})(jQuery);
