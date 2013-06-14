/**
 * Created with JetBrains PhpStorm.
 * User: Inspiron4
 * Date: 13.6.7
 * Time: 16.29
 * To change this template use File | Settings | File Templates.
 */
( function( $ ) {
    oxSearch = {
        options: {
            searchToggleButton: ".search-toggle",
            searchForm: "#search",
            searchFormInput: "#searchParam",
            showSearchForm: false, // by default, search form is not displayed
            sHidden: "hidden"
        },
        _create: function(){
            var $this = this;

            $(this.options.searchToggleButton).on( "click", function() {
                if ( !$this.options.showSearchForm ) {
                    $($this.options.searchForm).show();
                    $($this.options.searchFormInput).focus();
                } else {
                    $($this.options.searchForm).hide();
                }
                $this.options.showSearchForm = !$this.options.showSearchForm;
            } );
        }
    }

    $.widget( "ui.oxSearch", oxSearch );

} )( jQuery );