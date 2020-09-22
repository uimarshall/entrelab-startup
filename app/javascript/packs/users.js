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
		// Collect the credit card fields.
		let creditCardNum = $("#card_number").val(),
			cvcNum = $("#card_code").val(),
			expMonth = $("#card_month").val(),
			expYear = $("#card_year").val();
		Stripe.createToken(
			{
				number: creditCardNum,
				cvc: cvcNum,
				exp_month: expMonth,
				exp_year: expYear,
			},
			stripeResponseHandler
		);
	});

	// Send the fields so collected to Stripe.
	// Stripe will return a card token to us in exchange of the fields sent.
	// Inject the card token received as hidden field into form.
	// Submit form with other fields already present to our Rails app.
});
