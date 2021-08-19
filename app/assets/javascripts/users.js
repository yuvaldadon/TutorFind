/* global $, Stripe*/
//Document ready
$(document).on('turbolinks:load', function(){
    var theForm = $('#pro_form');
    var submitBtn = $('#form-submit-btn');
    
    //Set stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
    
    //prevent default submit button
    submitBtn.click(function(event){
        event.preventDefault();
        submitBtn.val("Processing").prop('disabled', true);
        
        //Collect credit card information
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
            
        //Use stripe JS lib to check card error
        var error = false;
        if(!Stripe.card.validateCardNumber(ccNum)) {
            error = true;
            alert('The credit card number is invalid');
        }
        if(!Stripe.card.validateCVC(cvcNum)) {
            error = true;
            alert('The CVC number is invalid');
        }
        if(!Stripe.card.validateExpiry(expMonth, expYear)) {
            error = true;
            alert('The Expiry date is invalid');
        }
        
        //Send card info to Stripe
        if (error) {
            submitBtn.prop('disabled', false).val('Sign Up');
            
        } else {
            Stripe.createToken({
            number: ccNum,
            cvc: cvcNum,
            exp_month: expMonth,
            exp_year: expYear
            }, stripeResponseHandler);
        }

        return false;
    });

    //Return card token from Stripe
    function stripeResponseHandler(status, response) {
        //Grab token
        var token = response.id;
        //Add card token to db
        theForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token) );
        //Submit form to rails
        theForm.get(0).submit();
    }

});