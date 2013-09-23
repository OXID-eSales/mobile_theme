var oECConfirmation = ( function() {

    var _oPageContainer, _oConfirmation, _oHideButton, _oPage;

    var obj = {
        init: function() {
            _oPage = $( "#page" );
            _oPageContainer = $( "#page .container" ).first();
            _oConfirmation = $( "#ECConfirmation" );
            _oHideButton = $( ".hideECConfirmation" );

            _displayConfirmation();
            _oHideButton.click( _displayContent );
        }
    }

    function _displayConfirmation() {
        _oPageContainer.hide();
        _oConfirmation.appendTo( _oPage ).show();
    }

    function _displayContent() {
        _oConfirmation.hide();
        _oPageContainer.show();

        return false;
    }

    return obj;
} )();