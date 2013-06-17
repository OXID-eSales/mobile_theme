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

( function( $ ) {

    oxDatePicker = {
        options: {
            sDayId:         'day',
            sMonthId:       'month',
            sYearId:        'year',
            sMonthsId:      'months',
            sModernFieldId: 'modernDate'
        },

        oDate: null,
        aarrMonths: [],

        _create: function() {
            var self = this,
                options = self.options,
                iDay = $( "#" + options.sDayId + " input" ).val(),
                iMonth = $( "#" + options.sMonthId + " input" ).val(),
                iYear = $( "#" + options.sYearId + " input" ).val();

            self.setGivenDate( iYear, iMonth, iDay );

            if( typeof Modernizr === "undefined" || !Modernizr.inputtypes.date ) {
                $( "#" + options.sModernFieldId ).hide();
                self.updateMonthShownField( self.getDate() );

                if ( !self.getDate() ) {
                    self.setDate( new Date() )
                }

                $( "#" + options.sDayId + " button:eq(0)" ).click( function() {
                    self.updateDayField( self.nextDay().getDate() );
                } );

                $( "#" + options.sDayId + " button:eq(1)" ).click( function() {
                    self.updateDayField( self.prevDay().getDate() );
                } );

                $( "#" + options.sMonthId + " button:eq(0)" ).click( function() {
                    self.updateMonthField( self.nextMonth().getMonth() );
                } );

                $( "#" + options.sMonthId + " button:eq(1)" ).click( function() {
                    self.updateMonthField( self.prevMonth().getMonth() );
                } );

                $( "#" + options.sYearId + " button:eq(0)" ).click( function() {
                    self.updateYearField( self.nextYear().getFullYear() );
                } );

                $( "#" + options.sYearId + " button:eq(1)" ).click( function() {
                    self.updateYearField( self.prevYear().getFullYear() );
                } );
            } else {
                $( self.element ).hide();
                self.updateFieldsOnSubmit();
            }
        },

        /**
         * Change day
         *
         * @returns Object
         */
        nextDay: function() {
            return this.addDay( 1 );
        },

        /**
         * Change day
         *
         * @returns Object
         */
        prevDay: function() {
            return this.addDay( -1 );
        },

        /**
         * Change month
         *
         * @returns Object
         */
        nextMonth: function() {
            return this.addMonth( 1 );
        },

        /**
         * Change month
         *
         * @returns Object
         */
        prevMonth: function() {
            return this.addMonth( -1 );
        },

        /**
         * Change year
         *
         * @returns Object
         */
        nextYear: function() {
            return this.addYear( 1 );
        },

        /**
         * Change year
         *
         * @returns Object
         */
        prevYear: function() {
            return this.addYear( -1 );
        },

        /**
         * Returns date
         *
         * @returns Object
         */
        getDate: function() {
            return self.oDate;
        },

        /**
         * Sets date
         *
         * @param oDate
         * @returns Object
         */
        setDate: function( oDate ) {
            self.oDate = oDate;
            return self.oDate;
        },

        /**
         * Returns month name by array key
         *
         * @param iKey
         * @returns String
         */
        getMonthName: function( iKey ) {
            var self = this;
            if ( typeof this.aarrMonths == 'undefined' || this.aarrMonths.length < 1 ) {
                $( "#" + this.options.sMonthsId + " option" ).each( function( iIndex ) {
                    iIndex++;
                    self.aarrMonths[iIndex] = $( this ).text();
                } );
            }
            return this.aarrMonths[iKey];
        },

        /**
         * Adds day
         *
         * @param iDay
         * @returns Object
         */
        addDay: function( iDay ) {
            var oDate = this.getDate(),
                oNewDate = new Date( oDate.getFullYear(), oDate.getMonth(), oDate.getDate() + iDay );
            return this.setDate( oNewDate );
        },

        /**
         * Adds month
         *
         * @param iMonth
         * @returns Object
         */
        addMonth: function( iMonth ) {
            var oDate = this.getDate(),
                oNewDate = new Date( oDate.getFullYear(), oDate.getMonth() + iMonth, oDate.getDate() );

            return this.setDate( oNewDate );
        },

        /**
         * Adds year
         *
         * @param iYear
         * @returns Object
         */
        addYear: function( iYear ) {
            var oDate = this.getDate(),
                oNewDate = new Date( oDate.getFullYear() + iYear, oDate.getMonth(), oDate.getDate() );
            return this.setDate( oNewDate );
        },

        /**
         * Sets date by given year, month and day
         *
         * @param iYear
         * @param iMonth
         * @param iDay
         */
        setGivenDate: function( iYear, iMonth, iDay ) {
            if ( iDay != '' && iMonth != '' && iYear != '' ) {
                var oDate = new Date( iYear + "-" + iMonth + "-" + iDay );
                this.setDate( oDate );
            }
        },

        /**
         * Updates input field
         * 
         * @param iVal
         */
        updateDayField: function( iVal ) {
            $( "#" + this.options.sDayId + " input" ).val( this.beautifyDateValue( iVal ) );
        },

        /**
         * Updates input field
         *
         * @param iVal
         */
        updateMonthField: function( iVal ) {
            $( "#" + this.options.sMonthId + " input:not([readonly])" ).val( iVal + 1 );
            $( "#" + this.options.sMonthId + " input[readonly]" ).val( this.getMonthName( iVal + 1 ) );
        },

        /**
         * Updates input field
         *
         * @param iVal
         */
        updateYearField: function( iVal ) {
            $( "#" + this.options.sYearId + " input" ).val( iVal );
        },

        /**
         * Updates readonly month input field
         *
         * @param oDate
         */
        updateMonthShownField: function( oDate ) {
            if ( oDate ) {
                $( "#" + this.options.sMonthId + " input[readonly]" ).val( this.getMonthName( oDate.getMonth() + 1 ) );
            }
        },

        /**
         * Changes given number to more proper value for date
         * 
         * @param iVal
         * @returns String || Integer
         */
        beautifyDateValue: function( iVal ) {
            if ( iVal < 10 ) {
                iVal = "0" + iVal;
            }
            return iVal;
        },

        /**
         * On form submit updates hidden fields
         */
        updateFieldsOnSubmit: function() {
            var self = this,
                oForm = $( self.element ).parents( "form:first" );
            $( oForm ).submit( function(){
                var sDate = $( "#" + self.options.sModernFieldId ).val().replace(/-/g,"/");
                var oDate = new Date( sDate );
                self.updateDayField( oDate.getDate() );
                self.updateMonthField( oDate.getMonth() );
                self.updateYearField( oDate.getFullYear() );
            } );
        }

    };

    $.widget("ui.oxDatePicker", oxDatePicker );

} )( jQuery );