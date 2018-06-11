class Subscription < ApplicationRecord
  belongs_to :user

  # validates_presence_of :paypal_customer_token, :message => "PayPal payment must be complete" 
  # validates_presence_of :paypal_payment_token, :message => "PayPal payment must be complete"  
  # validates_presence_of :paypal_email, :message => "PayPal payment must be complete" 




	def save_with_payment
		if valid?
		  if paypal_payment_token.present?
	        save!
	      else
	        save_with_stripe_payment
	      end
		end
	end

	def save_with_stripe_payment
			Stripe.api_key = ENV['STRIPE_API_KEY']

			Stripe::Charge.create(
			  :amount => 2000,
			  :currency => "usd",
			  :source => stripe_card_token, # obtained with Stripe.js
			  :description => "Upgrade account for Makeanexam.com"
			)
			save!
	end
end
