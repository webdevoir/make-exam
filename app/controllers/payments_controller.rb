class PaymentsController < ApplicationController
  def new
  	  @ad = Ad.find(params[:ad_id])
	  @payment = @ad.payments.build
	  if params[:PayerID]
	    @payment.paypal_customer_token = params[:PayerID]
	    @payment.paypal_payment_token = params[:token]
	    @payment.paypal_email = PayPal::Recurring.new(token: params[:token]).checkout_details.email
	  end
  end

  def create
  	@payment = Payment.new(payment_params)
  	# @payment.ad_id = Ad.find(params[:ad_id])
  	if @payment.save
  		redirect_to @payment, notice: "thanks for paying for your ad"
  	else
  		logger.info "$$$$$$$$$$$$$$$$  #{@payment.errors.full_messages.to_sentence} $$$$$$$$$$$$$$$$$$$$$$$"
  		render :new, ad_id: @payment.ad_id
  	end
  end

  def show
  	@payment = Payment.find(params[:id])
  	# @ad = Ad.find_by(id: @payment.ad_id)
  end

  def paypal_checkout
	  ad = Ad.find(params[:ad_id])
	#   subscription = user.subscriptions.build
	#   redirect_to subscription.paypal.checkout_url(
	#     return_url: new_subscription_url(:plan_id => plan.id),
	#     cancel_url: root_url
	#   )
	# end
	ppr = PayPal::Recurring.new(
			return_url: new_payment_url(ad_id: ad.id),
			cancel_url: root_url,
			description: "Payment for Makeanexam Advertisement",
			amount: params[:cost],
			currency: "USD"
		)
	response = ppr.checkout
	if response.valid?
		redirect_to response.checkout_url
	else
		raise response.errors.inspect
	end
  end

  private

  def payment_params
    params.require(:payment).permit(:paypal_customer_token, :paypal_payment_token, :paypal_email, :ad_id)
  end
end
