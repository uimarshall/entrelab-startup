/* global $, Stripe */
// Document ready.
$(document).on("turbolinks:load", function () {
	let proForm = $("#pro_form");
	let proSubmitBtn = $("#pro-submit-btn");
	// Set Stripe public key so that stripe can know whose acct is communicating.
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr("content"));
	// When user clicks form submit btn,
	proSubmitBtn.trigger(function (e) {
		// prevent default submission behaviour(which is to submit to our server).
		e.preventDefault();
		// Disable btn while form is processing
		proSubmitBtn.val("Processing").prop("disabled", true);
		// Collect the credit card fields.// Send the fields so collected to Stripe.
		let creditCardNum = $("#card_number").val(),
			cvcNum = $("#card_code").val(),
			expMonth = $("#card_month").val(),
			expYear = $("#card_year").val();
		// Use Stripe JS library to check for user input errors for card fields
		let error = false;
		// validate card number
		if (!Stripe.card.validateCardNumber(ccNum)) {
			// if there are card errors don't send to stripe
			error = true;
			alert("The credit card number appears to be invalid!");
		}
		// validate CVC number
		if (!Stripe.card.validateCVC(cvcNum)) {
			// if there are card errors don't send to stripe
			error = true;
			alert("The CVC number appears to be invalid!");
		}
		// validate expiration date
		if (!Stripe.card.validateExpiry(expMonth, expYear)) {
			// if there are card errors don't send to stripe
			error = true;
			alert("The expiration date  appears to be invalid!");
		}
		// validate expiration date
		if (error) {
			// if there are card errors don't send to stripe
			// Re-enable the button
			proSubmitBtn.prop("disabled", false).val("Sign Up");
		} else {
			// Stripe will return a card token to us in exchange of the fields sent.
			Stripe.createToken(
				{
					number: creditCardNum,
					cvc: cvcNum,
					exp_month: expMonth,
					exp_year: expYear,
				},
				stripeResponseHandler
			);
		}

		return false;
	});
	function stripeResponseHandler(status, response) {
		// Get the token from the response
		let token = response.id;
		// Inject the card token received as hidden field into form.
		proForm.append(
			$('<input type="hidden" name="user[stripe_card_token]">').val(token)
		);
		// Submit form with other fields already present to our Rails app.
		proForm.get(0).submit();
	}
});
