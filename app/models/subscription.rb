class Subscription < ApplicationRecord
  belongs_to :user

  # validates_presence_of :paypal_customer_token, :message => "PayPal payment must be complete" 
  # validates_presence_of :paypal_payment_token, :message => "PayPal payment must be complete"  
  # validates_presence_of :paypal_email, :message => "PayPal payment must be complete" 




	def save_with_payment
		if valid?
			Stripe.api_key = ENV['Stripe.api_key']

			Stripe::Charge.create(
			  :amount => 2000,
			  :currency => "usd",
			  :source => stripe_card_token, # obtained with Stripe.js
			  :description => "Upgrade account for Makeanexam.com"
			)
			save!
		end
	end

end
