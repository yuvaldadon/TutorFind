/* global $, Stripe, stripeResponseHandler*/
//Document ready
$(document).on('turbolinks:load', function(){
    var theForm = $('#pro_form');
    var submitBtn = $('#form-submit-btn');
    
    //Set stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
    
    //prevent default submit button
    submitBtn.click(function(){
        event.preventDefault();
        
        //Collect credit card information
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
        
        //Send card info to Stripe
        Stripe.createToken({
            number: ccNum,
            cvc: cvcNum,
            exp_month: expMonth,
            exp_year: expYear
        }, stripeResponseHandler);
    });

    
    
    //Return card token from Stripe
    
    //Add card token to db
    
    //Submit form to rails

})